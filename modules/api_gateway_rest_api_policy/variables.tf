variable "api_gateway_rest_api_policy_rest_api_id" {
  description = "REST API ID"
  type        = string
}
variable "api_gateway_rest_api_policy_policy" {
  description = "JSON formatted policy document that controls access to the API Gateway. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide"
  type        = string
}
