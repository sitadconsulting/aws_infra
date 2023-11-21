variable "ecr_lifecycle_policy_repository" {
  description = "Name of the repository to apply the policy"
  type        = string
}
variable "ecr_lifecycle_policy_policy" {
  description = "The policy document. This is a JSON formatted string"
  type        = string
}
