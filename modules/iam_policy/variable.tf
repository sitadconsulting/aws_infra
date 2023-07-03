variable "iam_policy_description" {
  description = "Description of the IAM policy"
  type        = string
  default     = ""
}
variable "iam_policy_name" {
  description = "The name of the policy. If omitted, Terraform will assign a random, unique name"
  type     = string
  default  = ""
}
variable "iam_policy_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type     = string
  default  = null
}
variable "iam_policy_path" {
  description = "Path in which to create the policy"
  type        = string
  default     = "/"
}
variable "iam_policy_policy" {
  description = "The policy document. This is a JSON formatted string"
  type     = string
}
variable "iam_policy_tags" {
  description = "Map of resource tags for the IAM Policy"
  type     = map(string)
  default  = {}
}
