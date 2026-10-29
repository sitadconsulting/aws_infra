variable "autoscaling_traffic_source_attachment_autoscaling_group_name" {
  description = "(Required) The name of the Auto Scaling group"
  type        = string
}
variable "autoscaling_traffic_source_attachment_traffic_source" {
  description = "(Required) The unique identifiers of a traffic sources"
  type        = list(object({
    identifier = string
    type       = optional(string)
  }))
}
