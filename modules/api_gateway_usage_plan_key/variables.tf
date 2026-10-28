variable "api_gateway_usage_plan_key_key_id" {
  description = "(Required) Identifier of the API key resource"
  type        = string
}
variable "api_gateway_usage_plan_key_key_type" {
  description = "(Required) Type of the API key resource. Currently, the valid key type is API_KEY"
  type        = string
}
variable "api_gateway_usage_plan_key_usage_plan_id" {
  description = "(Required) ID of the usage plan resource representing to associate the key to"
  type        = string
}
