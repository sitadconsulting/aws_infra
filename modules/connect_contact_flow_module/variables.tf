variable "connect_contact_flow_module_content" {
  description = "(Optional) Specifies the content of the Contact Flow Module, provided as a JSON string, written in Amazon Connect Contact Flow Language. If defined, the filename argument cannot be used"
  type        = string
  default     = null
}
variable "connect_contact_flow_module_content_hash" {
  description = "(Optional) Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the Contact Flow Module source specified with filename. The usual way to set this is filebase64sha256(\"contact_flow_module.json\") (Terraform 0.11.12 and later) or base64sha256(file(\"contact_flow_module.json\")) (Terraform 0.11.11 and earlier), where \"contact_flow_module.json\" is the local filename of the Contact Flow Module source"
  type        = string
  default     = null
}
variable "connect_contact_flow_module_descriptiop" {
  description = "(Optional) Specifies the description of the Contact Flow Module"
  type        = string
  default     = null
}
variable "connect_contact_flow_module_filename" {
  description = "(Optional) The path to the Contact Flow Module source within the local filesystem. Conflicts with content"
  type        = string
  default     = null
}
variable "connect_contact_flow_module_instance_id" {
  description = "(Required) Specifies the identifier of the hosting Amazon Connect Instance"
  type        = string
}
variable "connect_contact_flow_module_name" {
  description = "(Required) Specifies the name of the Contact Flow Module"
  type        = string
}
variable "connect_contact_flow_module_tags" {
  description = "(Optional) Tags to apply to the Contact Flow Module"
  type        = map(string)
  default     = {}
}
