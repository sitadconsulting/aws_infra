variable "iam_role_assume_role_policy" {
  description = "Policy that grants an entity permission to assume the role"
  type        = string
}
variable "iam_role_description" {
  description = "Description of the role"
  type        = string
  default     = ""
}
variable "iam_role_force_detach_policies" {
  description = "Whether to force detaching any policies the role has before destroying it. Defaults to false"
  type        = bool
  default     = false
}
variable "iam_role_managed_policy_arns" {
  description = "Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Terraform will ignore policy attachments to this resource. When configured, Terraform will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., managed_policy_arns = []) will cause Terraform to remove all managed policy attachments"
  type        = list(string)
  default     = []
}
variable "iam_role_max_session_duration" {
  description = "Maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours"
  type        = number
  default     = 3600
}
variable "iam_role_name" {
  description = "Friendly name of the role. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = ""
}
variable "iam_role_name_prefix" {
  description = "Creates a unique friendly name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "iam_role_path" {
  description = "Path to the role"
  type        = string
  default     = "/"
}
variable "iam_role_permissions_boundary" {
  description = "ARN of the policy that is used to set the permissions boundary for the role"
  type        = string
  default     = ""
}
variable "iam_role_tags" {
  description = "Key-value mapping of tags for the IAM role"
  type        = map(string)
  default     = {}
}
variable "iam_role_inline_policy" {
  description = "Configuration block defining an exclusive set of IAM inline policies associated with the IAM role If no blocks are configured, Terraform will not manage any inline policies in this resource. Configuring one empty block (i.e., inline_policy {}) will cause Terraform to remove all inline policies added out of band on apply"
  type        = list(object({
    name   = optional(string)
    policy = optional(string) 
  }))
  default = []
}
