output "secret_annotations" {
  description = "Annotations set for this secret"
  value       = kubernetes_secret_v1.secret.metadata[0].annotations
}
output "secret_name" {
  description = "Name of this secret"
  value       = kubernetes_secret_v1.secret.metadata[0].name
}
output "secret_namespace" {
  description = "Namespace of this secret"
  value       = kubernetes_secret_v1.secret.metadata[0].namespace
}

