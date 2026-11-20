variable "guardduty_threatintelset_activate" {
  description = "(Required) Whether to start using the uploaded ThreatIntelSet"
  type        = bool
}
variable "guardduty_threatintelset_detector_id" {
  description = "(Required) Detector ID of the GuardDuty"
  type        = string
}
variable "guardduty_threatintelset_format" {
  description = "(Required) Format of the file that contains the ThreatIntelSet. Valid values: TXT | STIX | OTX_CSV | ALIEN_VAULT | PROOF_POINT | FIRE_EYE"
  type        = string
}
variable "guardduty_threatintelset_location" {
  description = "(Required) URI of the file that contains the ThreatIntelSet"
  type        = string
}
variable "guardduty_threatintelset_name" {
  description = "(Required) Friendly name to identify the ThreatIntelSet"
  type        = string
}
variable "guardduty_threatintelset_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
