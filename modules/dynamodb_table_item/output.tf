output "dynamodb_table_itemt_hash_key_value" {
  description = "Canonical string representation of the hash key value. Binary values are base64-encoded; numbers and strings are taken verbatim"
  value       = element(concat(aws_dynamodb_table_item.dynamodb_table_item.*.hash_key_value, [""]), 0)
}
output "dynamodb_table_itemt_range_key_value" {
  description = "Canonical string representation of the range key value, when the table has a range key. Same encoding as hash_key_value"
  value       = element(concat(aws_dynamodb_table_item.dynamodb_table_item.*.range_key_value, [""]), 0)
}
