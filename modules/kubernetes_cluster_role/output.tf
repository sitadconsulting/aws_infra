output "kube_cluster_role_name" {
  description = "Name of this service account"
  value       = kubernetes_cluster_role_v1.cluster_role.metadata[0].name
}
