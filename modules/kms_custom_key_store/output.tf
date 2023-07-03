output "kms_custom_key_store_id" {
  description = "The Custom Key Store ID"
  value       = element(concat(aws_kms_custom_key_store.kms_custom_key_store.*.id, [""]), 0)
}
