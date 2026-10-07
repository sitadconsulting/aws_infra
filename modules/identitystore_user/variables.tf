variable "identitystore_user_display_name" {
  description = "The name that is typically displayed when the user is referenced"
  type        = string
}
variable "identitystore_user_identity_store_id" {
  description = "The globally unique identifier for the identity store that this user is in"
  type        = string
}
variable "identitystore_user_locale" {
  description = "The user's geographical region or location"
  type        = string
  default     = null
}
variable "identitystore_user_nickname" {
  description = "An alternate name for the user"
  type        = string
  default     = null
}
variable "identitystore_user_preferred_language" {
  description = "The preferred language of the user"
  type        = string
  default     = null
}
variable "identitystore_user_profile_url" {
  description = "An URL that may be associated with the user"
  type        = string
  default     = null
}
variable "identitystore_user_timezone" {
  description = "The user's time zone"
  type        = string
  default     = null
}
variable "identitystore_user_title" {
  description = "The user's title"
  type        = string
  default     = null
}
variable "identitystore_user_user_name" {
  description = "A unique string used to identify the user. This value can consist of letters, accented characters, symbols, numbers, and punct
uation. This value is specified at the time the user is created and stored as an attribute of the user object in the identity store. The limit
is 128 characters"
  type        = string
}
variable "identitystore_user_user_type" {
  description = "The user type"
  type        = string
  default     = null
}
variable "identitystore_user_addresses" {
  description = "Details about the user's address. At most 1 address is allowed. Detailed below"
  type          = list(object({
    country        = optional(string)
    formatted      = optional(string)
    locality       = optional(string)
    postal_code    = optional(string)
    primary        = optional(bool)
    region         = optional(string)
    street_address = optional(string)
    type           = optional(string)
  }))
  default     = []
}
variable "identitystore_user_emails" {
  description = "Details about the user's email. At most 1 email is allowed"
  type        = list(object({
    primary = optional(bool)
    type    = optional(string)
    value   = optional(string)
  }))
  default     = []
}
variable "identitystore_user_name" {
  description = "Details about the user's full name"
  type        = list(object({
    family_name      = string
    formatted        = optional(string)
    given_name       = string
    honorific_prefix = optional(string)
    honorific_suffix = optional(string)
    middle_name      = optional(string)
  }))
}
variable "identitystore_user_phone_numbers" {
  description = "Details about the user's phone number. At most 1 phone number is allowed"
  type        = list(object({
    primary = optional(bool)
    type    = optional(string)
    value   = optional(string)
  }))
  default     = []
}
