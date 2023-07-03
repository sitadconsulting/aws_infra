variable "vpclattice_access_log_subscription_destination_arn" {
  description = "Amazon Resource Name (ARN) of the log destination"
  type        = string
}
variable "vpclattice_access_log_subscription_resource_identifier" {
  description = "The ID or Amazon Resource Identifier (ARN) of the service network or service. You must use the ARN if the resources specified in the operation are in different accounts"
  type        = string
}
