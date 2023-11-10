variable "api_gateway_request_validator_name" {
  description = "Name of the request validator"
  type        = string
}
variable "api_gateway_request_validator_rest_api_id" {
  description = "ID of the associated Rest API"
  type        = string
}
variable "api_gateway_request_validator_validate_request_body" {
  description = "Boolean whether to validate request body. Defaults to false"
  type        = bool
  default     = false
}
variable "api_gateway_request_validator_validate_request_parameters" {
  description = "Boolean whether to validate request parameters. Defaults to false"
  type        = bool
  default     = false
}
