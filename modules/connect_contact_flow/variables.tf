variable "connect_contact_flow_content" {
  description = "(Optional) Specifies the content of the Contact Flow, provided as a JSON string, written in Amazon Connect Contact Flow Language. If defined, the filename argument cannot be used"
  type        = string
  default     = null
}
variable "connect_contact_flow_content_hash" {
  description = "(Optional) Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the Contact Flow source specified with filename. The usual way to set this is filebase64sha256(\"mycontact_flow.json\") (Terraform 0.11.12 and later) or base64sha256(file(\"mycontact_flow.json\")) (Terraform 0.11.11 and earlier), where \"mycontact_flow.json\" is the local filename of the Contact Flow source"
  type        = string
  default     = null
}
variable "connect_contact_flow_description" {
  description = "(Optional) Specifies the description of the Contact Flow"
  type        = string
  default     = null
}
variable "connect_contact_flow_filename" {
  description = "(Optional) The path to the Contact Flow source within the local filesystem. Conflicts with content"
  type        = string
  default     = null
}
variable "connect_contact_flow_instance_id" {
  description = "(Required) Specifies the identifier of the hosting Amazon Connect Instance"
  type        = string
}
variable "connect_contact_flow_name" {
  description = "(Required) Specifies the name of the Contact Flow"
  type        = string
}
variable "connect_contact_flow_tags" {
  description = "(Optional) Tags to apply to the Contact Flow"
  type        = map(string)
  default     = {}
}
variable "connect_contact_flow_type" {
  description = "(Optional, Forces new resource) Specifies the type of the Contact Flow. Defaults to CONTACT_FLOW. Allowed Values are: CONTACT_FLOW, CUSTOMER_QUEUE, CUSTOMER_HOLD, CUSTOMER_WHISPER, AGENT_HOLD, AGENT_WHISPER, OUTBOUND_WHISPER, AGENT_TRANSFER, QUEUE_TRANSFER"
  type        = string
  default     = null
}
