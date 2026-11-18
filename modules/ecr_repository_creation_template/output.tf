output "ecr_repository_creation_template_registry_id" {
  description = "The registry ID the repository creation template applies to"
  value       = element(concat(aws_ecr_repository_creation_template.ecr_repository_creation_template.*.registry_id, [""]), 0)
}
