variable "lambda_capacity_provider_name" {
  description = "(Required) Name of the Capacity Provider"
  type        = string
}
variable "lambda_capacity_provider_kms_key_arn" {
  description = "(Optional) ARN of the KMS key used to encrypt the Capacity Provider"
  type        = string
  default     = null
}
variable "lambda_capacity_provider_tags" {
  description = "(Optional) Map of tags assigned to the resource"
  type        = map(string)
  default     = {}
}
variable "lambda_capacity_provider_capacity_provider_scaling_config" {
  description = "(Optional) Configuration block for scaling policy settings"
  type        = list(object({
    max_vcpu_count   = optional(number)
    scaling_mode     = string
    scaling_policies = optional(list(object({
      predefined_metric_type = string
      target_value           = number
    })), [])
  }))
  default     = []
}
variable "lambda_capacity_provider_instance_requirements" {
  description = "(Optional) Configuration block for instance requirements settings"
  type        = list(object({
    allowed_instance_types  = optional(list(string))
    architectures           = list(string)
    excluded_instance_types = optional(list(string))
  }))
  default     = []
}
variable "lambda_capacity_provider_permissions_config" {
  description = "(Required) Configuration block for permissions settings"
  type        = list(object({
    capacity_provider_operator_role_arn = string
  }))
}
variable "lambda_capacity_provider_vpc_config" {
  description = "(Required) Configuration block for VPC settings"
  type        = list(object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  }))
}
