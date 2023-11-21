output "ecrpublic_repository_arn" {
  description = "Repository ARN"
  value       = element(concat(aws_ecrpublic_repository.ecrpublic_repository.*.arn, [""]), 0)
}
output "ecrpublic_repository_id" {
  description = "Repository name"
  value       = element(concat(aws_ecrpublic_repository.ecrpublic_repository.*.id, [""]), 0)
}
output "ecrpublic_repository_registry_id" {
  description = "The registry ID where the repository was created"
  value       = element(concat(aws_ecrpublic_repository.ecrpublic_repository.*.registry_id, [""]), 0)
}
output "ecrpublic_repository_repository_uri" {
  description = "Repository URI"
  value       = element(concat(aws_ecrpublic_repository.ecrpublic_repository.*.repository_uri, [""]), 0)
}
