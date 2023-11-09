variable "apigatewayv2_api_mapping_api_id" {
  description = "API identifier"
  type        = string
}
variable "apigatewayv2_api_mapping_api_mapping_key" {
  description = "The API mapping key. Refer to REST API, HTTP API or WebSocket API"
  type        = string
  default     = ""
}
variable "apigatewayv2_api_mapping_domain_name" {
  description = "Domain name. Use the aws_apigatewayv2_domain_name resource to configure a domain name"
  type        = string
}
variable "apigatewayv2_api_mapping_stage" {
  description = "API stage. Use the aws_apigatewayv2_stage resource to configure an API stage"
  type        = string
}
