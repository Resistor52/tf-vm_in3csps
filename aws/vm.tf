data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "vm_instance" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = "t2.micro"
  key_name                = aws_key_pair.hitc.key_name
  vpc_security_group_ids  = [aws_security_group.hitc-sg.id]
  subnet_id               = aws_subnet.hitc-subnet.id
  # user_data              = file("workstation1.sh")

  tags = {
    Name = "hitc"
  }
}
