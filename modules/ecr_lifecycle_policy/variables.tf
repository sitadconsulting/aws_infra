variable "ecr_lifecycle_policy_repository" {
  description = "(Required) Name of the repository to apply the policy"
  type        = string
}
variable "ecr_lifecycle_policy_policy" {
  description = "(Required) The policy document. This is a JSON formatted string. See more details about Policy Parameters in the official AWS docs. Consider using the aws_ecr_lifecycle_policy_document data_source to generate/manage the JSON document used for the policy argument"
  type        = string
}
