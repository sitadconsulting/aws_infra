variable "oam_sink_name" {
  description = "(Required) Name for the sink"
  type        = string
}
variable "oam_sink_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
