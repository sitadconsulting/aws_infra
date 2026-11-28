variable "grafana_workspace_account_access_type" {
  description = "(Required) Type of account access for the workspace. Valid values are CURRENT_ACCOUNT and ORGANIZATION. If ORGANIZATION is specified, then organizational_units must also be present"
  type        = string
}
variable "grafana_workspace_authentication_providers" {
  description = "(Required) Authentication providers for the workspace. Valid values are AWS_SSO, SAML, or both"
  type        = list(string)
}
variable "grafana_workspace_configuration" {
  description = "(Optional) Configuration string for the workspace that you create"
  type        = string
  default     = null
}
variable "grafana_workspace_data_sources" {
  description = "(Optional) Data sources for the workspace. Valid values are AMAZON_OPENSEARCH_SERVICE, ATHENA, CLOUDWATCH, PROMETHEUS, REDSHIFT, SITEWISE, TIMESTREAM, TWINMAKER, XRAY"
  type        = list(string)
  default     = null
}
variable "grafana_workspace_description" {
  description = "(Optional) Workspace description"
  type        = string
  default     = null
}
variable "grafana_workspace_grafana_version" {
  description = "(Optional) Version of Grafana to support in the new workspace. Supported values are 9.4, 10.4, 12.4 and 13.2. If not specified, defaults to the latest version"
  type        = string
  default     = null
}
variable "grafana_workspace_kms_key_id" {
  description = "(Optional) ARN of the AWS KMS key for encrypting workspace data"
  type        = string
  default     = null
}
variable "grafana_workspace_name" {
  description = "(Optional) Grafana workspace name"
  type        = string
  default     = null
}
variable "grafana_workspace_notification_destinations" {
  description = "(Optional) Notification destinations. If a data source is specified here, Amazon Managed Grafana will create IAM roles and permissions needed to use these destinations. Must be set to SNS"
  type        = list(string)
  default     = null
}
variable "grafana_workspace_organization_role_name" {
  description = "(Optional) Role name that the workspace uses to access resources through Amazon Organizations"
  type        = string
  default     = null
}
variable "grafana_workspace_organizational_units" {
  description = "(Optional) Amazon Organizations organizational units that the workspace is authorized to use data sources from"
  type        = list(string)
  default     = null
}
variable "grafana_workspace_permission_type" {
  description = "(Required) Permission type of the workspace. If SERVICE_MANAGED is specified, the IAM roles and IAM policy attachments are generated automatically. If CUSTOMER_MANAGED is specified, the IAM roles and IAM policy attachments will not be created"
  type        = string
}
variable "grafana_workspace_role_arn" {
  description = "(Optional) IAM role ARN that the workspace assumes"
  type        = string
  default     = null
}
variable "grafana_workspace_stack_set_name" {
  description = "(Optional) AWS CloudFormation stack set name that provisions IAM roles to be used by the workspace"
  type        = string
  default     = null
}
variable "grafana_workspace_tags" {
  description = "(Optional) Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
variable "grafana_workspace_network_access_control" {
  description = "(Optional) Configuration for network access to your workspace"
  type        = list(object({
    prefix_list_ids = list(string)
    vpce_ids        = list(string)
  }))
  default     = []
}
variable "grafana_workspace_vpc_configuration" {
  description = "(Optional) Configuration settings for an Amazon VPC that contains data sources for your Grafana workspace to connect to"
  type        =  list(object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  }))
  default     = []
}
