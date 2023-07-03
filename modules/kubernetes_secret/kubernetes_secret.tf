resource "kubernetes_secret_v1" "secret" {

  metadata {
    annotations = var.secret_metadata_annotations
    labels      = var.secret_metadata_labels
    name        = var.secret_metadata_name
    namespace   = var.secret_metadata_namespace
  }

  data                           = var.secret_data
  binary_data                    = var.secret_binary_data
  type                           = var.secret_type
  immutable                      = var.secret_immutable
  wait_for_service_account_token = var.secret_wait_for_service_account_token
}
