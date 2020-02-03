locals {
  mail_ports = list("25", "80", "443", "143", "587", "995")
}

resource "aws_security_group" "cloud" {
  name_prefix = "cloud_security"
  description = "Used in the terraform"
  vpc_id      = "${var.vpc}"

  ingress {
    description = "SSH access from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = local.mail_ports

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    description = "Outbound internet access"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Connection between instances"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    self        = true
  }

  tags = {
    project = var.project
  }
}
