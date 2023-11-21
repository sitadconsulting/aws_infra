variable "sagemaker_notebook_instance_accelerator_types" {
  description = "A list of Elastic Inference (EI) instance types to associate with this notebook instance. See Elastic Inference Accelerator for more details. Valid values: ml.eia1.medium, ml.eia1.large, ml.eia1.xlarge, ml.eia2.medium, ml.eia2.large, ml.eia2.xlarge"
  type        = list(string)
  default     = null
}
variable "sagemaker_notebook_instance_additional_code_repositories" {
  description = " An array of up to three Git repositories to associate with the notebook instance. These can be either the names of Git repositories stored as resources in your account, or the URL of Git repositories in AWS CodeCommit or in any other Git repository. These repositories are cloned at the same level as the default repository of your notebook instance"
  type        = list(string)
  default     = null
}
variable "sagemaker_notebook_instance_default_code_repository" {
  description = "The Git repository associated with the notebook instance as its default code repository. This can be either the name of a Git repository stored as a resource in your account, or the URL of a Git repository in AWS CodeCommit or in any other Git repository"
  type        = string
  default     = null
}
variable "sagemaker_notebook_instance_direct_internet_access" {
  description = "Set to Disabled to disable internet access to notebook. Requires security_groups and subnet_id to be set. Supported values: Enabled (Default) or Disabled. If set to Disabled, the notebook instance will be able to access resources only in your VPC, and will not be able to connect to Amazon SageMaker training and endpoint services unless your configure a NAT Gateway in your VPC"
  type        = string
  default     = null
}
variable "sagemaker_notebook_instance_instance_type" {
  description = "The name of ML compute instance type"
  type        = string
}
variable "sagemaker_notebook_instance_kms_key_id" {
  description = "The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt the model artifacts at rest using Amazon S3 server-side encryption"
  type        = string
  default     = null
}
variable "sagemaker_notebook_instance_lifecycle_config_name" {
  description = "The name of a lifecycle configuration to associate with the notebook instance"
  type        = string
  default     = null
}
variable "sagemaker_notebook_instance_name" {
  description = "The name of the notebook instance (must be unique)"
  type        = string
}
variable "sagemaker_notebook_instance_platform_identifier" {
  description = "The platform identifier of the notebook instance runtime environment. This value can be either notebook-al1-v1, notebook-al2-v1, or notebook-al2-v2, depending on which version of Amazon Linux you require"
  type        = string
  default     = null
}
variable "sagemaker_notebook_instance_role_arn" {
  description = "The ARN of the IAM role to be used by the notebook instance which allows SageMaker to call other services on your behalf"
  type        = string
}
variable "sagemaker_notebook_instance_root_access" {
  description = "Whether root access is Enabled or Disabled for users of the notebook instance. The default value is Enabled"
  type        = string
  default     = null
}
variable "sagemaker_notebook_instance_security_groups" {
  description = "The associated security groups"
  type        = list(string)
  default     = null
}
variable "sagemaker_notebook_instance_subnet_id" {
  description = "The VPC subnet ID"
  type        = list(string)
  default     = null
}
variable "sagemaker_notebook_instance_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_notebook_instance_volume_size" {
  description = "The size, in GB, of the ML storage volume to attach to the notebook instance. The default value is 5 GB"
  type        = number
  default     = null
}
variable "sagemaker_notebook_instance_instance_metadata_service_configuration" {
  description = "Information on the IMDS configuration of the notebook instance. Conflicts with instance_metadata_service_configuration"
  type        = list(object({
    minimum_instance_metadata_service_version = optional(string)
  }))
  default     = []
}
