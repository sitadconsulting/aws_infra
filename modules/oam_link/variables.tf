variable "oam_link_label_template" {
  description = "(Required) Human-readable name to use to identify this source account when you are viewing data from it in the monitoring account"
  type        = string
}
variable "oam_link_resource_types" {
  description = "(Required) Types of data that the source account shares with the monitoring account"
  type        = string
}
variable "oam_link_sink_identifier" {
  description = "(Required) Identifier of the sink to use to create this link"
  type        = string
}
variable "oam_link_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "oam_link_link_configuration" {
  description = "(Optional) Configuration for creating filters that specify that only some metric namespaces or log groups are to be shared from the source account to the monitoring account"
  type        = list(object({
    log_group_configuration = optional(list(object({
      filter = string
    })), [])
    metric_configuration    = optional(list(object({
      filter = string
    })), [])
  }))
  default     = []
}
