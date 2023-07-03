variable "iam_instance_profile_name" {
  description = "Name of the instance profile. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix"
  type        = string
  default     = ""
}
variable "iam_instance_profile_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "iam_instance_profile_path" {
  description = "Path to the instance profile"
  type        = string
  default     = "/"
}
variable "iam_instance_profile_role" {
  description = "Name of the role to add to the profile"
  type        = string
  default     = ""
}
variable "iam_instance_profile_tags" {
  description = "Map of resource tags for the IAM Instance Profile"
  type        = map(string)
  default     = {}
}
