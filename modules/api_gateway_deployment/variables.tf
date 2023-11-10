variable "api_gateway_deployment_description" {
  description = "Description of the deployment"
  type        = string
  default     = ""
}
variable "api_gateway_deployment_rest_api_id" {
  description = "REST API identifier"
  type        = string
}
variable "api_gateway_deployment_stage_description" {
  description = "Description to set on the stage managed by the stage_name argument"
  type        = string
  default     = null
}
variable "api_gateway_deployment_stage_name" {
  description = "Name of the stage to create with this deployment. If the specified stage already exists, it will be updated to point to the new deployment. We recommend using the aws_api_gateway_stage resource instead to manage stages"
  type        = string
  default     = null
}
variable "api_gateway_deployment_triggers" {
  description = "Map of arbitrary keys and values that, when changed, will trigger a redeployment. To force a redeployment without changing these keys/values, use the -replace option with terraform plan or terraform apply"
  type        = map(string)
  default     = {}
}
variable "api_gateway_deployment_variables" {
  description = "Map to set on the stage managed by the stage_name argument"
  type        = map(string)
  default     = {}
}
