# terraform-mail
![Terraform GitHub Actions](https://github.com/fdns/terraform-mail/workflows/Terraform%20GitHub%20Actions/badge.svg)

Terraform setup for a mail service using spot instances in AWS.

This terraform repository setup:
- VPC
- SSH Access
- Security Groups
- Instace (Spot Instance Request, EIP)

The instance is a *t3a.nano*, and is configured with the ansible repository at [fdns/ansible-mail](https://github.com/fdns/ansible-mail)
