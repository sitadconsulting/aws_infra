variable "sagemaker_device_device_fleet_name" {
  description = "The name of the Device Fleet"
  type        = string
}
variable "sagemaker_device_device" {
  description = "The device to register with SageMaker Edge Manager"
  type        = list(object({
    description    = optional(string)
    device_name    = string
    iot_thing_name = optional(string)
  }))
}
