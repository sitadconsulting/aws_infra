output "dynamodb_tag_id" {
  description = "DynamoDB resource identifier and key, separated by a comma"
  value       = element(concat(aws_dynamodb_tag.dynamodb_tag.*.id, [""]), 0)
}
