output "eks_access_policy_association_associated_access_policy" {
  description = "Contains information about the access policy association"
  value       = element(concat(aws_eks_access_policy_association.eks_access_policy_association.*.associated_access_policy, [""]), 0)
}
