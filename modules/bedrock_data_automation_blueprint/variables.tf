variable "bedrock_blueprint_blueprint_name" {
  description = "The blueprint's name"
  type        = string
}
variable "bedrock_blueprint_kms_encryption_context" {
  description = "Name-value pairs to include as an encryption context"
  type        = map(string)
  default     = null
}
variable "bedrock_blueprint_kms_key_id" {
  description = "The AWS KMS key to use for encryption"
  type        = string
  default     = null
}
variable "bedrock_blueprint_schema" {
  description = "The blueprint's schema"
  type        = string
}
variable "bedrock_blueprint_tags" {
  description = "A map of tags to assign to the blueprint resource"
  type        = list(object({
    key   = optional(string)
    value = optional(string)
  }))
  default     = null
}
variable "bedrock_blueprint_type" {
  description = "The blueprint's type. Allowed values: DOCUMENT | IMAGE | AUDIO | VIDEO"
  type        = string
}

