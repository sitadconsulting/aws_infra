variable "connect_security_profile_description" {
  description = "(Optional) Specifies the description of the Security Profile"
  type        = string
  default     = null
}
variable "connect_security_profile_instance_id" {
  description = "(Required) Specifies the identifier of the hosting Amazon Connect Instance"
  type        =  string
}
variable "connect_security_profile_name" {
  description = "(Required) Specifies the name of the Security Profile"
  type        = string
}
variable "connect_security_profile_permissions" {
  description = "(Optional) Specifies a list of permissions assigned to the security profile"
  type        = list(string)
  default     = null
}
variable "connect_security_profile_tags" {
  description = "(Optional) Tags to apply to the Security Profile"
  type        = map(string)
  default     = {}
}
