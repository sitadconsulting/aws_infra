variable "lambdaweb_function_endpoint_auto_deployment_mode" {
  description = "(Optional) Deployment mode. LatestRevision makes the endpoint follow the latest revision automatically; Disabled requires explicit revision_weights. MultiRegion and PerRegion endpoints require Disabled. Defaults to LatestRevision"
  type        = string
  default     = null
}
variable "lambdaweb_function_endpoint_auth_type" {
  description = "(Required) Authentication mode. Valid values are ApplicationManaged and IamAuth. Can be changed in place; the endpoint keeps its domain name"
  type        = string
}
variable "lambdaweb_function_endpoint_description" {
  description = "(Optional) Description of the endpoint"
  type        = string
  default     = null
}
variable "lambdaweb_function_endpoint_endpoint_name" {
  description = "(Required) Name of the endpoint, up to 64 characters. Changing this forces a new resource"
  type        = string
}
variable "lambdaweb_function_endpoint_endpoint_type" {
  description = "(Required) Endpoint type. Valid values are HomeRegion, MultiRegion, and PerRegion. Changing this forces a new resource"
  type        = string
}
variable "lambdaweb_function_endpoint_function_name" {
  description = "(Required) Name of the function this endpoint belongs to, up to 64 characters. Changing this forces a new resource"
  type        = string
}
variable "lambdaweb_function_endpoint_regions" {
  description = "(Optional) Regions the endpoint spans. The maximum number of Regions per endpoint is a service quota, enforced by the API. Required for MultiRegion and PerRegion endpoints: specify at least one Region other than the home Region, which is added automatically. For HomeRegion endpoints, omit this argument or specify only the home Region. Changing this forces a new resource"
  type        = list(string)
  default     = null
}
variable "lambdaweb_function_endpoint_revision_weight" {
  description = "(Optional) Traffic routing. Required when auto_deployment_mode is Disabled and must be omitted when LatestRevision. One or two entries; weights must sum to 100. See below. When a new revision is rolled on the function, update these weights to shift traffic to it — with auto_deployment_mode = \"Disabled\" traffic never moves automatically"
  type        = list(object({
    revision_id = string
    weight      = number
  }))
  default     = []
}
variable "lambdaweb_function_endpoint_scaling_config" {
  description = "(Optional) Scaling limits for the endpoint. When unset, the endpoint has no max_environments limit; removing the block clears a previously set limit"
  type        = list(object({
    max_environments = number
  }))
  default     = []
}
variable "lambdaweb_function_endpoint_throttle_config" {
  description = "(Optional) Request throttling for the endpoint. When unset, the endpoint has no rate_limit; removing the block clears a previously set limit"
  type        = list(object({
    rate_limit = number
  }))
  default     = []
}
