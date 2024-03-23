output "access_entry_arn" {
  description = "ARN of the Access Entry"
  value       = element(concat(aws_eks_access_entry.eks_access_entry.*.arn, [""]), 0)
}
