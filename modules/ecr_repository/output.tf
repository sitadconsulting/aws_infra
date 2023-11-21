output "ecr_repository_registry_arn" {
  description = "Repository ARN"
  value       = element(concat(aws_ecr_repository.ecr_repository.*.arn, [""]), 0)
}
output "ecr_repository_registry_registry_id" {
  description = "The registry ID where the repository was created"
  value       = element(concat(aws_ecr_repository.ecr_repository.*.registry_id, [""]), 0)
}
output "ecr_repository_registry_repository_url" {
  description = "The URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)"
  value       = element(concat(aws_ecr_repository.ecr_repository.*.repository_url, [""]), 0)
}
