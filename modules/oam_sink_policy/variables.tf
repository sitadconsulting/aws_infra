variable "oam_sink_policy_sink_identifier" {
  description = "(Required) ARN of the sink to attach this policy to"
  type        = string
}
variable "oam_sink_policy_policy" {
  description = "(Required) JSON policy to use. If you are updating an existing policy, the entire existing policy is replaced by what you specify here"
  type        = string
}
