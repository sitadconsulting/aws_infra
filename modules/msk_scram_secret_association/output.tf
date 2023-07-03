output "msk_scram_secret_association_id" {
  description = "ARN of the MSK cluster "
  value       = element(concat(aws_msk_scram_secret_association.msk_scram_secret_association.*.id, [""]), 0)
}
