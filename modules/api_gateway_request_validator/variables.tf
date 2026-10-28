variable "api_gateway_request_validator_name" {
  description = "(Required) Name of the request validator"
  type        = string
}
variable "api_gateway_request_validator_rest_api_id" {
  description = "(Required) ID of the associated Rest API"
  type        = string
}
variable "api_gateway_request_validator_validate_request_body" {
  description = "(Optional) Boolean whether to validate request body. Defaults to false"
  type        = bool
  default     = false
}
variable "api_gateway_request_validator_validate_request_parameters" {
  description = "(Optional) Boolean whether to validate request parameters. Defaults to false"
  type        = bool
  default     = false
}
