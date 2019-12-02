# Create VPC 
resource "aws_vpc" "k8s" {
  cidr_block = "${var.vpc_cidr}"
  #instance_tenancy = "dedicated"
  enable_dns_hostnames = "true"
  tags = {
    Name = "${var.vpc_name}"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.k8s.id}"

  tags = {
    Name = "k8s"
  }
}


# Upload public key
#resource "aws_key_pair" "kops_admin" {
 # key_name   = "kops_admin"
  #public_key = "${var.public_key}"
#}

# Create DNS zone
//resource "aws_route53_zone" "public" {
  //name = "k8s.local"

  //tags = {
    //Name = "public"
  //}
//}

# Create DNS zone
//resource "aws_route53_zone" "private" {
  //name = "levsky.net"

  //vpc {
    //vpc_id = "${aws_vpc.k8s_1.id}"
  //}

  //tags = {
    //Name = "private"
  //}
//}

