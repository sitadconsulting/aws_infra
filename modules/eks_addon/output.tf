output "eks_addon_arn" {
  description = "ARN of the EKS add-on"
  value       = element(concat(aws_eks_addon.eks_addon.*.arn, [""]), 0)
}
output "eks_addon_id" {
  description = "EKS Cluster name and EKS Addon name separated by a colon (:)"
  value       = element(concat(aws_eks_addon.eks_addon.*.id, [""]), 0)
}
output "eks_addon_configuration_values" {
  description = "Configuration values for addons"
  value       = element(concat(aws_eks_addon.eks_addon.*.configuration_values, [""]), 0)
}
