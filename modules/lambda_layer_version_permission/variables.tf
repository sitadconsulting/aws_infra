variable "lambda_layer_version_permission_action" {
  description = "Action, which will be allowed. lambda:GetLayerVersion value is suggested by AWS documantation"
  type        = string
}
variable "lambda_layer_version_permission_layer_name" {
  description = "The name or ARN of the Lambda Layer, which you want to grant access to"
  type        = string
}
variable "lambda_layer_version_permission_organization_id" {
  description = "An identifier of AWS Organization, which should be able to use your Lambda Layer. principal should be equal to * if organization_id provided"
  type        = string
  default     = null
}
variable "lambda_layer_version_permission_principal" {
  description = "AWS account ID which should be able to use your Lambda Layer. * can be used here, if you want to share your Lambda Layer widely"
  type        = string
}
variable "lambda_layer_version_permission_statement_id" {
  description = "The name of Lambda Layer Permission, for example dev-account - human readable note about what is this permission for"
  type        = string
}
variable "lambda_layer_version_permission_version_number" {
  description = "Version of Lambda Layer, which you want to grant access to. Note: permissions only apply to a single version of a layer"
  type        = number
}
variable "lambda_layer_version_permission_skip_destroy" {
  description = "Whether to retain the old version of a previously deployed Lambda Layer. Default is false. When this is not set to true, changing any of compatible_architectures, compatible_runtimes, description, filename, layer_name, license_info, s3_bucket, s3_key, s3_object_version, or source_code_hash forces deletion of the existing layer version and creation of a new layer version"
  type        = bool
  default     = false
}
