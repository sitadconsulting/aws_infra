variable "spot_instance_request_instance_interruption_behavior" {
  description = "(Optional) Indicates Spot instance behavior when it is interrupted. Valid values are terminate, stop, or hibernate. Default value is terminate"
  type        = string
  default     = null
}
variable "spot_instance_request_launch_group" {
  description = "(Optional) A launch group is a group of spot instances that launch together and terminate together. If left empty instances are launched and terminated individually"
  type        = string
  default     = null
}
variable "spot_instance_request_spot_price" {
  description = "(Optional; Default: On-demand price) The maximum price to request on the spot market"
  type        = string
  default     = null
}
variable "spot_instance_request_spot_type" {
  description = "(Optional; Default: persistent) If set to one-time, after the instance is terminated, the spot request will be closed"
  type        = string
  default     = null
}
variable "spot_instance_request_tags" {
  description = "(Optional) A map of tags to assign to the Spot Instance Request. These tags are not automatically applied to the launched Instance"
  type        = map(string)
  default     = {}
}
variable "spot_instance_request_valid_from" {
  description = "(Optional) The start date and time of the request, in UTC RFC3339 format(for example, YYYY-MM-DDTHH:MM:SSZ). The default is to start fulfilling the request immediately"
  type        = string
  default     = null
}
variable "spot_instance_request_valid_until" {
  description = "(Optional) The end date and time of the request, in UTC RFC3339 format(for example, YYYY-MM-DDTHH:MM:SSZ). At this point, no new Spot instance requests are placed or enabled to fulfill the request. The default end date is 7 days from the current date"
  type        = string
  default     = null
}
variable "spot_instance_request_wait_for_fulfillment" {
  description = "(Optional; Default: false) If set, Terraform will wait for the Spot Request to be fulfilled, and will throw an error if the timeout of 10m is reached"
  type        = bool
  default     = null
}
