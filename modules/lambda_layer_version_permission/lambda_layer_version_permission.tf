resource "aws_lambda_layer_version_permission" "lambda_layer_version_permission" {
  action          = var.lambda_layer_version_permission_action
  layer_name      = var.lambda_layer_version_permission_layer_name
  organization_id = var.lambda_layer_version_permission_organization_id
  principal       = var.lambda_layer_version_permission_principal
  statement_id    = var.lambda_layer_version_permission_statement_id
  version_number  = var.lambda_layer_version_permission_version_number
  skip_destroy    = var.lambda_layer_version_permission_skip_destroy
}
