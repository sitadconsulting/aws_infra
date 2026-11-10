variable "connect_bot_association_instance_id" {
  description = "(Required) The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance"
  type        = string
}
variable "connect_bot_association_lex_bot" {
  description = "(Required) Configuration information of an Amazon Lex (V1) bot"
  type        = list(object({
    name   = string
    region = optional(string)
  }))
}
