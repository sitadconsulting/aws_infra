output "lakeformation_opt_in_condition" {
  description = "Lake Formation condition, which applies to permissions and opt-ins that contain an expression"
  value       = element(concat(aws_lakeformation_opt_in.lakeformation_opt_in.*.condition, [""]), 0)
}
output "lakeformation_opt_in_last_modified" {
  description = "Last modified date and time of the record"
  value       = element(concat(aws_lakeformation_opt_in.lakeformation_opt_in.*.last_modified, [""]), 0)
}
output "lakeformation_opt_in_last_updated_by" {
  description = "User who updated the record"
  value       = element(concat(aws_lakeformation_opt_in.lakeformation_opt_in.*.last_updated_by, [""]), 0)
}
