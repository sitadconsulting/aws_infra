variable "iam_virtual_mfa_device_path" {
  description = "(Optional) Path for the virtual MFA device"
  type        = string
  default     = null
}
variable "iam_virtual_mfa_device_tags" {
  description = "(Optional) Map of resource tags for the virtual MFA device"
  type        = map(string)
  default     = {}
}
variable "iam_virtual_mfa_device_virtual_mfa_device_name" {
  description = "(Required) Name of the virtual MFA device. Use with path to uniquely identify a virtual MFA device"
  type        = string
}
