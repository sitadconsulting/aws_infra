output "eks_identity_provider_config_arn" {
  description = "ARN of the EKS Identity Provider Configuration"
  value       = element(concat(aws_eks_identity_provider_config.eks_identity_provider_config.*.arn, [""]), 0)
}
output "eks_identity_provider_config_id" {
  description = "EKS Cluster name and EKS Identity Provider Configuration name separated by a colon (:)"
  value       = element(concat(aws_eks_identity_provider_config.eks_identity_provider_config.*.id, [""]), 0)
}
output "eks_identity_provider_config_status" {
  description = "Status of the EKS Identity Provider Configuration"
  value       = element(concat(aws_eks_identity_provider_config.eks_identity_provider_config.*.status, [""]), 0)
}
