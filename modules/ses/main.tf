resource "aws_ses_domain_identity" "espinoza_dev" {
  domain = "espinoza.dev"
}

resource "aws_ses_domain_dkim" "espinoza_dev" {
  domain = "${aws_ses_domain_identity.espinoza_dev.domain}"
}
