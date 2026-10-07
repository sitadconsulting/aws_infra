output "codebuild_source_credential_id" {
  description = "The ARN of Source Credential"
  value       = element(concat(aws_codebuild_source_credential.codebuild_source_credential.*.id, [""]), 0)
}
output "codebuild_source_credential_arn" {
  description = "The ARN of Source Credential"
  value       = element(concat(aws_codebuild_source_credential.codebuild_source_credential.*.arn, [""]), 0)
}
