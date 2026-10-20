variable "kinesis_resource_policy_policy" {
  description = "(Required) Policy document"
  type        = string
}
variable "kinesis_resource_policy_resource_arn" {
  description = "(Required) ARN of the data stream or consumer"
  type        = string
}
