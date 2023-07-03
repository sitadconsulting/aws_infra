resource "kubernetes_persistent_volume_claim_v1" "persistent_volume_claim" {

  metadata {
    name        = var.persistent_volume_claim_metadata_name
    namespace   = var.persistent_volume_claim_metadata_namespace
  }
  spec {
    access_modes       = var.persistent_volume_claim_spec_access_modes
    volume_name        = var.persistent_volume_claim_spec_volume_name
    storage_class_name = var.persistent_volume_claim_spec_storage_class_name

    dynamic "resources" {
      for_each = var.persistent_volume_claim_spec_resources
        content {
          limits   = resources.value["limits"]
          requests = resources.value["requests"]
        }
    }
    dynamic "selector" {
      for_each = var.persistent_volume_claim_spec_selector
        content {
          dynamic "match_expressions" {
            for_each = selector.value.match_expressions
              content {
                key      = match_expressions.value["key"]
                operator = match_expressions.value["operator"]
                values   = match_expressions.value["values"]
              }
          }
        }
    }
  }
}
