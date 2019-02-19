/* This is a multi-line comment. This is a multi-line comment. This is a multi-line comment. This is a multi-line comment. This is a multi-line comment. This is a multi-line comment. */
provider "aws" {
  #region = "ca-central-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"

}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

# This is a single-line comment
resource "aws_instance" "base" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  key_name = "a4media-key"

  tags {
    Name = "a4media-base"
  }

}

resource "aws_eip" "base" {
  instance = "${aws_instance.base.id}"
  vpc = true
}

