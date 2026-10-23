variable "spot_datafeed_subscription_bucket" {
  description = "(Required) The Amazon S3 bucket in which to store the Spot instance data feed"
  type        = string
}
variable "spot_datafeed_subscription_prefix" {
  description = "(Optional) Path of folder inside bucket to place spot pricing data"
  type        = string
  default     = null
}
