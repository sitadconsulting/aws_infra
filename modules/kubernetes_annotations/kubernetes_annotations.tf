resource "kubernetes_annotations" "annotations" {
  api_version          = var.annotations_api_version
  kind                 = var.annotations_kind
  #metadata {
  #  name               = var.annotations_metadata_name
  #  namespace          = var.annotations_metadata_namespace
  #}
  dynamic "metadata" {
    for_each = var.annotations_metadata
      content {
        name      = metadata.value["name"]
        namespace = metadata.value["namespace"]
      }
  }
  annotations          = var.annotations_annotations
  #template_annotations = var.annotations_template_annotations
  force                = var.annotations_force
  field_manager        = var.annotations_field_manager 
}
