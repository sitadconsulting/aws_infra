variable "ec2_allowed_images_settings_state" {
  description = "(Required) State of the allowed images settings. Valid values are enabled or audit-mode"
  type        = string
}
variable "ec2_allowed_images_settings_image_criterion" {
  description = "(Optional) List of image criteria. Maximum of 10 criterion blocks allowed"
  type        = list(object({
    image_names                = optional(list(string))
    image_providers            = optional(list(string))
    marketplace_product_codes  = optional(list(string))  
    creation_date_condition    = optional(list(object({
      maximum_days_since_created = number
    })), [])
    deprecation_time_condition = optional(list(object({
      maximum_days_since_deprecated = number 
    })), [])
  }))
  default     = []
}
