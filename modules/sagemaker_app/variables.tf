variable "sagemaker_app_app_name" {
  description = "The name of the app"
  type        = string
}
variable "sagemaker_app_app_type" {
  description = "The type of app. Valid values are JupyterServer, KernelGateway, RStudioServerPro, RSessionGateway and TensorBoard"
  type        = string
}
variable "sagemaker_app_domain_id" {
  description = "The domain ID"
  type        = string
}
variable "sagemaker_app_space_name" {
  description = "The name of the space. At least one of user_profile_name or space_name required"
  type        = string
  default     = null
}
variable "sagemaker_app_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_app_user_profile_name" {
  description = "The user profile name. At least one of user_profile_name or space_name required"
  type        = string
  default     = null
}
variable "sagemaker_app_resource_spec" {
  description = "The instance type and the Amazon Resource Name (ARN) of the SageMaker image created on the instance"
  type        = list(object({
    instance_type               = optional(string)
    lifecycle_config_arn        = optional(string)
    sagemaker_image_arn         = optional(string)
    sagemaker_image_version_arn = optional(string)
  }))
  default     = []
}
