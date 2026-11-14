output "datazone_environment_created_at" {
  description = "The time the environment was created"
  value       = element(concat(aws_datazone_environment.datazone_environment.*.created_at, [""]), 0)
}
output "datazone_environment_created_by" {
  description = "The user who created the environment"
  value       = element(concat(aws_datazone_environment.datazone_environment.*.created_by, [""]), 0)
}
output "datazone_environment_id" {
  description = "The ID of the environment"
  value       = element(concat(aws_datazone_environment.datazone_environment.*.id, [""]), 0)
}
output "datazone_environment_last_deployment" {
  description = "The details of the last deployment of the environment"
  value       = element(concat(aws_datazone_environment.datazone_environment.*.last_deployment, [""]), 0)
}
output "datazone_environment_provider_environment" {
  description = "The provider of the environment"
  value       = element(concat(aws_datazone_environment.datazone_environment.*.provider_environment, [""]), 0)
}
output "datazone_environment_provisioned_resource" {
  description = "The provisioned resources of this environment"
  value       = element(concat(aws_datazone_environment.datazone_environment.*.provisioned_resource, [""]), 0)
}
