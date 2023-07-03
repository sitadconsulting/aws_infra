resource "kubernetes_service_account_v1" "service_account" {

  automount_service_account_token = var.service_account_automount_service_account_token

  metadata {
    annotations = var.service_account_metadata_annotations
    labels      = var.service_account_metadata_labels
    name        = var.service_account_metadata_name
    namespace   = var.service_account_metadata_namespace
  }
  dynamic "image_pull_secret" {
    for_each = var.service_account_image_pull_secret
      content {
        name  =  image_pull_secret.value["name"]
      }
  }
  dynamic "secret" {
    for_each = var.service_account_secret
      content {  
        name = secret.value["name"]
      }
  }

}
