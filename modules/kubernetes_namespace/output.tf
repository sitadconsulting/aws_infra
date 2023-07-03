output "kube_namespace" {
  description = "Name of this namespace object"
  value       = kubernetes_namespace_v1.namespace.metadata[0].name
}

