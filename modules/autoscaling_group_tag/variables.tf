variable "autoscaling_group_tag_autoscaling_group_name" {
  description = "(Required) Name of the Auto Scaling group to apply the tag to"
  type        = string
}
variable "autoscaling_group_tag_tag" {
  description = "(Required) Tag to create"
  type        = map(string)
}
