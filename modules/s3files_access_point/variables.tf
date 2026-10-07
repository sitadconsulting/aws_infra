variable "s3files_access_point_file_system_id" {
  description = "(Required) File system ID. Changing this value forces replacement"
  type        = string
}
variable "s3files_access_point_tags" {
  description = "(Optional) Map of tags assigned to the resource"
  type        = map(string)
  default     = null
}
variable "s3files_access_point_posix_user" {
  description = "(Required) POSIX user configuration"
  type        = list(object({
    gid            = number
    uid            = number
    secondary_gids = optional(number)
  }))
}
variable "s3files_access_point_root_directory" {
  description = "(Optional) Root directory configuration"
  type        = list(object({
    path                 = optional(string)
    creation_permissions = optional(list(object({
      owner_gid   = number
      owner_uid   = number
      permissions = string
    })), [])
  }))
  default     = []
}
