resource "aws_kms_custom_key_store" "kms_custom_key_store" {
  cloud_hsm_cluster_id                = var.kms_custom_key_store_cloud_hsm_cluster_id
  custom_key_store_name               = var.kms_custom_key_store_custom_key_store_name
  custom_key_store_type               = var.kms_custom_key_store_custom_key_store_type
  key_store_password                  = var.kms_custom_key_store_key_store_password
  trust_anchor_certificate            = var.kms_custom_key_store_trust_anchor_certificate
  xks_proxy_connectivity              = var.kms_custom_key_store_xks_proxy_connectivity
  xks_proxy_uri_endpoint              = var.kms_custom_key_store_xks_proxy_uri_endpoint
  xks_proxy_uri_path                  = var.kms_custom_key_store_xks_proxy_uri_path
  xks_proxy_vpc_endpoint_service_name = var.kms_custom_key_store_xks_proxy_vpc_endpoint_service_name

  dynamic "xks_proxy_authentication_credential" {
    for_each = var.kms_custom_key_store_xks_proxy_authentication_credential
      content {
        access_key_id         = xks_proxy_authentication_credential.value["access_key_id"]
        raw_secret_access_key = xks_proxy_authentication_credential.value["raw_secret_access_key"]
      }
  }
}
