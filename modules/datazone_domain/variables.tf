variable "datazone_domain_description" {
  description = "(Optional) Description of the Domain"
  type        = string
  default     = null
}
variable "datazone_domain_domain_execution_role" {
  description = "(Required) ARN of the role used by DataZone to configure the Domain"
  type        = string
}
variable "datazone_domain_domain_version" {
  description = "(Optional) Version of the Domain. Valid values are V1 and V2. Defaults to V1"
  type        = string
  default     = null
}
variable "datazone_domain_kms_key_identifier" {
  description = "(Optional) ARN of the KMS key used to encrypt the Amazon DataZone domain, metadata and reporting data"
  type        = string
  default     = null
}
variable "datazone_domain_name" {
  description = "(Required) Name of the Domain"
  type        = string
}
variable "datazone_domain_service_role" {
  description = "(Optional) ARN of the service role used by DataZone. Required when domain_version is set to V2"
  type        = string
  default     = null
}
variable "datazone_domain_skip_deletion_check" {
  description = "(Optional) Whether to skip the deletion check for the Domain"
  type        = bool
  default     = null
}
variable "datazone_domain_single_sign_on" {
  description = "(Optional) Single sign on options, used to enable AWS IAM Identity Center for DataZone"
  type        = list(object({
    idc_instance_arn = optional(string)
    type             = optional(string)
    user_assignment  = optional(string) 
  }))
  default     = []
}
