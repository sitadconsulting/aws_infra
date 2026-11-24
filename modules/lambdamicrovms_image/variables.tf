variable "lambdamicrovms_image_additional_os_capabilities" {
  description = "(Optional) List of additional OS capabilities granted to the MicroVM runtime environment. Valid values: ALL"
  type        = list(string)
  default     = null
}
variable "lambdamicrovms_image_base_image_arn" {
  description = "(Required) ARN of the base MicroVM image. AWS-managed base images use ARNs of the form arn:aws:lambda:<region>:aws:microvm-image:al2023-1"
  type        = string
}
variable "lambdamicrovms_image_base_image_version" {
  description = "(Optional) Major version number of the base MicroVM image to use (e.g., 1). If omitted, the service selects a version"
  type        = string
  default     = null
}
variable "lambdamicrovms_image_build_role_arn" {
  description = "(Required) ARN of the IAM role used to build the image. The role must be assumable by lambda.amazonaws.com and have access to the code artifact"
  type        = string
}
variable "lambdamicrovms_image_description" {
  description = "(Optional) Description of the MicroVM image"
  type        = string
  default     = null
}
variable "lambdamicrovms_image_egress_network_connectors" {
  description = "(Optional) List of egress network connectors available to the MicroVM at runtime. Defaults to [\"INTERNET_EGRESS\"]"
  type        = list(string)
  default     = null
}
variable "lambdamicrovms_image_environment_variables" {
  description = "(Optional) Map of environment variables set in the MicroVM runtime environment"
  type        = map(string)
  default     = {}
}
variable "lambdamicrovms_image_name" {
  description = "(Required) Name of the MicroVM image. Changing this value creates a new resource"
  type        =
  default     =
}
variable "lambdamicrovms_image_tags" {
  description = "(Optional) Map of tags assigned to the resource"
  type        = map(string)
  default     = {}
}
variable "lambdamicrovms_image_code_artifact" {
  description = "(Required) Code artifact containing the application code and metadata for the image"
  type        = list(object({
    uri = string
  }))
}
variable "lambdamicrovms_image_cpu_configuration" {
  description = "(Optional) CPU configuration for the MicroVM"
  type        = list(object({
    architecture = string
  }))
  default     = []
}
