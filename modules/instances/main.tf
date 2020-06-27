resource "aws_spot_instance_request" "postfix" {
  availability_zone           = var.availability_zone
  ami                         = var.default_ami
  instance_type               = "t3.nano"
  subnet_id                   = var.subnet_cloud
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${var.security_group}"]
  key_name                    = var.ssh_key
  private_ip                  = "10.210.2.20"

  root_block_device {
    volume_type = "standard"
    #volume_type           = "gp2"
    volume_size           = 8
    delete_on_termination = true
  }

  spot_price                      = 0.0020
  instance_interruption_behaviour = "stop"
  spot_type                       = "persistent"
  valid_until                     = "2030-01-01T00:00:00Z"

  tags = {
    Name      = "Postfix"
    project   = var.project
    protected = "false"
  }
}


resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_spot_instance_request.postfix.spot_instance_id
  allocation_id = aws_eip.postfix.id
}
