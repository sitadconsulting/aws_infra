output "cognito_user_pool_ui_customization_creation_date" {
  description = "The creation date in RFC3339 format for the UI customization"
  value       = element(concat(aws_cognito_user_pool_ui_customization.cognito_user_pool_ui_customization.*.creation_date, [""]), 0)
}
output "cognito_user_pool_ui_customization_css_version" {
  description = "The CSS version number"
  value       = element(concat(aws_cognito_user_pool_ui_customization.cognito_user_pool_ui_customization.*.css_version, [""]), 0)
}
output "cognito_user_pool_ui_customization_image_url" {
  description = "The logo image URL for the UI customization"
  value       = element(concat(aws_cognito_user_pool_ui_customization.cognito_user_pool_ui_customization.*.image_url, [""]), 0)
}
output "cognito_user_pool_ui_customization_last_modified_date" {
  description = "The last-modified date in RFC3339 format for the UI customization"
  value       = element(concat(aws_cognito_user_pool_ui_customization.cognito_user_pool_ui_customization.*.last_modified_date, [""]), 0)
}
