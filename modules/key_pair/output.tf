output "key_pair_id" {
  description = "ID of the created key pair"
  value       = element(concat(aws_key_pair.key_pair.*.id, [""]), 0)
}
output "key_pair_arn" {
  description = "ARN of the created key pair"
  value       = element(concat(aws_key_pair.key_pair.*.arn, [""]), 0)
}
output "key_pair_name" {
  description = "Name of the created key pair"
  value       = element(concat(aws_key_pair.key_pair.*.key_name, [""]), 0)
}
