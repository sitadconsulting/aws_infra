output "msk_single_scram_secret_association_cluster_arn" {
  description = "(Required, Forces new resource) ARN of the MSK cluster"
  value       = element(concat(aws_msk_single_scram_secret_association.msk_single_scram_secret_association.*.cluster_arn, [""]), 0)
}
output "msk_single_scram_secret_association_secret_arn" {
  description = "(Required, Forces new resource) AWS Secrets Manager secret ARN"
  value       = element(concat(aws_msk_single_scram_secret_association.msk_single_scram_secret_association.*.secret_arn, [""]), 0)
}
