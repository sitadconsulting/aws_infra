variable "guardduty_detector_enable" {
  description = "(Optional) Enable monitoring and feedback reporting. Setting to false is equivalent to \"suspending\" GuardDuty. Defaults to true"
  type        = bool
  default     = true
}
variable "guardduty_detector_finding_publishing_frequency" {
  description = "(Optional) Frequency of notifications sent for subsequent finding occurrences. If the detector is a GuardDuty member account, the value is determined by the GuardDuty primary account and cannot be modified, otherwise defaults to SIX_HOURS. For standalone and GuardDuty primary accounts, it must be configured in Terraform to enable drift detection. Valid values for standalone and primary accounts: FIFTEEN_MINUTES, ONE_HOUR, SIX_HOURS"
  type        = string
  default     = null
}
variable "guardduty_detector_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string) 
  default     = {}
}
