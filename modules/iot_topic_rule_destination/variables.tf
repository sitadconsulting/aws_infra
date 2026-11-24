variable "iot_topic_rule_destination_enabled" {
  description = "(Optional) Whether or not to enable the destination. Default: true."
  type        = bool
  default     = true
}
variable "iot_topic_rule_destination_vpc_configuration" {
  description = "(Required) Configuration of the VPC connection"
  type        = list(object({
    role_arn        = string
    security_groups = optional(list(string))
    subnet_ids      = list(string)
    vpc_id          = string
  }))
}
