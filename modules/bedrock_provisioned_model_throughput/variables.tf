variable "bedrock_provisioned_model_throughput_commitment_duration" {
  description = "(Optional) Commitment duration requested for the Provisioned Throughput. For custom models, you can purchase on-demand Provisioned Throughput by omitting this argument. Valid values: OneMonth, SixMonths"
  type        =  string
  default     = null
}
variable "bedrock_provisioned_model_throughput_model_arn" {
  description = "(Required) ARN of the model to associate with this Provisioned Throughput"
  type        = string
}
variable "bedrock_provisioned_model_throughput_model_units" {
  description = "(Required) Number of model units to allocate. A model unit delivers a specific throughput level for the specified model"
  type        = number
}
variable "bedrock_provisioned_model_throughput_provisioned_model_name" {
  description = "(Required) Unique name for this Provisioned Throughput"
  type        =  string
}
variable "bedrock_provisioned_model_throughput_tags" {
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}

