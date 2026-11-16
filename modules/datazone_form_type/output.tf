output "datazone_form_type_created_at" {
  description = "Creation time of the Form Type"
  value       = element(concat(aws_datazone_form_type.datazone_form_type.*.created_at, [""]), 0)
}
output "datazone_form_type_created_by" {
  description = "Creator of the Form Type"
  value       = element(concat(aws_datazone_form_type.datazone_form_type.*.created_by, [""]), 0)
}
output "datazone_form_type_origin_domain_id" {
  description = "Origin domain ID of the Form Type"
  value       = element(concat(aws_datazone_form_type.datazone_form_type.*.origin_domain_id, [""]), 0)
}
output "datazone_form_type_origin_project_id" {
  description = "Origin project ID of the Form Type"
  value       = element(concat(aws_datazone_form_type.datazone_form_type.*.origin_project_id, [""]), 0)
}
output "datazone_form_type_owning_project_id" {
  description = "Owning project ID of the Form Type"
  value       = element(concat(aws_datazone_form_type.datazone_form_type.*.owning_project_id, [""]), 0)
}
output "datazone_form_type_revision" {
  description = "Revision of the Form Type"
  value       = element(concat(aws_datazone_form_type.datazone_form_type.*.revision, [""]), 0)
}
