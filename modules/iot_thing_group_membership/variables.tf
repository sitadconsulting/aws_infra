variable "iot_thing_group_membership_thing_name" {
  description = "(Required) The name of the thing to add to a group"
  type        = string
}
variable "iot_thing_group_membership_thing_group_name" {
  description = "(Required) The name of the group to which you are adding a thing"
  type        = string
}
variable "iot_thing_group_membership_override_dynamic_group" {
  description = "(Optional) Override dynamic thing groups with static thing groups when 10-group limit is reached. If a thing belongs to 10 thing groups, and one or more of those groups are dynamic thing groups, adding a thing to a static group removes the thing from the last dynamic group"
  type        = bool
  default     = null
}
