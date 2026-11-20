variable "guardduty_organization_configuration_auto_enable_organization_members" {
  description = "(Required) Auto-enablement configuration of GuardDuty for the member accounts in the organization. Valid values are ALL, NEW, NONE"
  type        = string
}
variable "guardduty_organization_configuration_detector_id" {
  description = "(Required) Detector ID of the GuardDuty account"
  type        = string
}
variable "guardduty_organization_configuration_datasources" {
  description = "(Optional) Configuration for the collected datasources"
  type        = list(object({
    kubernetes         = optional(list(object({
      audit_logs = list(object({
        enable = bool
      }))
    })), [])
    malware_protection = optional(list(object({
      scan_ec2_instance_with_findings = list(object({
        ebs_volumes = list(object({
          auto_enable = bool
        }))
      }))
    })), [])
    s3_logs            = optional(list(object({
     auto_enable = bool
    })), []) 
  }))
  default     = []
}
