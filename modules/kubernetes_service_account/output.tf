output "service_account_name" {
  description = "Name of this service account"
  value       = kubernetes_service_account_v1.service_account.metadata[0].name
}
output "service_account_namespace" {
  description = "Namespace of this service account"
  value       = kubernetes_service_account_v1.service_account.metadata[0].namespace
}
