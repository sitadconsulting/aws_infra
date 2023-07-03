variable "autoscaling_attachment_autoscaling_group_name" {
  description = "Name of ASG to associate with the ELB"
  type        = string
}
variable "autoscaling_attachment_elb" {
  description = "Name of the ELB"
  type        = string
  default     = ""
}
variable "autoscaling_attachment_lb_target_group_arn" {
  description = "ARN of a load balancer target group"
  type        = string
  default     = ""
}
