variable "sagemaker_notebook_instance_lifecycle_configuration_name" {
  description = "The name of the lifecycle configuration (must be unique). If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = null
}
variable "sagemaker_notebook_instance_lifecycle_configuration_on_create" {
  description = "A shell script (base64-encoded) that runs only once when the SageMaker Notebook Instance is created"
  type        = string
  default     = null
}
variable "sagemaker_notebook_instance_lifecycle_configuration_on_start" {
  description = "A shell script (base64-encoded) that runs every time the SageMaker Notebook Instance is started including the time it's created"
  type        = string
  default     = null
}
