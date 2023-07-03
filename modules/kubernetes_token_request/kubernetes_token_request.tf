resource "kubernetes_token_request_v1" "token_request" {

  metadata {
    annotations = var.token_request_metadata_annotations
    labels      = var.token_request_metadata_labels
    name        = var.token_request_metadata_name
    namespace   = var.token_request_metadata_namespace
  }

  dynamic "spec" {
    for_each = var.token_request_spec
      content = {
        audiences          = spec.value["audiences"]
        expiration_seconds = spec.value["expiration_seconds"]
        dynamic "bound_object_ref" {
          for_each = spec.value.bound_object_ref
            content = {
              api_version = bound_object_ref.value["api_version"]
              kind        = bound_object_ref.value["kind"]
              name        = bound_object_ref.value["name"]
              uid         = bound_object_ref.value["uid"]
            }
        }
      }
  }
}
