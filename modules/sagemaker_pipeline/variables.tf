variable "sagemaker_pipeline_pipeline_definition" {
  description = "The JSON pipeline definition of the pipeline"
  type        = string
  default     = null
}
variable "sagemaker_pipeline_pipeline_description" {
  description = "A description of the pipeline"
  type        = string
  default     = ""
}
variable "sagemaker_pipeline_pipeline_display_name" {
  description = "The display name of the pipeline"
  type        = string
}
variable "sagemaker_pipeline_pipeline_name" {
  description = "The name of the pipeline"
  type        = string
}
variable "sagemaker_pipeline_role_arn" {
  description = "The name of the role assigned to the Pipeline (must be unique)"
  type        = string
}
variable "sagemaker_pipeline_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_pipeline_parallelism_configuration" {
  description = "This is the configuration that controls the parallelism of the pipeline. If specified, it applies to all runs of this pipeline by default"
  type        = list(object({
    max_parallel_execution_steps = number
  }))
  default     = []
}
variable "sagemaker_pipeline_pipeline_definition_s3_location" {
  description = "The location of the pipeline definition stored in Amazon S3. If specified, SageMaker will retrieve the pipeline definition from this location"
  type        = list(object({
    bucket     = string
    object_key = string
    version_id = optional(string)
  }))
  default     = []
}
