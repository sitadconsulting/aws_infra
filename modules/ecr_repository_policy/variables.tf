variable "ecr_repository_policy_repository" {
  description = "Name of the repository to apply the policy to"
  type        = string
}
variable "ecr_repository_policy_policy" {
  description = "The policy document. This is a JSON formatted string"
  type        = string
}
