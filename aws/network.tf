resource "aws_vpc" "hitc-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true" #gives you an internal domain name
  enable_dns_hostnames = "true" #gives you an internal host name
  enable_classiclink   = "false"
  instance_tenancy     = "default"

  tags = {
    Name = "hitc-vpc"
  }
}

resource "aws_subnet" "hitc-subnet" {
  vpc_id                  = aws_vpc.hitc-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" #it makes this a public subnet
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "hitc-subnet"
  }
}

resource "aws_internet_gateway" "hitc-igw" {
  vpc_id = aws_vpc.hitc-vpc.id
  tags = {
    Name = "hitc-igw"
  }
}

resource "aws_route_table" "hitc-rtble" {
  vpc_id = aws_vpc.hitc-vpc.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.hitc-igw.id
  }

  tags = {
    Name = "hitc-rtble"
  }
}

resource "aws_route_table_association" "hitc-rta" {
  subnet_id      = aws_subnet.hitc-subnet.id
  route_table_id = aws_route_table.hitc-rtble.id
}

resource "aws_security_group" "hitc-sg" {
  name   = "hitc-sg"
  vpc_id = aws_vpc.hitc-vpc.id
}

resource "aws_security_group_rule" "sg-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
  security_group_id = aws_security_group.hitc-sg.id
}

resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.hitc-sg.id
}
