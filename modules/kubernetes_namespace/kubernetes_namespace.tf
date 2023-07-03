resource "kubernetes_namespace_v1" "namespace" {

  metadata {
    annotations = var.namespace_annotations
    labels      = var.namespace_labels
    name        = var.namespace_name
  }
}
