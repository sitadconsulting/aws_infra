output "codebuild_resource_policy_id" {
  description = "The ARN of Resource"
  value       = element(concat(aws_codebuild_resource_policy.codebuild_resource_policy.*.id, [""]), 0)
}
