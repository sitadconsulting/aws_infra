output "eks_pod_identity_association_association_arn" {
  description = "ARN of the association"
  value       = element(concat(aws_eks_pod_identity_association.eks_pod_identity_association.*.association_arn, [""]), 0)
}
output "eks_pod_identity_association_association_id" {
  description = "The ID of the association"
  value       = element(concat(aws_eks_pod_identity_association.eks_pod_identity_association.*.association_id, [""]), 0)
}
output "eks_pod_identity_association_external_id" {
  description = "The unique identifier for this association for a target IAM role. You put this value in the trust policy of the target role, in a Condition to match the sts.ExternalId"
  value       = element(concat(aws_eks_pod_identity_association.eks_pod_identity_association.*.external_id, [""]), 0)
}
