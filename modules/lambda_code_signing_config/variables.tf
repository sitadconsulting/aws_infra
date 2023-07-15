variable "lambda_code_signing_config_description" {
  description = "Descriptive name for this code signing configuration"
  type        = string
  default     = ""
}
variable "lambda_code_signing_config_allowed_publishers" {
  description = "A configuration block of allowed publishers as signing profiles for this code signing configuration"
  type        = list(object({
    signing_profile_version_arns = list(string)
  }))
}
variable "lambda_code_signing_config_policies" {
  description = "A configuration block of code signing policies that define the actions to take if the validation checks fail"
  type        = list(object({
    untrusted_artifact_on_deployment = string
  }))
  default     = []
}
