variable "apigatewayv2_deployment_api_id" {
  description = "API identifier"
  type        = string
}
variable "apigatewayv2_deployment_description" {
  description = "Description for the deployment resource. Must be less than or equal to 1024 characters in length"
  type        = string
  default     = ""
}
variable "apigatewayv2_deployment_triggers" {
  description = "Map of arbitrary keys and values that, when changed, will trigger a redeployment. To force a redeployment without changing these keys/values, use the terraform taint command"
  type        = map(string)
  default     = {}
}
