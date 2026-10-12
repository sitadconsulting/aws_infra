variable "qbusiness_web_experience_application_id" {
  description = "The identifier of the Amazon Q Business web experience"
  type        = string
}
variable "qbusiness_web_experience_origins" {
  description = "Sets the website domain origins that are allowed to embed the Amazon Q Business web experience. The domain origin refers to the base URL for accessing a website including the protocol (http/https), the domain name, and the port number (if specified)"
  type        = list(string)
  default     = null
}
variable "qbusiness_web_experience_role_arn" {
  description = "ARN of the service role attached to your web experience"
  type        = string
  default     = null
}
variable "qbusiness_web_experience_sample_prompts_control_mode" {
  description = "Determines whether sample prompts are enabled in the web experience for an end user, allowed values: ENABLED | DISABLED" 
  type        = string
  default     = null
}
variable "qbusiness_web_experience_subtitle" {
  description = "A subtitle to personalize your Amazon Q Business web experience"
  type        = string
  default     = null
}
variable "qbusiness_web_experience_tags" {
  description = "A list of key-value pairs that identify or categorize your Amazon Q Business web experience"
  type        = list(object({
    key   = optional(string)
    value = optional(string)
  }))
  default     = []
}
variable "qbusiness_web_experience_title" {
  description = "The title for your Amazon Q Business web experience"
  type        = string
  default     = null
}
variable "qbusiness_web_experience_welcome_message" {
  description = "A message in an Amazon Q Business web experience"
  type        = string
  default     = null
}
variable "qbusiness_web_experience_browser_extension_configuration" {
  description = "The container for browser extension configuration for an Amazon Q Business web experience"
  type        = object({
    enabled_browser_extensions = optional(list(string))
  })
  default     = null
}
variable "qbusiness_web_experience_customization_configuration" {
  description = "Contains the configuration information to customize the logo, font, and color of an Amazon Q Business web experience with individual files for each property or a CSS file for them all"
  type        = object({
    custom_css_url = optional(string)
    favicon_url    = optional(string)
    font_url       = optional(string)
    logo_url       = optional(string)
  })
  default     = null
}
variable "qbusiness_web_experience_identity_provider_configuration" {
  description = "Provides information about the identity provider (IdP) used to authenticate end users of an Amazon Q Business web experience"
  type        = object({
    open_id_connect_configuration = optional(object({
      secrets_arn  = optional(string)
      secrets_role = optional(string)
    }), {})
    saml_configuration = optional(object({
      authentication_url = optional(string)
    }), {})
  })
  default     = null
}
