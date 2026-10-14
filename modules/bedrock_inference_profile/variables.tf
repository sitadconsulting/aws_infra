variable "bedrock_inference_profile_description" {
  description = "(Optional) Description of the inference profile"
  type        = string
  default     = null
}
variable "bedrock_inference_profile_name" {
  description = "(Required) Name of the inference profile"
  type        = string
}
variable "bedrock_inference_profile_tags" {
  description = "(Optional) Key-value mapping of resource tags for the inference profile"
  type        = map(string)
  default     = {}
}
variable "bedrock_inference_profile_model_source" {
  description = "(Required) Source of the model this inference profile will track metrics and cost for"
  type        = list(object({
    copy_from = string
  }))
}
