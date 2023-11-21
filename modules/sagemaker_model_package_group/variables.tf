variable "sagemaker_model_package_group_model_package_group_name" {
  description = "The name of the model group"
  type        = string
}
variable "sagemaker_model_package_group_model_package_group_description" {
  description = "A description for the model group"
  type        = string
  default     = ""
}
variable "sagemaker_model_package_group_tags" {
  description = " A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
