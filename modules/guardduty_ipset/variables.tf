variable "guardduty_ipset_activate" {
  description = "(Required) Whether to start using the uploaded IPSet"
  type        = bool
}
variable "guardduty_ipset_detector_id" {
  description = "(Required) Detector ID of the GuardDuty"
  type        = string
}
variable "guardduty_ipset_format" {
  description = "(Required) Format of the file that contains the IPSet. Valid values: TXT | STIX | OTX_CSV | ALIEN_VAULT | PROOF_POINT | FIRE_EYE"
  type        = string
}
variable "guardduty_ipset_location" {
  description = "(Required) URI of the file that contains the IPSet"
  type        = string
}
variable "guardduty_ipset_name" {
  description = "(Required) Friendly name to identify the IPSet"
  type        = string
}
variable "guardduty_ipset_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
