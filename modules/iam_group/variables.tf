variable "iam_group_name" {
  description = "(Required) Group's name. Must consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@-_.. Group names are not distinguished by case. For example, you cannot create groups named both \"ADMINS\" and \"admins\""
  type        = string
}
variable "iam_group_path" {
  description = "(Optional, default \"/\") Path in which to create the group"
  type        = string
  default     = "/"
}

