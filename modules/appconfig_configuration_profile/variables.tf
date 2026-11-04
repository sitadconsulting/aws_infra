variable "appconfig_configuration_profile_application_id" {
  description = "(Required, Forces new resource) Application ID. Must be between 4 and 7 characters in length"
  type        = string
}
variable "appconfig_configuration_profile_description" {
  description = "(Optional) Description of the configuration profile. Can be at most 1024 characters"
  type        = string
  default     = null
}
variable "appconfig_configuration_profile_kms_key_identifier" {
  description = "(Optional) Identifier for a KMS key to encrypt new configuration data versions in the AppConfig hosted configuration store. This attribute is only used for hosted configuration types. The identifier can be an KMS key ID, alias, or the ARN of the key ID or alias"
  type        = string
  default     = null
}
variable "appconfig_configuration_profile_location_uri" {
  description = "(Required, Forces new resource) URI to locate the configuration. You can specify the AWS AppConfig hosted configuration store, Systems Manager (SSM) document, an SSM Parameter Store parameter, or an Amazon S3 object. For the hosted configuration store, specify hosted. For an SSM document, specify either the document name in the format ssm-document://<Document_name> or the ARN. For a parameter, specify either the parameter name in the format ssm-parameter://<Parameter_name> or the ARN. For an Amazon S3 object, specify the URI in the following format: s3://<bucket>/<objectKey>"
  type        = string
}
variable "appconfig_configuration_profile_name" {
  description = "(Required) Name for the configuration profile. Must be between 1 and 128 characters in length"
  type        = string
}
variable "appconfig_configuration_profile_retrieval_role_arn" {
  description = "(Optional) ARN of an IAM role with permission to access the configuration at the specified location_uri. A retrieval role ARN is not required for configurations stored in the AWS AppConfig hosted configuration store. It is required for all other sources that store your configuration"
  type        = string
  default     = null
}
variable "appconfig_configuration_profile_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "appconfig_configuration_profile_type" {
  description = "(Optional) Type of configurations contained in the profile. Valid values: AWS.AppConfig.FeatureFlags and AWS.Freeform. Default: AWS.Freeform"
  type        = string
  default     = null
}
variable "appconfig_configuration_profile_validator" {
  description = "(Optional) Set of methods for validating the configuration. Maximum of 2"
  type        = list(object({
    content = optional(string)
    type    = string
  }))
  default     = []
}
