variable "ec2_tag_key" {
  description = "(Required) The tag name"
  type        = string
}
variable "ec2_tag_resource_id" {
  description = "(Required) The ID of the EC2 resource to manage the tag for"
  type        = string
}
variable "ec2_tag_value" {
  description = "(Required) The value of the tag"
  type        = string
}
