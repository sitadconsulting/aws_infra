variable "ecr_account_setting_name" {
  description = "(Required) Name of the account setting. One of: BASIC_SCAN_TYPE_VERSION, BLOB_MOUNTING, REGISTRY_POLICY_SCOPE"
  type        = string
}  
variable "ecr_account_setting_value" {
  description = "(Required) Setting value that is specified. Valid values are: If name is specified as BASIC_SCAN_TYPE_VERSION, one of: AWS_NATIVE, CLAIR,  If name is specified as BLOB_MOUNTING, one of: ENABLED, DISABLED,  If name is specified as REGISTRY_POLICY_SCOPE, one of: V1, V2"
  type        = string
}
