resource "kubernetes_ingress_class" "ingress_class" {

   metadata {
    annotations = var.ingress_class_metadata_annotations
    labels      = var.ingress_class_metadata_labels
    name        = var.ingress_class_metadata_name
  }

  spec {
    controller = var.ingress_class_spec_controller
    dynamic "parameters" {
      for_each = var.ingress_class_spec_parameters
        content {
          api_group = parameters.value["api_group"]
          kind      = parameters.value["kind"]
          name      = parameters.value["name"]
          namespace = parameters.value["namespace"]
          scope     = parameters.value["scope"]
        }
    }
  }
}
