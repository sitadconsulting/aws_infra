variable "qbusiness_application_client_ids_for_oidc" {
  description = "The OIDC client ID for a Amazon Q Business application"
  type        = list(string)
  default     = []
}
variable "qbusiness_application_description" {
  description = "A description for the Amazon Q Business application"
  type        = string
  default     = null
}
variable "qbusiness_application_display_name" {
  description = "The name of the Amazon Q Business application"
  type        = string
}
variable "qbusiness_application_iam_identity_provider_arn" {
  description = "The Amazon Resource Name (ARN) of an identity provider being used by an Amazon Q Business application"
  type        = string
  default     = null
}
variable "qbusiness_application_identity_center_instance_arn" {
  description = "The Amazon Resource Name (ARN) of the IAM Identity Center instance you are either creating for—or connecting to—your Amazon Q Business application"
  type        = string
}
variable "qbusiness_application_identity_type" {
  description = "The authentication type being used by a Amazon Q Business application, allowed values: AWS_IAM_IDP_SAML | AWS_IAM_IDP_OIDC | AWS_IAM_IDC | AWS_QUICKSIGHT_IDP"
  type        = string
  default     = null
}
variable "qbusiness_application_role_arn" {
  description = "The Amazon Resource Name (ARN) of an IAM role with permissions to access your Amazon CloudWatch logs and metrics. If this property is not specified, Amazon Q Business will create a service linked role (SLR) and use it as the application's role"
  type        = string
  default     = null
}
variable "qbusiness_application_tags" {
  description = "Key-value map of resource tags"
  type        = list(object({
    key   = optional(string)
    value = optional(string)
  }))
  default     = []
}
variable "qbusiness_application_attachments_configuration" {
  description = "Configuration information for the file upload during chat feature"
  type        = object({
    attachments_control_mode = optional(string)
  })
  default     = null
}
variable "qbusiness_application_auto_subscription_configuration" {
  description = "Whether to enable or disable auto subscription configuration information for an Amazon Q Business application using IAM identity federation for user management"
  type        = object({
    auto_subscribe            = optional(string)
    default_subscription_type = optional(string)
  })
  default     = null
}
variable "qbusiness_application_encryption_configuration" {
  description = "Provides the identifier of the AWS KMS key used to encrypt data indexed by Amazon Q Business. Amazon Q Business doesn't support asymmetric keys"
  type        = object({
    kms_key_id = optional(string)
  })
  default     = null
}
variable "qbusiness_application_personalization_configuration" {
  description = "Whether to enable or disable chat response personalization"
  type        = object({
    personalization_control_mode = optional(string)
  })
  default     = null
}
variable "qbusiness_application_q_apps_configuration" {
  description = "Whether to enable of disable Amazon Q Apps"
  type        = object({
    q_apps_control_mode = optional(string)
  })
  default     = null
}
variable "qbusiness_application_quick_sight_configuration" {
  description = "Amazon Q Business, QuickSight client namespace"
  type        = object({
    client_namespace = optional(string)
  })
  default     = null
}
