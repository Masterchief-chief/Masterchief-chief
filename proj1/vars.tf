variable "vpc_name" {
  description = "Vpc name."
  type = string
}

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type = string
}

variable "vpc_id" {
  description = "VPC id of the subnet"
  type = string
}

variable "pub_cidr_block" {
  description = "Public subnet cidr"
  type = string
}

variable "availability_zone" {
  description = "Availability Zone"
  type = list
}

variable "pvt_cidr_block1" {
  description = "CIDR block for first private subnet"
  type = string
}

variable "pvt_cidr_block2" {
  description = "CIDR block for second private subnet"
  type = string
}

variable "ami" {
  description = "AMI of instance"
  type = string
}

variable "instance_type" {
  description = "Type of instance"
  type = string
}


variable "instance_name" {
  description = "Name of the instance"
  type = string
}

variable "subnet_group_name" {
  description = "Subnet Group name attached to rds"
  type = string
}

variable "associate_public_ip_address" {
  description = "Associate public ip or not"
  type = list
}

variable "userdata" {
  description = "User data for the instance"
  type = string
}
