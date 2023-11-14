resource "aws_cognito_resource_server" "cognito_resource_server" {
  identifier   = var.cognito_resource_server_identifier
  name         = var.cognito_resource_server_name
  user_pool_id = var.cognito_resource_server_user_pool_id


  dynamic "scope" {
    for_each = var.cognito_resource_server_scope
      content {
        scope_description = scope.value["scope_description"]
        scope_name        = scope.value["scope_name"]
      }
  } 
}
