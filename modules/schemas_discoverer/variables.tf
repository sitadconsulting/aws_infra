variable "schemas_discoverer_description" {
  description = "(Optional) The description of the discoverer. Maximum of 256 characters"
  type        = string
  default     = null
}
variable "schemas_discoverer_source_arn" {
  description = "(Required) The ARN of the event bus to discover event schemas on"
  type        = string
}
variable "schemas_discoverer_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
