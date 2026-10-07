output "codebuild_project_arn" {
  description = "ARN of the CodeBuild project"
  value       = element(concat(aws_codebuild_project.codebuild_project.*.arn, [""]), 0)
}
output "codebuild_project_badge_url" {
  description = "URL of the build badge when badge_enabled is enabled"
  value       = element(concat(aws_codebuild_project.codebuild_project.*.badge_url, [""]), 0)
}
output "codebuild_project_id" {
  description = "Name (if imported via name) or ARN (if created via Terraform or imported via ARN) of the CodeBuild project"
  value       = element(concat(aws_codebuild_project.codebuild_project.*.id, [""]), 0)
}
output "codebuild_project_public_project_alias" {
  description = "The project identifier used with the public build APIs"
  value       = element(concat(aws_codebuild_project.codebuild_project.*.public_project_alias, [""]), 0)
}
