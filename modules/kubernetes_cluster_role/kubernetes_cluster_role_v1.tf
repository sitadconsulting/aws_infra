resource "kubernetes_cluster_role_v1" "cluster_role" {

  metadata {
    annotations = var.cluster_role_metadata_annotations
    labels      = var.cluster_role_metadata_labels
    name        = var.cluster_role_metadata_name
  }

  dynamic "rule" {
    for_each = var.cluster_role_rules
      content {
        api_groups = lookup(rule.value, "api_groups", null)
        resources  = lookup(rule.value, "resources", null)
        verbs      = lookup(rule.value, "verbs", null)
      }
  }
}
