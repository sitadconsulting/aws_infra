output "eks_capability_arn" {
  description = "ARN of the capability"
  value       = element(concat(aws_eks_capability.eks_capability.*.arn, [""]), 0)
}
output "eks_capability_version" {
  description = "Version of the capability"
  value       = element(concat(aws_eks_capability.eks_capability.*.version, [""]), 0)
}
