output "mwaa_environment_arn" {
  description = "ARN of the MWAA Environment"
  value       = element(concat(aws_mwaa_environment.mwaa_environment.*.arn, [""]), 0)
}
output "mwaa_environment_created_at" {
  description = "Created At date of the MWAA Environment"
  value       = element(concat(aws_mwaa_environment.mwaa_environment.*.created_at, [""]), 0)
}
output "mwaa_environment_database_vpc_endpoint_service" {
  description = "VPC endpoint for the environment's Amazon RDS database"
  value       = element(concat(aws_mwaa_environment.mwaa_environment.*.database_vpc_endpoint_service, [""]), 0)
}
output "mwaa_environment_last_updated" {
  description = "Information about the last update of the environment"
  value       = element(concat(aws_mwaa_environment.mwaa_environment.*.last_updated, [""]), 0)
}
output "mwaa_environment_service_role_arn" {
  description = "Service Role ARN of the Amazon MWAA Environment"
  value       = element(concat(aws_mwaa_environment.mwaa_environment.*.service_role_arn, [""]), 0)
}
output "mwaa_environment_status" {
  description = "Status of the Amazon MWAA Environment"
  value       = element(concat(aws_mwaa_environment.mwaa_environment.*.status, [""]), 0)
}
output "mwaa_environment_webserver_url" {
  description = "Webserver URL of the MWAA Environment"
  value       = element(concat(aws_mwaa_environment.mwaa_environment.*.webserver_url, [""]), 0)
}
output "mwaa_environment_webserver_vpc_endpoint_service" {
  description = "VPC endpoint for the environment's web server"
  value       = element(concat(aws_mwaa_environment.mwaa_environment.*.webserver_vpc_endpoint_service, [""]), 0)
}
