variable "guardduty_member_detector_feature_account_id" {
  description = "(Required) Member account ID to be updated"
  type        = string
}
variable "guardduty_member_detector_feature_detector_id" {
  description = "(Required) Amazon GuardDuty detector ID"
  type        = string
}
variable "guardduty_member_detector_feature_name" {
  description = "(Required) Name of the detector feature. Valid values: S3_DATA_EVENTS, EKS_AUDIT_LOGS, EBS_MALWARE_PROTECTION, RDS_LOGIN_EVENTS, EKS_RUNTIME_MONITORING,RUNTIME_MONITORING, LAMBDA_NETWORK_LOGS"
  type        = string
}
variable "guardduty_member_detector_feature_status" {
  description = "(Required) Status of the detector feature. Valid values: ENABLED, DISABLED"
  type        = string
}
variable "guardduty_member_detector_feature_additional_configuration" {
  description = "(Optional) Additional feature configuration block. If omitted, Terraform does not track changes to additional configurations that AWS manages for the feature. Removing a previously declared additional_configuration block leaves the setting unchanged in AWS; to change a setting, update its status"
  type        = list(object({
    name   = string
    status = string
  }))
  default     = []
}
