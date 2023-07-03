output "opensearchserverless_collection_arn" {
  description = "ARN of the collection"
  value       = element(concat(aws_opensearchserverless_collection.opensearchserverless_collection.*.arn, [""]), 0)
}
output "opensearchserverless_collection_collection_endpoint" {
  description = "ollection-specific endpoint used to submit index, search, and data upload requests to an OpenSearch Serverless collection"
  value       = element(concat(aws_opensearchserverless_collection.opensearchserverless_collection.*.collection_endpoint, [""]), 0)
}
output "opensearchserverless_collection_dashboard_endpont" {
  description = "Collection-specific endpoint used to access OpenSearch Dashboards"
  value       = element(concat(aws_opensearchserverless_collection.opensearchserverless_collection.*.dashboard_endpont, [""]), 0)
}
output "opensearchserverless_collection_kms_key_arn" {
  description = "ARN of the Amazon Web Services KMS key used to encrypt the collection"
  value       = element(concat(aws_opensearchserverless_collection.opensearchserverless_collection.*.kms_key_arn, [""]), 0)
}
output "opensearchserverless_collection_id" {
  description = "Unique identifier for the collection"
  value       = element(concat(aws_opensearchserverless_collection.opensearchserverless_collection.*.id, [""]), 0)
}
