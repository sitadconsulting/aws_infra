output "bedrock_data_automation_project_creation_time" {
  description = "Project creation time"
  value       = element(concat(awscc_bedrock_data_automation_project.bedrock_data_automation_project.*.creation_time, [""]), 0)
}
output "bedrock_data_automation_project_id" {
  description = "Project id"
  value       = element(concat(awscc_bedrock_data_automation_project.bedrock_data_automation_project.*.id, [""]), 0)
}
output "bedrock_data_automation_project_last_modified_time" {
  description = "Project last modification time"
  value       = element(concat(awscc_bedrock_data_automation_project.bedrock_data_automation_project.*.last_modified_time, [""]), 0)
}
output "bedrock_data_automation_project_project_arn" {
  description = "Project arn"
  value       = element(concat(awscc_bedrock_data_automation_project.bedrock_data_automation_project.*.project_arn, [""]), 0)
}
output "bedrock_data_automation_project_project_stage" {
  description = "Project stage"
  value       = element(concat(awscc_bedrock_data_automation_project.bedrock_data_automation_project.*.project_stage, [""]), 0)
}
output "bedrock_data_automation_project_status" {
  description = "Project status"
  value       = element(concat(awscc_bedrock_data_automation_project.bedrock_data_automation_project.*.status, [""]), 0)
}
