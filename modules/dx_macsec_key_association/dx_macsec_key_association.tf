resource "aws_dx_macsec_key_association" "dx_macsec_key_association" {
  cak           = var.dx_macsec_key_association_cak
  ckn           = var.dx_macsec_key_association_ckn
  connection_id = var.dx_macsec_key_association_connection_id
  secret_arn    = var.dx_macsec_key_association_secret_arn
}
