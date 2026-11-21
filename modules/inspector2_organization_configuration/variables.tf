variable "inspector2_organization_configuration_auto_enable" {
  description = "(Required) Configuration block for auto enabling"
  type        = list(object({
    code_repository = optional(bool)
    ec2             = bool
    ecr             = bool
    lambda          = optional(bool)
    lambda_code     = optional(bool)
  }))
}
