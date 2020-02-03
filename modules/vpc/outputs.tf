output aws_subnet_cloud {
  description = "Subnet for the cloud"
  value       = aws_subnet.cloud.id
}

output vpc {
  description = "VPC id"
  value       = aws_vpc.default.id
}
