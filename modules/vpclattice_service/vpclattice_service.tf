resource "aws_vpclattice_service" "vpclattice_service" {
  name               = var.vpclattice_service_name
  auth_type          = var.vpclattice_service_auth_type
  certificate_arn    = var.vpclattice_service_certificate_arn
  custom_domain_name = var.vpclattice_service_custom_domain_name
  tags               = var.vpclattice_service_tags
}
