resource "aws_redshift_hsm_configuration" "redshift_hsm_configuration" {
  description                   = var.redshift_hsm_configuration_description
  hsm_configuration_identifier  = var.redshift_hsm_configuration_hsm_configuration_identifier
  hsm_ip_address                = var.redshift_hsm_configuration_hsm_ip_address
  hsm_partition_name            = var.redshift_hsm_configuration_hsm_partition_name
  hsm_partition_password        = var.redshift_hsm_configuration_hsm_partition_password
  hsm_server_public_certificate = var.redshift_hsm_configuration_hsm_server_public_certificate
  tags                          = var.redshift_hsm_configuration_tags
}
