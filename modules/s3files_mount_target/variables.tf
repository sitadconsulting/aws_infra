variable "s3files_mount_target_file_system_id" {
  description = "(Required) File system ID. Changing this value forces replacement"
  type        = string
}
variable "s3files_mount_target_ip_address_type" {
  description = "(Optional) IP address type"
  type        = string
  default     = null
}
variable "s3files_mount_target_ipv4_address" {
  description = "(Optional) IPv4 address"
  type        = string
  default     = null
}
variable "s3files_mount_target_ipv6_address" {
  description = "(Optional) IPv6 address"
  type        = string
  default     = null
}
variable "s3files_mount_target_subnet_id" {
  description = "(Required) Subnet ID. Changing this value forces replacement"
  type        = string
}
variable "s3files_mount_target_security_groups" {
  description = "(Optional) Security group IDs"
  type        = list(string)
  default     = null
}
