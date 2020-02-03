resource "aws_key_pair" "deployer" {
  key_name_prefix = "cloud"
  public_key      = var.sshkey
}
