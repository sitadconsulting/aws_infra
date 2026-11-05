resource "aws_appsync_api_key" "appsync_api_key" {
  api_id      = var.appsync_api_key_api_id
  description = var.appsync_api_key_description
  expires     = var.appsync_api_key_expires
}
