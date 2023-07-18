resource "aws_lambda_layer_version" "lambda_layer_version" {
  compatible_architectures = var.lambda_layer_version_compatible_architectures
  compatible_runtimes      = var.lambda_layer_version_compatible_runtimes
  description              = var.lambda_layer_version_description
  filename                 = var.lambda_layer_version_filename
  layer_name               = var.lambda_layer_version_layer_name
  license_info             = var.lambda_layer_version_license_info
  s3_bucket                = var.lambda_layer_version_s3_bucket
  s3_key                   = var.lambda_layer_version_s3_key
  s3_object_version        = var.lambda_layer_version_s3_object_version
  skip_destroy             = var.lambda_layer_version_skip_destroy
  source_code_hash         = var.lambda_layer_version_source_code_hash
}
