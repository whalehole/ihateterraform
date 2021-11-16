//servers.tf

data "aws_ami" "amazon-linux-2" {
  owners = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

variable "key_name" {}

resource "aws_instance" "test-ec2-instance" {
  instance_type = "t2.micro"
  ami           = "${data.aws_ami.amazon-linux-2.id}"
  key_name = var.key_name
  security_groups = ["${aws_security_group.ingress-all-test.id}", "${aws_security_group.ingress-ssh.id}"]
tags = {
    Name = "restricted-server"
  }
subnet_id = "${aws_subnet.subnet-uno.id}"
}
