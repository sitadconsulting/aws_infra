variable "efs_access_point_file_system_id" {
  description = "ID of the file system for which the access point is intended"
  type        = string
}
variable "efs_access_point_tags" {
  description = "Key-value mapping of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "efs_access_point_posix_user" {
  description = "Operating system user and group applied to all file system requests made using the access point"
  type        = list(object({
    gid            = number
    uid            = number
    secondary_gids = optional(list(number))
  }))
  default     = []
}
variable "efs_access_point_root_directory" {
  description = "Directory on the Amazon EFS file system that the access point provides access to"
  type        = list(object({
    path          = optional(string)
    creation_info = optional(list(object({
      owner_gid   = number
      owner_uid   = number
      permissions = string
    })), [])
  }))
  default     = []
}
