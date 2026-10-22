output "key_pair_arn" {
  description = "Key pair ARN"
  value       = element(concat(aws_key_pair.key_pair.*.arn, [""]), 0)
}
utput "key_pair_fingerprint" {
  description = "MD5 public key fingerprint as specified in section 4 of RFC 4716"
  value       = element(concat(aws_key_pair.key_pair.*.fingerprint, [""]), 0)
}
utput "key_pair_id" {
  description = "Key pair name"
  value       = element(concat(aws_key_pair.key_pair.*.id, [""]), 0)
}
output "key_pair_key_name" {
  description = "Key pair name"
  value       = element(concat(aws_key_pair.key_pair.*.key_name, [""]), 0)
}
output "key_pair_key_pair_id" {
  description = "Key pair ID"
  value       = element(concat(aws_key_pair.key_pair.*.key_pair_id, [""]), 0)
}
output "key_pair_key_type" {
  description = "Type of key pair"
  value       = element(concat(aws_key_pair.key_pair.*.key_type, [""]), 0)
}
