
variable "aws_region" {
  type        = string
  default     = "us-west-2"
  description = "AWS region"
}

variable "vpc" {
  default = "vpc-e687369e"
  description = "Default vpc_id for us-west-2"
}

variable "my_web_server_ami_id" {
  default = "ami-00ee4df451840fa9d"
  description = "AMI image for instance"
}

variable "my_web_server_instance_type" {
  default = "t2.micro"
  description = "Instance type"
}

variable "subnet_a" {
  default = "subnet-7f89a534"
  description = "us-west-2a"
}

variable "my_web_server_key_name" {
  default = "Stas_us-west-2"
}

variable "my_web_server_root_volume_size" {
  default = "8"
  description = "Primary volume size"
}

variable "my_web_server_root_volume_type" {
  default = "gp2"
}