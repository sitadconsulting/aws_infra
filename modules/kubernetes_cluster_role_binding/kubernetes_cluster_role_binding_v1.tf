resource "kubernetes_cluster_role_binding_v1" "cluster_role_binding" {

  metadata {
    annotations = var.cluster_role_binding_metadata_annotations
    labels      = var.cluster_role_binding_metadata_labels
    name        = var.cluster_role_binding_metadata_name
  }
  role_ref {
    api_group = var.cluster_role_binding_role_ref_api_group
    kind      = var.cluster_role_binding_role_ref_kind
    name      = var.cluster_role_binding_role_ref_name
  }
  dynamic "subject" {
    for_each = var.cluster_role_binding_subjects
      content {
        api_group = lookup(subject.value, "api_group", null)
        kind      = lookup(subject.value, "kind", null)
        name      = lookup(subject.value, "name", null)
        namespace = lookup(subject.value, "namespace", null)
      }
  }
}
