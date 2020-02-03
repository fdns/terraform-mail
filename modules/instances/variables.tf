variable project {}
variable availability_zone {}

variable security_group {
  description = "Name of the security group for the instances"
  type        = string
}

variable subnet_cloud {
  description = "Subnetwork used to deploy the instance"
  type        = string
}

variable ssh_key {
  description = "Name of the deployer ssh key"
  type        = string
}

variable default_ami {
  description = "AMI of the database instance"
  type        = string
}
