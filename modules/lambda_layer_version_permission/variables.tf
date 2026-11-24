variable "lambda_layer_version_permission_action" {
  description = "(Required) Action that will be allowed. lambda:GetLayerVersion is the standard value for layer access"
  type        = string
}
variable "lambda_layer_version_permission_layer_name" {
  description = "(Required) Name or ARN of the Lambda Layer"
  type        = string
}
variable "lambda_layer_version_permission_organization_id" {
  description = "(Optional) AWS Organization ID that should be able to use your Lambda Layer. principal should be set to * when organization_id is provided"
  type        = string
  default     = null
}
variable "lambda_layer_version_permission_principal" {
  description = "(Required) AWS account ID that should be able to use your Lambda Layer. Use * to share with all AWS accounts"
  type        = string
}
variable "lambda_layer_version_permission_statement_id" {
  description = "(Required) Unique identifier for the permission statement"
  type        = string
}
variable "lambda_layer_version_permission_version_number" {
  description = "(Required) Version of Lambda Layer to grant access to. Note: permissions only apply to a single version of a layer"
  type        = number
}
variable "lambda_layer_version_permission_skip_destroy" {
  description = "(Optional) Whether to retain the permission when the resource is destroyed. Default is false"
  type        = bool
  default     = false
}
