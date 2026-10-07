variable "ssoadmin_region_instance_arn" {
  description = "(Required) ARN of the IAM Identity Center instance"
  type        = string
}
variable "ssoadmin_region_region_name" {
  description = "(Required) AWS Region to add (for example, us-east-1). Changing this forces a new resource"
  type        = string
}
