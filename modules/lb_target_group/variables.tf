variable "lb_target_group_connection_termination" {
  description = "Whether to terminate connections at the end of the deregistration timeout on Network Load Balancers"
  type        = bool
  default     = false
}
variable "lb_target_group_deregistration_delay" {
  description = "Amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds. 300 seconds"
  type        = number
  default     = 300
}
variable "lb_target_group_lambda_multi_value_headers_enabled" {
  description = "Whether the request and response headers exchanged between the load balancer and the Lambda function include arrays of values or strings. Only applies when target_type is lambda. Default is false"
  type        = bool
  default     = false
}
variable "lb_target_group_load_balancing_algorithm_type" {
  description = "Determines how the load balancer selects targets when routing requests. Only applicable for Application Load Balancer Target Groups. The value is round_robin or least_outstanding_requests. The default is round_robin "
  type        = string
  default     = "round_robin"
}
variable "lb_target_group_load_balancing_cross_zone_enabled" {
  description = "Indicates whether cross zone load balancing is enabled. The value is \"true\", \"false\" or \"use_load_balancer_configuration\". The default is: use_load_balancer_configuration"
  type        = bool
  default     = "use_load_balancer_configuration"
}
variable "lb_target_group_name" {
  description = "Name of the target group"
  type        = string
  default     = ""
}
variable "lb_target_group_port" {
  description = "Port on which targets receive traffic, unless overridden when registering a specific target. Required when target_type is instance, ip or alb. Does not apply when target_type is lambda"
  type        = string
  default     = ""
}
variable "lb_target_group_preserve_client_ip" {
  description = "Whether client IP preservation is enabled"
  type        = bool
  default     = false
}
variable "lb_target_group_protocol_version" {
  description = "Only applicable when protocol is HTTP or HTTPS"
  type        = string
  default     = ""
}
variable "lb_target_group_protocol" {
  description = "Protocol to use for routing traffic to the targets. Should be one of GENEVE, HTTP, HTTPS, TCP, TCP_UDP, TLS, or UDP. Required when target_type is instance, ip or alb. Does not apply when target_type is lambda"
  type        = string
  default     = ""
}
variable "lb_target_group_proxy_protocol_v2" {
  description = "Whether to enable support for proxy protocol v2 on Network Load Balancers"
  type        = bool
  default     = false
}
variable "lb_target_group_slow_start" {
  description = "Amount time for targets to warm up before the load balancer sends them a full share of requests. The range is 30-900 seconds or 0 to disable. default 0 seconds"
  type        = number
  default     = 0
}
variable "lb_target_group_tags" {
  description = "Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "lb_target_group_target_type" {
  description = "Type of target that you must specify when registering targets with this target group"
  type        = string
  default     = "instance"
}
variable "lb_target_group_ip_address_type" {
  description = "The type of IP addresses used by the target group, only supported when target type is set to ip. Possible values are ipv4 or ipv6"
  type        = string
  default     = "ipv4"
}
variable "lb_target_group_vpc_id" {
  description = "Identifier of the VPC in which to create the target group. Required when target_type is instance, ip or alb. Does not apply when target_type is lambda"
  type        = string
  default     = ""
}
variable "lb_target_group_health_check" {
  description = "Health Check configuration"
  type        = list(object({
    enabled             = optional(bool)
    healthy_threshold   = optional(number)
    interval            = optional(number)
    matcher             = optional(string)
    path                = optional(string)
    port                = optional(string)
    protocol            = optional(string)
    timeout             = optional(number)
    unhealthy_threshold = optional(number)
  }))
  default    = []
}
variable "lb_target_group_stickiness" {
  description = "Stickiness configuraion"
  type        = list(object({
    cookie_duration = optional(number)
    cookie_name     = optional(string)
    enabled         = optional(bool)
    type            = string
 }))
 default     = []
}
variable "lb_target_group_target_failover" {
  description = " "
  type        = list(object({
    on_deregistration = string
    on_unhealthy      = string
  }))
  default    = [] 
}
