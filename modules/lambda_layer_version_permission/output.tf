output "lambda_layer_version_permission_id" {
  description = "The layer_name and version_number, separated by a comma (,)"
  value       = element(concat(aws_lambda_layer_version_permission.lambda_layer_version_permission.*.id, [""]), 0)
}
output "lambda_layer_version_permission_revision_id" {
  description = "A unique identifier for the current revision of the policy"
  value       = element(concat(aws_lambda_layer_version_permission.lambda_layer_version_permission.*.revision_id, [""]), 0)
}
output "lambda_layer_version_permission_policy" {
  description = "Full Lambda Layer Permission policy"
  value       = element(concat(aws_lambda_layer_version_permission.lambda_layer_version_permission.*.policy, [""]), 0)
}
