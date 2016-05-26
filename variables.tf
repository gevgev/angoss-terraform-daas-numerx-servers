variable "access_key" { 
  description = "AWS access key"
}

variable "secret_key" { 
  description = "AWS secret access key"
}

variable "region"     				{ default = "us-west-2" }
variable "zone" 					{ default = "us-west-2b"}
variable "vpc_id"       			{ default = "vpc-e2f74186" }
variable "subnet_id"    			{ default = "subnet-05f97861" }
variable "vpc_security_group_id"    { default = "sg-69edf50e" }

/* Ubuntu 14.04 amis by region */
variable "amis" {
  description = "Base AMI to launch the instances with"
  default = {
    us-west-2 = "ami-9abea4fb" 
  }
}

variable "instances" {
	description = "Number of angoss worker instances to launch. 0 = shut down everything"
}
