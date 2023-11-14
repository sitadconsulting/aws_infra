output "cognito_resource_server_scope_identifiers" {
  description = "A list of all scopes configured for this resource server in the format identifier/scope_name"
  value       = element(concat(aws_cognito_resource_server.cognito_resource_server.*.scope_identifiers, [""]), 0)
}
