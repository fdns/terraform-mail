# General
variable project {
  description = "Project name, used for tagging the resources"
  type        = string
}

variable region {
  description = "Region of the main deployment"
  type        = string
}

variable availability_zone {
  description = "Main availability zone of the resource"
  type        = string
}

# SSH
variable sshkey {}

# VPC
variable vpc_cidr {}
variable cloud_cidr {}

# instances
variable default_ami {}
