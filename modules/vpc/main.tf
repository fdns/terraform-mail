resource "aws_vpc" "default" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    project = var.project
  }
}

resource "aws_subnet" "cloud" {
  availability_zone       = var.availability_zone
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = var.cloud_cidr
  map_public_ip_on_launch = true

  tags = {
    project = var.project
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.default.id

  tags = {
    project = var.project
  }
}

resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    project = var.project
  }
}

resource "aws_route_table_association" "rt_public_association" {
  subnet_id      = "${aws_subnet.cloud.id}"
  route_table_id = "${aws_route_table.rt_public.id}"
}

/*
resource "aws_vpc_endpoint" "s3_connection" {
    vpc_id = aws_vpc.default.id
    service_name = "com.amazonaws.${var.region}.s3"
    route_table_ids = [ aws_route_table.rt_public.id ]
    policy = <<POLICY
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": "*",
                "Action": "*",
                "Resource": [
                    "arn:aws:s3:::amazonlinux.us-east-2.amazonaws.com",
                    "arn:aws:s3:::amazonlinux.us-east-2.amazonaws.com/*",
                ]
            }
        ]
    }
    POLICY
    
    tags = {
      project = var.project
    }
}

resource "aws_vpc_endpoint" "ecr_connection" {
    vpc_id = aws_vpc.default.id
    service_name = "com.amazonaws.${var.region}.ecr.dkr"
    route_table_ids = [ aws_route_table.rt_public.id ]
    policy = <<POLICY
    {
        "Version": "2019-11-18",
        "Statement": [
            {
                "Action": "*",
                "Effect": "Deny",
                "Resource": "*",
                "Principal": "*"
            }
        ]
    }
    POLICY

    tags = {
      project = var.project
    }
}
*/
