resource "aws_vpc" "environment-example-amar" {
  cidr_block = "10.22.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags {
    Name = "terraform-aws-example-amar"
  }
}

resource "aws_subnet" "amar-subnet1" {
  cidr_block = "${cidrsubnet(aws_vpc.environment-example-amar.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.environment-example-amar.id}"
  availability_zone = "ap-south-1a"
  tags {
    Name = "amar-terraform-subnet-1"
  }
}

resource "aws_subnet" "amar-subnet2" {
  cidr_block = "${cidrsubnet(aws_vpc.environment-example-amar.cidr_block, 2, 2)}"
  vpc_id = "${aws_vpc.environment-example-amar.id}"
  availability_zone = "ap-south-1b"
  tags {
    Name = "amar-terraform-subnet-2"
  }
}

resource "aws_security_group" "amar-subnet-security" {
  vpc_id = "${aws_vpc.environment-example-amar.id}"

  ingress {
    cidr_blocks = [
      "${aws_vpc.environment-example-amar.cidr_block}"
    ]

    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
}
