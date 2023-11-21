variable "sagemaker_studio_lifecycle_config_studio_lifecycle_config_app_type" {
  description = "The App type that the Lifecycle Configuration is attached to. Valid values are JupyterServer and KernelGateway"
  type        = string
}
variable "sagemaker_studio_lifecycle_config_studio_lifecycle_config_content" {
  description = "The content of your Studio Lifecycle Configuration script. This content must be base64 encoded"
  type        = string
}
variable "sagemaker_studio_lifecycle_config_studio_lifecycle_config_name" {
  description = "The name of the Studio Lifecycle Configuration to create"
  type        = string
}
variable "sagemaker_studio_lifecycle_config_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
