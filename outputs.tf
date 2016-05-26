output "app-daas-numerx.0.ip" {
  value = "${aws_instance.app-daas-numerx.0.private_ip}"
}

output "app-daas-numerx.1.ip" {
  value = "${aws_instance.app-daas-numerx.1.private_ip}"
}
