output "fsx_data_repository_association_arn" {
  description = "File system ARN"
  value       = element(concat(aws_fsx_data_repository_association.fsx_data_repository_association.*.arn, [""]), 0)
}
output "fsx_data_repository_association_id" {
  description = "Data Repository Identifier"
  value       = element(concat(aws_fsx_data_repository_association.fsx_data_repository_association.*.id, [""]), 0)
}
