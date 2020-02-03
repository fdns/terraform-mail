resource "aws_eip" "postfix" {
  vpc = true

  tags = {
    project   = var.project
    protected = "false"
  }
}
