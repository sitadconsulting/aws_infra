variable "codebuild_source_credential_auth_type" {
  description = "(Required) The type of authentication used to connect to a GitHub, GitHub Enterprise, or Bitbucket repository. Valid values are BASIC_AUTH, PERSONAL_ACCESS_TOKEN, CODECONNECTIONS, and SECRETS_MANAGER. An OAUTH connection is not supported by the API"
  type        = string
}
variable "codebuild_source_credential_server_type" {
  description = "(Required) The source provider used for this project"
  type        = string
}
variable "codebuild_source_credential_token" {
  description = "(Required) For a GitHub and GitHub Enterprise, this is the personal access token. For Bitbucket, this is the app password. When using an AWS CodeStar connection (auth_type = \"CODECONNECTIONS\"), this is an AWS CodeStar Connection ARN"
  type        = string
  default     = null
}
variable "codebuild_source_credential_user_name" {
  description = "(Optional) The Bitbucket username when the authType is BASIC_AUTH. This parameter is not valid for other types of source providers or connections"
  type        = string
  default     = null
}
