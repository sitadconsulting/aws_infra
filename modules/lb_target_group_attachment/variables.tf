variable "lb_target_group_attachment_target_group_arn" {
  description = "The ARN of the target group with which to register targets"
  type        = string
}
variable "lb_target_group_attachment_target_id" {
  description = "The ID of the target. This is the Instance ID for an instance, or the container ID for an ECS container. If the target type is ip, specify an IP address. If the target type is lambda, specify the arn of lambda. If the target type is alb, specify the arn of alb"
  type        = string
}
variable "lb_target_group_attachment_port" {
  description = "The port on which targets receive traffic"
  type        = number
  default     = null
}
variable "lb_target_group_attachment_availability_zone" {
  description = "The Availability Zone where the IP address of the target is to be registered. If the private ip address is outside of the VPC scope, this value must be set to 'all'"
  type        = string
  default     = ""
}
