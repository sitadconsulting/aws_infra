output "codebuild_webhook_id" {
  description = "The name of the build project"
  value       = element(concat(aws_codebuild_webhook.codebuild_webhook.*.id, [""]), 0)
}
output "codebuild_webhook_payload_url" {
  description = "The CodeBuild endpoint where webhook events are sent"
  value       = element(concat(aws_codebuild_webhook.codebuild_webhook.*.payload_url, [""]), 0)
}
output "codebuild_webhook_secret" {
  description = "The secret token of the associated repository. Not returned by the CodeBuild API for all source types"
  value       = element(concat(aws_codebuild_webhook.codebuild_webhook.*.secret, [""]), 0)
}
output "codebuild_webhook_url" {
  description = "The URL to the webhook"
  value       = element(concat(aws_codebuild_webhook.codebuild_webhook.*.url, [""]), 0)
}
