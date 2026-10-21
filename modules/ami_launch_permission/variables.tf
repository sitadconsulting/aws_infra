variable "ami_launch_permission_account_id" {
  description = "(Optional) AWS account ID for the launch permission"
  type        = string
  default     = null 
}
variable "ami_launch_permission_group" {
  description = "(Optional) Name of the group for the launch permission. Valid values: \"all\""
  type        = string
  default     = null 
}
variable "ami_launch_permission_image_id" {
  description = "(Required) ID of the AMI"
  type        = string
}
variable "ami_launch_permission_organization_arn" {
  description = "(Optional) ARN of an organization for the launch permission"
  type        = string
  default     = null
}
variable "ami_launch_permission_organizational_unit_arn" {
  description = "(Optional) ARN of an organizational unit for the launch permission"
  type        = string
  default     = null
}
