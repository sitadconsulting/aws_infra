variable "emr_studio_session_mapping_identity_id" {
  description = "(Optional) The globally unique identifier (GUID) of the user or group from the Amazon Web Services SSO Identity Store"
  type        = string
  default     = null
}
variable "emr_studio_session_mapping_identity_name" {
  description = "(Optional) The name of the user or group from the Amazon Web Services SSO Identity Store"
  type        = string
  default     = null
}
variable "emr_studio_session_mapping_identity_type" {
  description = "(Required) Specifies whether the identity to map to the Amazon EMR Studio is a USER or a GROUP"
  type        = string
}
variable "emr_studio_session_mapping_session_policy_arn" {
  description = " (Required) ARN for the session policy that will be applied to the user or group. You should specify the ARN for the session policy that you want to apply, not the ARN of your user role"
  type        = string
}
variable "emr_studio_session_mapping_studio_id" {
  description = "(Required) The ID of the Amazon EMR Studio to which the user or group will be mapped"
  type        = string
}
