variable "api_gateway_rest_api_policy_policy" {
  description = "(Required) JSON formatted policy document that controls access to the API Gateway. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide"
  type        = string
}
variable "api_gateway_rest_api_policy_rest_api_id" {
  description = "(Required) ID of the REST API"
  type        = string
}
