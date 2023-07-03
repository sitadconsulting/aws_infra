resource "kubernetes_storage_class_v1" "storage_class" {

  metadata {
    annotations = var.storage_class_metadata_annotations
    labels      = var.storage_class_metadata_labels
    name        = var.storage_class_metadata_name
  }
  parameters             = var.storage_class_parameters
  storage_provisioner    = var.storage_class_storage_provisioner
  reclaim_policy         = var.storage_class_reclaim_policy
  volume_binding_mode    = var.storage_class_volume_binding_mode
  allow_volume_expansion = var.storage_class_allow_volume_expansion 
  mount_options          = var.storage_class_mount_options  

  dynamic "allowed_topologies" {
    for_each  = var.storage_class_allowed_topologies
      content {
        dynamic "match_label_expressions" {
          for_each = allowed_topologies.value.match_label_expressions
            content {
              key    = match_label_expressions.value["key"]
              values = match_label_expressions.value["values"]
            }
        }
       
      }
  }  
}
