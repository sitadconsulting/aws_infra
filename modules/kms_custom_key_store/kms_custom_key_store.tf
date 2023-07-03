resource "aws_kms_custom_key_store" "kms_custom_key_store" {
  cloud_hsm_cluster_id     = var.kms_custom_key_store_cloud_hsm_cluster_id
  custom_key_store_name    = var.kms_custom_key_store_custom_key_store_name
  key_store_password       = var.kms_custom_key_store_key_store_password
  trust_anchor_certificate = var.kms_custom_key_store_trust_anchor_certificate
}
