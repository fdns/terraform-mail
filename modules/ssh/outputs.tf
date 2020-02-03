output ssh_key {
  description = "default ssh key name installed in the instances"
  value       = aws_key_pair.deployer.key_name
}
