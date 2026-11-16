output "datazone_project_created_at" {
  description = "Timestamp of when the project was made"
  value       = element(concat(aws_datazone_project.datazone_project.*.created_at, [""]), 0)
}
output "datazone_project_created_by" {
  description = "Creator of the project"
  value       = element(concat(aws_datazone_project.datazone_project.*.created_by, [""]), 0)
}
output "datazone_project_description" {
  description = "Description of the project"
  value       = element(concat(aws_datazone_project.datazone_project.*.description, [""]), 0)
}
output "datazone_project_domain_id" {
  description = "ID of the project's DataZone domain"
  value       = element(concat(aws_datazone_project.datazone_project.*.domain_id, [""]), 0)
}
output "datazone_project_failure_reasons" {
  description = "List of error messages if operation cannot be completed"
  value       = element(concat(aws_datazone_project.datazone_project.*.failure_reasons, [""]), 0)
}
output "datazone_project_glossary_terms" {
  description = "Business glossary terms that can be used in the project"
  value       = element(concat(aws_datazone_project.datazone_project.*.glossary_terms, [""]), 0)
}
output "datazone_project_id" {
  description = "ID of the project"
  value       = element(concat(aws_datazone_project.datazone_project.*.id, [""]), 0)
}
output "datazone_project_last_updated_at" {
  description = "Timestamp of when the project was last updated"
  value       = element(concat(aws_datazone_project.datazone_project.*.last_updated_at, [""]), 0)
}
output "datazone_project_name" {
  description = "Name of the project"
  value       = element(concat(aws_datazone_project.datazone_project.*.name, [""]), 0)
}
output "datazone_project_project_status" {
  description = " Enum that conveys state of project. Can be ACTIVE, DELETING, or DELETE_FAILED"
  value       = element(concat(aws_datazone_project.datazone_project.*.project_status, [""]), 0)
}
