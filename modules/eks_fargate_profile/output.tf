output "eks_fargate_profile_arn" {
  description = "ARN of the EKS Fargate Profile"
  value       = element(concat(aws_eks_fargate_profile.eks_fargate_profile.*.arn, [""]), 0)
}
output "eks_fargate_profile_id" {
  description = "EKS Cluster name and EKS Fargate Profile name separated by a colon (:)"
  value       = element(concat(aws_eks_fargate_profile.eks_fargate_profile.*.id, [""]), 0)
}
output "eks_fargate_profile_status" {
  description = "Status of the EKS Fargate Profile"
  value       = element(concat(aws_eks_fargate_profile.eks_fargate_profile.*.status, [""]), 0)
}
