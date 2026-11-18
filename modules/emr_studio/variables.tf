variable "emr_studio_auth_mode" {
  description = "(Required) Specifies whether the Studio authenticates users using IAM or Amazon Web Services SSO. Valid values are SSO or IAM."
  type        = string
}
variable "emr_studio_default_s3_location" {
  description = " (Required) The Amazon S3 location to back up Amazon EMR Studio Workspaces and notebook files"
  type        = string
}
variable "emr_studio_description" {
  description = "(Optional) A detailed description of the Amazon EMR Studio"
  type        = string
  default     = null
}
variable "emr_studio_encryption_key_arn" {
  description = "(Optional) The AWS KMS key identifier (ARN) used to encrypt Amazon EMR Studio workspace and notebook files when backed up to Amazon S3"
  type        = string
  default     = null
}
variable "emr_studio_engine_security_group_id" {
  description = "(Required) The ID of the Amazon EMR Studio Engine security group. The Engine security group allows inbound network traffic from the Workspace security group, and it must be in the same VPC specified by vpc_id"
  type        = string
}
variable "emr_studio_idp_auth_url" {
  description = "(Optional) The authentication endpoint of your identity provider (IdP). Specify this value when you use IAM authentication and want to let federated users log in to a Studio with the Studio URL and credentials from your IdP. Amazon EMR Studio redirects users to this endpoint to enter credentials"
  type        = string
  default     = null
}
variable "emr_studio_idp_relay_state_parameter_name" {
  description = "(Optional) The name that your identity provider (IdP) uses for its RelayState parameter. For example, RelayState or TargetSource. Specify this value when you use IAM authentication and want to let federated users log in to a Studio using the Studio URL. The RelayState parameter differs by IdP"
  type        = string
  default     = null
}
variable "emr_studio_name" {
  description = "(Required) A descriptive name for the Amazon EMR Studio"
  type        = string
}
variable "emr_studio_service_role" {
  description = "(Required) The IAM role that the Amazon EMR Studio assumes. The service role provides a way for Amazon EMR Studio to interoperate with other Amazon Web Services services"
  type        = string
}
variable "emr_studio_subnet_ids" {
  description = "(Required) A list of subnet IDs to associate with the Amazon EMR Studio. A Studio can have a maximum of 5 subnets. The subnets must belong to the VPC specified by vpc_id. Studio users can create a Workspace in any of the specified subnets"
  type        = list(string)
}
variable "emr_studio_tags" {
  description = "(Optional) list of tags to apply to the EMR Cluster"
  type        = map(string)
  default     = {}
}
variable "emr_studio_user_role" {
  description = "(Optional) - The IAM user role that users and groups assume when logged in to an Amazon EMR Studio. Only specify a User Role when you use Amazon Web Services SSO authentication. The permissions attached to the User Role can be scoped down for each user or group using session policies"
  type        = string
  default     = null
}
variable "emr_studio_vpc_id" {
  description = "(Required) ID of the VPC to associate with the Studio"
  type        = string
}
variable "emr_studio_workspace_security_group_id" {
  description = "(Required) The ID of the Amazon EMR Studio Workspace security group. The Workspace security group allows outbound network traffic to resources in the Engine security group, and it must be in the same VPC specified by vpc_id"
  type        = string
}
