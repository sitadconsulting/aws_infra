variable "sagemaker_image_description" {
  description = "The description of the image"
  type        = string
  default     = ""
}
variable "sagemaker_image_display_name" {
  description = "The display name of the image. When the image is added to a domain (must be unique to the domain)"
  type        = string
  default     = null
}
variable "sagemaker_image_image_name" {
  description = "The name of the image. Must be unique to your account"
  type        = string
}
variable "sagemaker_image_role_arn" {
  description = "ARN of an IAM role that enables Amazon SageMaker to perform tasks on your behalf"
  type        = string
}
variable "sagemaker_image_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
