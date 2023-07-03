resource "kubernetes_config_map_v1" "config_map" {

  #metadata {
  #  annotations = var.config_map_metadata_annotations
  #  labels      = var.config_map_metadata_labels
  #  name        = var.config_map_metadata_name
  #  namespace   = var.config_map_metadata_namespace
  #}
  
  binary_data = var.config_map_binary_data 
  data        = var.config_map_data
  immutable   = var.config_map_immutable

  dynamic "metadata" {
    for_each = var.config_map_metadata
      content {
        name        = metadata.value["name"]
        namespace   = metadata.value["namespace"]
      }
  }
  lifecycle {
    ignore_changes = all
  } 
}
