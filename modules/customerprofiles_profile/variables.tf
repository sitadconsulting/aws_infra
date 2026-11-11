variable "customerprofiles_profile_account_number" {
  description = "(Optional) A unique account number that you have given to the customer"
  type        = string
  default     = null
}
variable "customerprofiles_profile_additional_information" {
  description = "(Optional) Any additional information relevant to the customer’s profile"
  type        = string
  default     = null
}
variable "customerprofiles_profile_attributes" {
  description = "(Optional) A key value pair of attributes of a customer profile"
  type        = map(string)
  default     = {}
}
variable "customerprofiles_profile_birth_date" {
  description = "(Optional) The customer’s birth date"
  type        = string
  default     = null
}
variable "customerprofiles_profile_business_email_address" {
  description = "(Optional) The customer’s business email address"
  type        = string
  default     = null
}
variable "customerprofiles_profile_business_name" {
  description = "(Optional) The name of the customer’s business"
  type        = string
  default     = null
}
variable "customerprofiles_profile_business_phone_number" {
  description = "(OPtional) The customer’s business phone number"
  type        = string
  default     = null
}
variable "customerprofiles_profile_domain_name" {
  description = "(Required) The name of your Customer Profile domain. It must be unique for your AWS account"
  type        = string
}
variable "customerprofiles_profile_email_address" {
  description = "(Optional) The customer’s email address, which has not been specified as a personal or business address"
  type        = string
  default     = null
}
variable "customerprofiles_profile_first_name" {
  description = "(OPtional) The customer’s first name"
  type        = string
  default     = null
}
variable "customerprofiles_profile_gender_string" {
  description = "(Optional) The gender with which the customer identifies"
  type        = string
  default     = null
}
variable "customerprofiles_profile_home_phone_number" {
  description = "(Optional) The customer’s home phone number"
  type        = string
  default     = null
}
variable "customerprofiles_profile_last_name" {
  description = "(Optional) The customer’s last name"
  type        = string
  default     = null
}
variable "customerprofiles_profile_middle_name" {
  description = "(Optional) The customer’s middle name"
  type        = string
  default     = null
}
variable "customerprofiles_profile_mobile_phone_number" {
  description = "(Optional) The customer’s mobile phone number"
  type        = string
  default     = null
}
variable "customerprofiles_profile_party_type_string" {
  description = "(Optional) The type of profile used to describe the customer"
  type        = string
  default     = null
}
variable "customerprofiles_profile_personal_email_address" {
  description = "(Optional) The customer’s personal email address"
  type        = string
  default     = null
}
variable "customerprofiles_profile_phone_number" {
  description = "(Optional) The customer’s phone number, which has not been specified as a mobile, home, or business number"
  type        = string
  default     = null
}
variable "customerprofiles_profile_address" {
  description = "(Optional) A block that specifies a generic address associated with the customer that is not mailing, shipping, or billing"
  type        = list(object({
    address_1   = optional(string)
    address_2   = optional(string)
    address_3   = optional(string)
    address_4   = optional(string)
    city        = optional(string)
    country     = optional(string)
    county      = optional(string)
    postal_code = optional(string)
    province    = optional(string)
    state       = optional(string)
  }))
  default     = []
}
variable "customerprofiles_profile_billing_address" {
  description = "(Optional) A block that specifies the customer’s billing address"
  type        = list(object({
    address_1   = optional(string)
    address_2   = optional(string)
    address_3   = optional(string)
    address_4   = optional(string)
    city        = optional(string)
    country     = optional(string)
    county      = optional(string)
    postal_code = optional(string)
    province    = optional(string)
    state       = optional(string)
  }))
  default     = []
}
variable "customerprofiles_profile_mailing_address" {
  description = "(Optional) A block that specifies the customer’s mailing address"
  type        = list(object({
    address_1   = optional(string)
    address_2   = optional(string)
    address_3   = optional(string)
    address_4   = optional(string)
    city        = optional(string)
    country     = optional(string)
    county      = optional(string)
    postal_code = optional(string)
    province    = optional(string)
    state       = optional(string)
  }))
  default     = []
}
variable "customerprofiles_profile_shipping_address" {
  description = "(Optional) A block that specifies the customer’s shipping address"
  type        = list(object({
    address_1   = optional(string)
    address_2   = optional(string)
    address_3   = optional(string)
    address_4   = optional(string)
    city        = optional(string)
    country     = optional(string)
    county      = optional(string)
    postal_code = optional(string)
    province    = optional(string)
    state       = optional(string)
  }))
  default     = []
}
