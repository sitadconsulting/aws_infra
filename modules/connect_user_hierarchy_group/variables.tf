variable "connect_user_hierarchy_group_instance_id" {
  description = "(Required) Specifies the identifier of the hosting Amazon Connect Instance"
  type        = string
}
variable "connect_user_hierarchy_group_name" {
  description = "(Required) The name of the user hierarchy group. Must not be more than 100 characters"
  type        = string
}
variable "connect_user_hierarchy_group_parent_group_id" {
  description = "(Optional) The identifier for the parent hierarchy group. The user hierarchy is created at level one if the parent group ID is null"
  type        = string
  default     = null
}
variable "connect_user_hierarchy_group_tags" {
  description = "(Optional) Tags to apply to the hierarchy group"
  type        = map(string)
  default     = {}
}
