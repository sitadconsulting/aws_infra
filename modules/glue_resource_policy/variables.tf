variable "glue_resource_policy_enable_hybrid" {
  description = "Indicates that you are using both methods to grant cross-account. Valid values are TRUE and FALSE"
  type        = string
  default     = ""
}
variable "glue_resource_policy_policy" {
  description = "The policy to be applied to the aws glue data catalog"
  type        = string
}
