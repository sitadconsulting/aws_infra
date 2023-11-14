variable "cognito_user_pool_alias_attributes" {
  description = "Attributes supported as an alias for this user pool. Valid values: phone_number, email, or preferred_username. Conflicts with username_attributes"
  type        = list(string)
  default     = null
}
variable "cognito_user_pool_auto_verified_attributes" {
  description = "Attributes to be auto-verified. Valid values: email, phone_number"
  type        = list(string)
  default     = null
}
variable "cognito_user_pool_deletion_protection" {
  description = "When active, DeletionProtection prevents accidental deletion of your user pool. Before you can delete a user pool that you have protected against deletion, you must deactivate this feature. Valid values are ACTIVE and INACTIVE, Default value is INACTIVE"
  type        = string
  default     = null
}
variable "cognito_user_pool_email_verification_message" {
  description = "String representing the email verification message. Conflicts with verification_message_template configuration block email_message argument"
  type        = string
  default     = null
}
variable "cognito_user_pool_email_verification_subject" {
  description = "String representing the email verification subject. Conflicts with verification_message_template configuration block email_subject argument"
  type        = string
  default     = null
}
variable "cognito_user_pool_mfa_configuration" {
  description = "Multi-Factor Authentication (MFA) configuration for the User Pool. Defaults of OFF. Valid values are OFF (MFA Tokens are not required), ON (MFA is required for all users to sign in; requires at least one of sms_configuration or software_token_mfa_configuration to be configured), or OPTIONAL (MFA Will be required only for individual users who have MFA Enabled; requires at least one of sms_configuration or software_token_mfa_configuration to be configured)"
  type        = string
  default     = null
}
variable "cognito_user_pool_name" {
  description = "Name of the user pool"
  type        = string
}
variable "cognito_user_pool_sms_authentication_message" {
  description = "String representing the SMS authentication message. The Message must contain the {####} placeholder, which will be replaced with the code"
  type        = string
  default     = ""
}
variable "cognito_user_pool_sms_verification_message" {
  description = "String representing the SMS verification message. Conflicts with verification_message_template configuration block sms_message argument"
  type        = string
  default     = null
}
variable "cognito_user_pool_tags" {
  description = "Map of tags to assign to the User Pool. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "cognito_user_pool_username_attributes" {
  description = "Whether email addresses or phone numbers can be specified as usernames when a user signs up. Conflicts with alias_attributes"
  type        = list(string)
  default     = null
}
variable "cognito_user_pool_account_recovery_setting" {
  description = "Configuration block to define which verified available method a user can use to recover their forgotten password"
  type        = list(object({
    recovery_mechanism =optional( list(object({
      name     = string
      priority = number      
    })), [])
  }))
  default     = []
}
variable "cognito_user_pool_admin_create_user_config" {
  description = "Configuration block for creating a new user profile"
  type        = list(object({
    allow_admin_create_user_only = optional(bool)
    invite_message_template      = optional(list(object({
      email_message = optional(string)
      email_subject = optional(string)
      sms_message   = optional(string)
    })), [])
  }))
  default     = []
}
variable "cognito_user_pool_device_configuration" {
  description = "Configuration block for the user pool's device tracking"
  type        = list(object({
    challenge_required_on_new_device      = optional(bool)
    device_only_remembered_on_user_prompt = optional(bool)
  }))
  default     = []
}
variable "cognito_user_pool_email_configuration" {
  description = "Configuration block for configuring email"
  type        = list(object({
    configuration_set      = optional(string)
    email_sending_account  = optional(string)
    from_email_address     = optional(string)
    reply_to_email_address = optional(string)
    source_arn             = optional(string)
  }))
  default     = []
}
variable "cognito_user_pool_lambda_config" {
  description = "Configuration block for the AWS Lambda triggers associated with the user pool"
  type        = list(object({
    create_auth_challenge          = optional(string)
    custom_message                 = optional(string)
    define_auth_challenge          = optional(string)
    kms_key_id                     = optional(string)
    post_authentication            = optional(string)
    post_confirmation              = optional(string)
    pre_authentication             = optional(string)
    pre_sign_up                    = optional(string)
    pre_token_generation           = optional(string)
    user_migration                 = optional(string)
    verify_auth_challenge_response = optional(string)
    custom_email_sender            = optional(list(object({
      lambda_arn     = string
      lambda_version = string
    })), []) 
    custom_sms_sender              = optional(list(object({
      lambda_arn     = string
      lambda_version = string
    })), [])
  }))
  default     = []
}
variable "cognito_user_pool_password_policy" {
  description = "Configuration block for information about the user pool password policy"
  type        = list(object({
    minimum_length                   = optional(number)
    require_lowercase                = optional(bool)
    require_numbers                  = optional(bool)
    require_symbols                  = optional(bool)
    require_uppercase                = optional(bool)
    temporary_password_validity_days = optional(number)
  }))
  default     = []
}
variable "cognito_user_pool_schema" {
  description = "Configuration block for the schema attributes of a user pool.Schema attributes from the standard attribute set only need to be specified if they are different from the default configuration. Attributes can be added, but not modified or removed. Maximum of 50 attributes"
  type        = list(object({
    attribute_data_type          = string
    developer_only_attribute     = optional(bool)
    mutable                      = optional(bool)
    name                         = string
    required                     = optional(bool)
    number_attribute_constraints = optional(list(object({
      max_value = optional(string)
      min_value = optional(string)
    })), []) 
    string_attribute_constraints = optional(list(object({
      max_value = optional(string)
      min_value = optional(string)
    })), [])
  }))
  default     = []
}
variable "cognito_user_pool_sms_configuration" {
  description = "Configuration block for Short Message Service (SMS) settings. These settings apply to SMS user verification and SMS Multi-Factor Authentication (MFA). Due to Cognito API restrictions, the SMS configuration cannot be removed without recreating the Cognito User Pool. For user data safety, this resource will ignore the removal of this configuration by disabling drift detection. To force resource recreation after this configuration has been applied, see the taint command"
  type        = list(object({
    external_id    = string
    sns_caller_arn = string
    sns_region     = optional(string)
  }))
  default     = []
}
variable "cognito_user_pool_software_token_mfa_configuration" {
  description = "Configuration block for software token Mult-Factor Authentication (MFA) settings"
  type        = list(object({
    enabled = bool
  }))
  default     = []
}
variable "cognito_user_pool_user_attribute_update_settings" {
  description = "Configuration block for user attribute update settings"
  type        = list(object({
    attributes_require_verification_before_update = list(string)
  }))
  default     = []
}
variable "cognito_user_pool_user_pool_add_ons" {
  description = "Configuration block for user pool add-ons to enable user pool advanced security mode features"
  type        = list(object({
    advanced_security_mode = string
  }))
  default     = []
}
variable "cognito_user_pool_username_configuration" {
  description = "Configuration block for username configuration"
  type        = list(object({
    case_sensitive = bool
  }))
  default     = []
}
variable "cognito_user_pool_verification_message_template" {
  description = "Configuration block for verification message templates"
  type        = list(object({
    default_email_option  = optional(string)
    email_message         = optional(string)
    email_message_by_link = optional(string)
    email_subject         = optional(string)
    email_subject_by_link = optional(string)
    sms_message           = optional(string)

  }))
  default     = []
}
