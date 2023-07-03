variable "autoscaling_group_tag_autoscaling_group_name" {
  description = "Name of the Autoscaling Group to apply the tag to"
  type        = string
}
variable "autoscaling_group_tag_tag" {
  description = "Tag to create"
  type        = map(string)
}
