variable "dynamodb_tag_resource_arn" {
  description = "(Required) ARN of the DynamoDB resource to tag"
  type        = string
}
variable "dynamodb_tag_key" {
  description = "(Required) Tag name"
  type        = string
}
variable "dynamodb_tag_value" {
  description = "(Required) Tag value"
  type        = string
}
