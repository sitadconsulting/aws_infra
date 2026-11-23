resource "aws_iot_authorizer" "iot_authorizer" {
  authorizer_function_arn   = var.iot_authorizer_authorizer_function_arn
  enable_caching_for_http   = var.iot_authorizer_enable_caching_for_http
  name                      = var.iot_authorizer_name
  signing_disabled          = var.iot_authorizer_signing_disabled
  status                    = var.iot_authorizer_status
  tags                      = var.iot_authorizer_tags
  token_key_name            = var.iot_authorizer_token_key_name
  token_signing_public_keys = var.iot_authorizer_token_signing_public_keys
}
