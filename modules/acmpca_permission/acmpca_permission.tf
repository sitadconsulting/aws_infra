resource "aws_acmpca_permission" "acmpca_permission" {
  certificate_authority_arn = var.acmpca_permission_certificate_authority_arn
  actions                   = var.acmpca_permission_actions
  principal                 = var.acmpca_permission_principal
  source_account            = var.acmpca_permission_source_account
}

