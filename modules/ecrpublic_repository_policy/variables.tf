variable "ecrpublic_repository_policy_policy" {
  description = "(Required) The policy document. This is a JSON formatted string"
  type        = string
}
variable "ecrpublic_repository_policy_repository_name" {
  description = "(Required) Name of the repository to apply the policy to"
  type        = string
}
