variable "iam_instance_profile_name" {
  description = "(Optional, Forces new resource) Name of the instance profile. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix. Can be a string of characters consisting of upper and lowercase alphanumeric characters and these special characters: _, +, =, ,, ., @, -. Spaces are not allowed. The name must be unique, regardless of the path or role. In other words, if there are different role or path values but the same name as an existing instance profile, it will still cause an EntityAlreadyExists error"
  type        = string
  default     = null
}
variable "iam_instance_profile_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "iam_instance_profile_path" {
  description = "(Optional, default \"/\") Path to the instance profile. For more information about paths, see IAM Identifiers in the IAM User Guide. Can be a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. Can include any ASCII character from the ! (\u0021) through the DEL character (\u007F), including most punctuation characters, digits, and upper and lowercase letters"
  type        = string
  default     = "/"
}
variable "iam_instance_profile_role" {
  description = "(Optional) Name of the role to add to the profile"
  type        = string
  default     = null
}
variable "iam_instance_profile_tags" {
  description = "(Optional) Map of resource tags for the IAM Instance Profile"
  type        = map(string)
  default     = {}
}
