variable "connect_user_directory_user_id" {
  description = "(Optional) The identifier of the user account in the directory used for identity management. If Amazon Connect cannot access the directory, you can specify this identifier to authenticate users. If you include the identifier, we assume that Amazon Connect cannot access the directory. Otherwise, the identity information is used to authenticate users from your directory. This parameter is required if you are using an existing directory for identity management in Amazon Connect when Amazon Connect cannot access your directory to authenticate users. If you are using SAML for identity management and include this parameter, an error is returned"
  type        = string
  default     = null
}
variable "connect_user_hierarchy_group_id" {
  description = "(Optional) The identifier of the hierarchy group for the user"
  type        = string
  default     = null
}
variable "connect_user_instance_id" {
  description = "(Required) Specifies the identifier of the hosting Amazon Connect Instance"
  type        = string
}
variable "connect_user_name" {
  description = "(Required) The user name for the account. For instances not using SAML for identity management, the user name can include up to 20 characters. If you are using SAML for identity management, the user name can include up to 64 characters from [a-zA-Z0-9_-.\@]+"
  type        = string
}
variable "connect_user_password" {
  description = "(Optional) The password for the user account. A password is required if you are using Amazon Connect for identity management. Otherwise, it is an error to include a password"
  type        = string
  default     = null
}
variable "connect_user_routing_profile_id" {
  description = "(Required) The identifier of the routing profile for the user"
  type        = string
}
variable "connect_user_security_profile_ids" {
  description = "(Required) A list of identifiers for the security profiles for the user. Specify a minimum of 1 and maximum of 10 security profile IDs"
  type        = list(string)
}
variable "connect_user_tags" {
  description = "(Optional) Tags to apply to the user"
  type        = map(string)
  default     = {}
}
variable "connect_user_identity_info" {
  description = "(Optional) A block that contains information about the identity of the user"
  type        = list(object({
    email           = optional(string)
    first_name      = optional(string)
    last_name       = optional(string)
    secondary_email = optional(string)
  }))
  default     = []
}
variable "connect_user_phone_config" {
  description = "(Required) A block that contains information about the phone settings for the user"
  type        = list(object({
    after_contact_work_time_limit = optional(number)
    auto_accept                   = optional(bool)
    desk_phone_number             = optional(string)
    phone_type                    = string
  }))
}
