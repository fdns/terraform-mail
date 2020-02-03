output security_group_cloud {
  description = "Security group name for instances"
  value       = aws_security_group.cloud.id
}