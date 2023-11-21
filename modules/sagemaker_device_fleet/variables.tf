variable "sagemaker_device_fleet_description" {
  description = "A description of the fleet"
  type        = string
  default     = ""
}
variable "sagemaker_device_fleet_device_fleet_name" {
  description = "The name of the Device Fleet (must be unique)"
  type        = string
}
variable "sagemaker_device_fleet_enable_iot_role_alias" {
  description = "Whether to create an AWS IoT Role Alias during device fleet creation. The name of the role alias generated will match this pattern: \"SageMakerEdge-{DeviceFleetName}\""
  type        = bool
  default     = true
}
variable "sagemaker_device_fleet_role_arn" {
  description = "ARN that has access to AWS Internet of Things (IoT)"
  type        = string
}
variable "sagemaker_device_fleet_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_device_fleet_output_config" {
  description = "Specifies details about the repository"
  type        = list(object({
    kms_key_id         = optional(string)
    s3_output_location = string 
  }))
}
