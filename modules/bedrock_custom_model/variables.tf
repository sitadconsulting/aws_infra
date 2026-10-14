variable "bedrock_custom_model_base_model_identifier" {
  description = "(Required) The Amazon Resource Name (ARN) of the base model"
  type        = string
}
variable "bedrock_custom_model_custom_model_kms_key_id" {
  description = "(Optional) The custom model is encrypted at rest using this key. Specify the key ARN"
  type        = string
  default     = null
}
variable "bedrock_custom_model_custom_model_name" {
  description = "(Required) Name for the custom model"
  type        = string
}
variable "bedrock_custom_model_customization_type" {
  description = "(Optional) The customization type. Valid values: FINE_TUNING, CONTINUED_PRE_TRAINING"
  type        = string
  default     = null
}
variable "bedrock_custom_model_hyperparameters" {
  description = "(Required) Parameters related to tuning the model"
  type        = map(string)
}
variable "bedrock_custom_model_job_name" {
  description = "(Required) A name for the customization job"
  type        = string
}
variable "bedrock_custom_model_role_arn" {
  description = "(Required) The Amazon Resource Name (ARN) of an IAM role that Bedrock can assume to perform tasks on your behalf"
  type        = string
}
variable "bedrock_custom_model_tags" {
  description = "(Optional) A map of tags to assign to the customization job and custom model. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "bedrock_custom_model_output_data_config" {
  description = "(Required) S3 location for the output data"
  type        = list(object({
    s3_uri = string
  }))
}
variable "bedrock_custom_model_training_data_config" {
  description = "(Required) Information about the training dataset"
  type        = list(object({
    s3_uri = string
  }))
}
variable "bedrock_custom_model_validation_data_config" {
  description = "(Optional) Information about the validation dataset"
  type        = list(object({
    validator = list(object({
      s3_uri = string
    }))
  }))
  default     = []
}
variable "bedrock_custom_model_vpc_config" {
  description = "(Optional) Configuration parameters for the private Virtual Private Cloud (VPC) that contains the resources you are using for this job"
  type        = list(object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })) 
  default     = []
}
