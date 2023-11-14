resource "aws_cognito_user" "cognito_user" {
  attributes               = var.cognito_user_attributes
  client_metadata          = var.cognito_user_client_metadata
  desired_delivery_mediums = var.cognito_user_desired_delivery_mediums
  enabled                  = var.cognito_user_enabled
  force_alias_creation     = var.cognito_user_force_alias_creation
  message_action           = var.cognito_user_message_action
  user_pool_id             = var.cognito_user_user_pool_id
  username                 = var.cognito_user_username
  password                 = var.cognito_user_password
  temporary_password       = var.cognito_user_temporary_password
  validation_data          = var.cognito_user_validation_data
}
