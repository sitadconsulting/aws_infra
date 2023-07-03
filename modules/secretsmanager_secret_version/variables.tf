variable "secret_version_secret_id" {
  description = "Specifies the secret to which you want to add a new version. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret"
  type        = string
}
variable "secret_version_secret_string" {
  description = "Specifies text data that you want to encrypt and store in this version of the secret. This is required if secret_binary is not set"
  type        = string
  default     = ""
}
variable "secret_version_secret_binary" {
  description = "Specifies binary data that you want to encrypt and store in this version of the secret. This is required if secret_string is not set. Needs to be encoded to base64"
  type        = string
  default     = null
}
variable "secret_version_version_stages" {
  description = "Specifies a list of staging labels that are attached to this version of the secret. A staging label must be unique to a single version of the secret"
  type        = list(string)
  default     = []
}
