resource "aws_vpc" "environment-example-amar" {
  cidr_block = "10.22.22.0/24"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags {
    Name = "terraform-aws-example-amar"
  }
}
