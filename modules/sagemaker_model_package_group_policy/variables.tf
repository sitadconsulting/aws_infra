variable "sagemaker_model_package_group_policy_model_package_group_name" {
  description = "The name of the model package group"
  type        = name
}
variable "sagemaker_model_package_group_policy_resource_policy" {
  description = "The model package group resource policy"
  type        = string
  default     = null
}
