variable "sagemaker_image_version_image_name" {
  description = "The name of the image. Must be unique to your account"
  type        = string
}
variable "sagemaker_image_version_base_image" {
  description = "The registry path of the container image on which this image version is based"
  type        = string
}
