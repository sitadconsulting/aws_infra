resource "aws_cognito_user_pool_ui_customization" "cognito_user_pool_ui_customization" {
  client_id    = var.cognito_user_pool_ui_customization_client_id
  css          = var.cognito_user_pool_ui_customization_css
  image_file   = var.cognito_user_pool_ui_customization_image_file
  user_pool_id = var.cognito_user_pool_ui_customization_user_pool_id 
}
