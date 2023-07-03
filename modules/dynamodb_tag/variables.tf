variable "dynamodb_tag_resource_arn" {
  description = "Amazon Resource Name (ARN) of the DynamoDB resource to tag"
  type        = string
}
variable "dynamodb_tag_key" {
  description = "Tag name"
  type        = string
}
variable "dynamodb_tag_value" {
  description = "Tag value"
  type        = string
}
