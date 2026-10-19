variable "iam_policy_delay_after_policy_creation_in_ms" {
  description = "(Optional) Number of ms to wait between creating the policy and setting its version as default. May be required in environments with very high S3 IO loads "
  type        = number
  default     = null
}
variable "iam_policy_description" {
  description = "(Optional, Forces new resource) Description of the IAM policy"
  type        = string
  default     = null
}
variable "iam_policy_name" {
  description = "(Optional, Forces new resource) Name of the policy. If omitted, Terraform will assign a random, unique name"
  type     = string
  default  = null
}
variable "iam_policy_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type     = string
  default  = null
}
variable "iam_policy_path" {
  description = "(Optional, default \"/\") Path in which to create the policy"
  type        = string
  default     = "/"
}
variable "iam_policy_policy" {
  description = "(Required) Policy document. This is a JSON formatted string"
  type     = string
}
variable "iam_policy_tags" {
  description = "(Optional) Map of resource tags for the IAM Policy"
  type     = map(string)
  default  = {}
}
