resource "aws_dx_macsec_key_association" "dx_macsec_key_association" {
  cak            = var.dx_macsec_key_association_cak
  cak_wo         = var.dx_macsec_key_association_cak_wo
  cak_wo_version = var.dx_macsec_key_association_cak_wo_version
  ckn            = var.dx_macsec_key_association_ckn
  ckn_wo         = var.dx_macsec_key_association_ckn_wo
  ckn_wo_version = var.dx_macsec_key_association_ckn_wo_version
  connection_id  = var.dx_macsec_key_association_connection_id
  secret_arn     = var.dx_macsec_key_association_secret_arn
}
