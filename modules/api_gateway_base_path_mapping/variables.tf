variable "api_gateway_base_path_mapping_api_id" {
  description = "API ID"
  type        = string
}
variable "api_gateway_base_path_mapping_base_path" {
  description = "Path segment that must be prepended to the path when accessing the API via this mapping. If omitted, the API is exposed at the root of the given domain"
  type        = string
  default     = null
}
variable "api_gateway_base_path_mapping_stage_name" {
  description = "Name of a specific deployment stage to expose at the given path. If omitted, callers may select any stage by including its name as a path element after the base path"
  type        = string
  default     = null
}
variable "api_gateway_base_path_mapping_domain_name" {
  description = "Already-registered domain name to connect the API to"
  type        = string
}
