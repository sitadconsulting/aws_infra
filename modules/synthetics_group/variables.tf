variable "synthetics_group_name" {
  description = "(Required) Name of the group"
  type        = string
}
variable "synthetics_group_tags" {
  description = "(Optional) Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
