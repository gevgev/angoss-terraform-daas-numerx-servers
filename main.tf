provider "aws" {
  access_key  = "${var.access_key}"
  secret_key  = "${var.secret_key}"
  region      = "${var.region}"
}

/* App servers */
resource "aws_instance" "app-daas-numerx" {
  count = "${var.instances}"
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "m4.2xlarge"
  subnet_id = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.vpc_security_group_id}"]
  key_name = "${aws_key_pair.deployer-daas-numerx.key_name}"
  source_dest_check = false
  /* the user_data installs Docker
  user_data = "${file(\"cloud-config/app.yml\")}"
  */
  tags = { 
    Name = "daas-numerx-app-${count.index}"
  }
}

resource "aws_ebs_volume" "app-numerx-volume" {
    count = "${var.instances}"
    /* availability_zone = "${var.region}" */
    availability_zone = "${var.zone}"
    size = 512
    tags {
        Name = "nx-hdd-${count.index}"
    }
}

resource "aws_volume_attachment" "ebs_att" {
  count = "${var.instances}"
  device_name = "/dev/sdh"
  volume_id = "${aws_ebs_volume.app-numerx-volume.id}"
  instance_id = "${aws_instance.app-daas-numerx.id}"
}

