variable "ec2_default_credit_specification_cpu_credits" {
  description = "(Required) Credit option for CPU usage of the instance family. Valid values: standard, unlimited"
  type        = string
}
variable "ec2_default_credit_specification_instance_family" {
  description = "(Required) Instance family. Valid values are t2, t3, t3a, t4g"
  type        = string
}
