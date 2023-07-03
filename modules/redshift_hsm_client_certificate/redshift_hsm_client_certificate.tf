resource "aws_redshift_hsm_client_certificate" "redshift_hsm_client_certificate" {
  hsm_client_certificate_identifier = var.redshift_hsm_client_certificate_hsm_client_certificate_identifier
  tags                              = var.redshift_hsm_client_certificate_tags
}
