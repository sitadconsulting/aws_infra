variable "guardduty_organization_configuration_feature_auto_enable" {
  description = "(Required) Status of the feature that is configured for the member accounts within the organization. Valid values: NEW, ALL, NONE"
  type        = string
}
variable "guardduty_organization_configuration_feature_detector_id" {
  description = "(Required) ID of the detector that configures the delegated administrator"
  type        = string
}
variable "guardduty_organization_configuration_feature_name" {
  description = "(Required) Name of the feature that will be configured for the organization. Valid values: S3_DATA_EVENTS, EKS_AUDIT_LOGS, EBS_MALWARE_PROTECTION, RDS_LOGIN_EVENTS, EKS_RUNTIME_MONITORING, LAMBDA_NETWORK_LOGS, RUNTIME_MONITORING, AI_PROTECTION. Only one of two features EKS_RUNTIME_MONITORING or RUNTIME_MONITORING can be added, adding both features will cause an error"
  type        = string
}
variable "guardduty_organization_configuration_feature_additional_configuration" {
  description = "(Optional) Additional feature configuration block for features EKS_RUNTIME_MONITORING or RUNTIME_MONITORING, or RDS_LOGIN_EVENTS. If omitted, Terraform does not track changes to additional configurations that AWS manages for the feature. Removing a previously declared additional_configuration block leaves the setting unchanged in AWS; to change a setting, update its auto_enable instead"
  type        = list(object({
    auto_enable = string
    name        = string
  }))
  default     = []
}
