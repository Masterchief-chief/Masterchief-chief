# Module that defines the VPC
module "vpc" {
 source = "./vpc"

 vpc_cidr_block = "${var.vpc_cidr_block}"
 vpc_name = "${var.vpc_name}"

}


# Public Subnet module which creates a subnet, internet gateway, route table and attaches it to subnet making it public subnet
module "pub-subnet" {
  source = "./public_subnet"

  vpc_id = "${module.vpc.vpc_id}"
  pub_cidr_block = "${var.pub_cidr_block}"
  availability_zone = "${var.availability_zone[0]}"
}


# Declares a private subnet
module "pvt-subnet1" {
  source = "./private_subnet"

  vpc_id = "${module.vpc.vpc_id}"
  pvt_cidr_block = "${var.pvt_cidr_block1}"
  availability_zone = "${var.availability_zone[1]}"

}

# Another Private Subnet
module "pvt-subnet2" {
  source = "./private_subnet"

  vpc_id = "${module.vpc.vpc_id}"
  pvt_cidr_block = "${var.pvt_cidr_block2}"
  availability_zone = "${var.availability_zone[2]}"

}

# Declares instance in public subnet
module "pub-instance" {
  source = "./instance"

  ami = "${var.ami}"
  subnet_id = "${module.pub-subnet.pub_subnet_id}"
  instance_type = "${var.instance_type}"
  instance_name = "${var.instance_name}"
  associate_public_ip_address = "${var.associate_public_ip_address[0]}"
  userdata = ""
}

# Declare RDS instance with a security group attached
module "pvt-rds" {
  source = "./rds"

  subnet1 = "${module.pvt-subnet1.pvt_subnet_id}"
  subnet2 = "${module.pvt-subnet2.pvt_subnet_id}"
  subnet_group_name = "${var.subnet_group_name}"

}

#Declare instance in private subnet and connects to rds
module "pvt-instance" {
  source = "./instance"
  
  depends_on = [module.pvt-rds]
  ami = "${var.ami}"
  subnet_id = "${module.pvt-subnet1.pvt_subnet_id}"
  instance_type = "${var.instance_type}"
  instance_name = "${var.instance_name}"
  associate_public_ip_address = "${var.associate_public_ip_address[1]}"
  userdata = "${var.userdata}"

}
