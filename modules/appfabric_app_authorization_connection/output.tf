output "appfabric_app_authorization_connection_app" {
  description = "Name of the application"
  value       = element(concat(aws_appfabric_app_authorization_connection.appfabric_app_authorization_connection.*.app, [""]), 0)
}
output "appfabric_app_authorization_connection_tenant" {
  description = "Information about an application tenant"
  value       = element(concat(aws_appfabric_app_authorization_connection.appfabric_app_authorization_connection.*.tenant, [""]), 0)
}
