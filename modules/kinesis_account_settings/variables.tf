variable "kinesis_account_settings_minimum_throughput_billing_commitment" {
  description = "(Optional) Minimum throughput billing commitment configuration"
  type        = list(object({
    status = string
  }))
  default     = []
}
