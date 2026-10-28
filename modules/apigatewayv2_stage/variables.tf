variable "apigatewayv2_stage_api_id" {
  description = "(Required) API identifier"
  type        = string
}
variable "apigatewayv2_stage_auto_deploy" {
  description = "(Optional) Whether updates to an API automatically trigger a new deployment. Defaults to false. Applicable for HTTP APIs"
  type        = bool
  default     = null
}
variable "apigatewayv2_stage_client_certificate_id" {
  description = "(Optional) Identifier of a client certificate for the stage. Use the aws_api_gateway_client_certificate resource to configure a client certificate. Supported only for WebSocket APIs"
  type        = string
  default     = null
}
variable "apigatewayv2_stage_deployment_id" {
  description = "(Optional) Deployment identifier of the stage. Use the aws_apigatewayv2_deployment resource to configure a deployment"
  type        = string
  default     = null
}
variable "apigatewayv2_stage_description" {
  description = "(Optional) Description for the stage. Must be less than or equal to 1024 characters in length"
  type        = string
  default     = null
}
variable "apigatewayv2_stage_name" {
  description = "(Required) Name of the stage. Must be between 1 and 128 characters in length"
  type        = string
}
variable "apigatewayv2_stage_stage_variables" {
  description = "(Optional) Map that defines the stage variables for the stage"
  type        = map(string)
  default     = {}
}
variable "apigatewayv2_stage_tags" {
  description = "(Optional) Map of tags to assign to the stage"
  type        = map(string)
  default     = {}
}
variable "apigatewayv2_stage_access_log_settings" {
  description = "(Optional) Settings for logging access in this stage. Use the aws_api_gateway_account resource to configure permissions for CloudWatch Logging"
  type        = list(object({
    destination_arn = string
    format          = string
  }))
  default     = []
}
variable "apigatewayv2_stage_default_route_settings" {
  description = "(Optional) Default route settings for the stage"
  type        = list(object({
    data_trace_enabled       = optional(bool)
    detailed_metrics_enabled = optional(bool)
    logging_level            = optional(string)
    throttling_burst_limit   = optional(number)
    throttling_rate_limit    = optional(number)
  }))
  default     = []
}
variable "apigatewayv2_stage_route_settings" {
  description = "(Optional) Route settings for the stage"
  type        = list(object({
    data_trace_enabled       = optional(bool)
    detailed_metrics_enabled = optional(bool)
    logging_level            = optional(string)
    route_key                = string
    throttling_burst_limit   = optional(number)
    throttling_rate_limit    = optional(number)
  }))
  default     = []
}
