variable "api_gateway_resource_parent_id" {
  description = "(Required) ID of the parent API resource"
  type        = string
}
variable "api_gateway_resource_path_part" {
  description = "(Required) Last path segment of this API resource"
  type        = string
}
variable "api_gateway_resource_rest_api_id" {
  description = "(Required) ID of the associated REST API"
  type        = string
}
