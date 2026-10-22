variable "ec2_instance_metadata_defaults_http_endpoint" {
  description = "(Optional) Whether the metadata service is available. Can be \"enabled\", \"disabled\", or \"no-preference\". Default: \"no-preference\""
  type        = string
  default     = null
}
variable "ec2_instance_metadata_defaults_http_tokens" {
  description = "(Optional) Whether the metadata service requires session tokens, also referred to as Instance Metadata Service Version 2 (IMDSv2). Can be \"optional\", \"required\", or \"no-preference\". Default: \"no-preference\""
  type        = string
  default     = null
}
variable "ec2_instance_metadata_defaults_http_put_response_hop_limit" {
  description = "(Optional) The desired HTTP PUT response hop limit for instance metadata requests. The larger the number, the further instance metadata requests can travel. Can be an integer from 1 to 64, or -1 to indicate no preference. Default: -1"
  type        = number
  default     = null
}
variable "ec2_instance_metadata_defaults_instance_metadata_tags" {
  description = "(Optional) Enables or disables access to instance tags from the instance metadata service. Can be \"enabled\", \"disabled\", or \"no-preference\". Default: \"no-preference\""
  type        = string
  default     = null
}
