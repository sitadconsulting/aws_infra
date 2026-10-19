variable "lb_target_group_attachment_availability_zone" {
  description = "(Optional) The Availability Zone where the IP address of the target is to be registered. If the private IP address is outside of the VPC scope, this value must be set to all"
  type        = string
  default     = null
}
variable "lb_target_group_attachment_port" {
  description = "(Optional) The port on which targets receive traffic"
  type        = number
  default     = null
}
variable "lb_target_group_attachment_quic_server_id" {
  description = "(Optional) Server ID for the targets, consisting of the 0x prefix followed by 16 hexadecimal characters. The value must be unique at the listener level. Required if aws_lb_target_group protocol is QUIC or TCP_QUIC. Not valid with other protocols. Forces replacement if modified"
  type        = string
  default     = null
}
variable "lb_target_group_attachment_target_group_arn" {
  description = "(Required) The ARN of the target group with which to register targets"
  type        = string
}
variable "lb_target_group_attachment_target_id" {
  description = "(Required) The ID of the target. This is the Instance ID for an instance, or the container ID for an ECS container. If the target type is ip, specify an IP address. If the target type is lambda, specify the Lambda function ARN. If the target type is alb, specify the ALB ARN"
  type        = string
}
