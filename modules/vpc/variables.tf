variable project {}
variable region {}
variable availability_zone {}

variable cloud_cidr {
  description = "Main CIDR used by the project"
  type        = string
}

variable vpc_cidr {
  description = "CIDR used by the cloud installation"
  type        = string
}
