variable "quicksight_namespace_aws_account_id" {
  description = "AWS account ID"
  type        = string
  default     = ""
}
variable "quicksight_namespace_identity_store" {
  description = "User identity directory type. Defaults to QUICKSIGHT, the only current valid value"
  type        = string
  default     = ""
}
variable "quicksight_namespace_namespace" {
  description = "Name of the namespace"
  type        = string
}
variable "quicksight_namespace_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
