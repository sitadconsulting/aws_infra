variable "iam_role_assume_role_policy" {
  description = "(Required) Policy that grants an entity permission to assume the role"
  type        = string
}
variable "iam_role_description" {
  description = "(Optional) Description of the role"
  type        = string
  default     = null
}
variable "iam_role_force_detach_policies" {
  description = "(Optional) Whether to force detaching any policies the role has before destroying it. Defaults to false"
  type        = bool
  default     = false
}
variable "iam_role_max_session_duration" {
  description = "(Optional) Maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours"
  type        = number
  default     = 3600
}
variable "iam_role_name" {
  description = "(Optional, Forces new resource) Friendly name of the role. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = null
}
variable "iam_role_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique friendly name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "iam_role_path" {
  description = "(Optional) Path to the role"
  type        = string
  default     = "/"
}
variable "iam_role_permissions_boundary" {
  description = "(Optional) ARN of the policy that is used to set the permissions boundary for the role"
  type        = string
  default     = null
}
variable "iam_role_tags" {
  description = "Key-value mapping of tags for the IAM role"
  type        = map(string)
  default     = {}
}
