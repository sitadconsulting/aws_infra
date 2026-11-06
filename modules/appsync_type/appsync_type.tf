resource "aws_appsync_type" "appsync_type" {
  api_id      = var.appsync_type_api_id
  definition  = var.appsync_type_definition
  format      = var.appsync_type_format
}
