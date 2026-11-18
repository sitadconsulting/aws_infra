resource "aws_emr_security_configuration" "emr_security_configuration" {
  name          = var.emr_security_configuration_name
  name_prefix   = var.emr_security_configuration_name_prefix
  configuration = var.emr_security_configuration_configuration
}
