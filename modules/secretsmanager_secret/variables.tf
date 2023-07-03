variable "secret_description" {
  description = "Description of the secret"
  type        = string
  default     = ""
}
variable "secret_kms_key_id" {
  description = "ARN or Id of the AWS KMS key to be used to encrypt the secret values in the versions stored in this secret. If you don't specify this value, Secrets Manager defaults to using the AWS account's default KMS key (the one named aws/secretsmanager)"
  type        = string
  default     = ""
}
variable "secret_name" {
  description = "Friendly name of the new secret"
  type        = string
  default     = ""
}
variable "secret_policy" {
  description = "Valid JSON document representing a resource policy"
  type        = string
  default     = ""
}
variable "secret_recovery_window_in_days" {
  description = "Number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 days. The default value is 30"
  type        = number
  default     = 30
}
variable "secret_force_overwrite_replica_secret" {
  description = "Accepts boolean value to specify whether to overwrite a secret with the same name in the destination Region"
  type        = bool
  default     = false
}
variable "secret_tags" {
  description = "Key-value map of user-defined tags that are attached to the secret. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "secret_replica" {
  description = "configuration to support secret relication"
  type        = list(object({
    kms_key_id = optional(string)
    region     = string
  }))
  default     = []
}
