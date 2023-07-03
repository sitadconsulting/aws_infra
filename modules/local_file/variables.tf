variable "file_content" {
  description = "Read file content"
  type        = string
  default     = ""
}
variable "file_filename" {
  description = "The location of the file on the local file system"
  type        = string
  default     = ""
}
variable "file_directory_permission" {
  description = "Permissions to set for directories created (before umask), expressed as string in numeric notation. Default value is 0777"
  type        = string
  default     = "0700"
}
variable "file_file_permission" {
  description = "Permissions to set for the output file (before umask), expressed as string in numeric notation. Default value is 0777"
  type        = string
  default     = "0600"
}
