variable "lb_target_group_connection_termination" {
  description = "(Optional) Whether to terminate connections at the end of the deregistration timeout on Network Load Balancers. Default is false"
  type        = bool
  default     = false
}
variable "lb_target_group_deregistration_delay" {
  description = "(Optional) Amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds. The default value is 300 seconds"
  type        = number
  default     = 300
}
variable "lb_target_group_ip_address_type" {
  description = "(Optional, forces new resource) The type of IP addresses used by the target group, only supported when target type is set to ip. Possible values are ipv4 or ipv6"
  type        = string
  default     = null
}
variable "lb_target_group_lambda_multi_value_headers_enabled" {
  description = "(Optional) Whether the request and response headers exchanged between the load balancer and the Lambda function include arrays of values or strings. Only applies when target_type is lambda. Default is false"
  type        = bool
  default     = false
}
variable "lb_target_group_load_balancing_algorithm_type" {
  description = "(Optional) Determines how the load balancer selects targets when routing requests. Only applicable for Application Load Balancer Target Groups. The value is round_robin, least_outstanding_requests, or weighted_random. The default is round_robin"
  type        = string
  default     = null
}
variable "lb_target_group_load_balancing_anomaly_mitigation" {
  description = "(Optional) Determines whether to enable target anomaly mitigation. Target anomaly mitigation is only supported by the weighted_random load balancing algorithm type. See doc for more information. The value is \"on\" or \"off\". The default is \"off\""
  type        = string
  default     = null
}
variable "lb_target_group_load_balancing_cross_zone_enabled" {
  description = "(Optional) Indicates whether cross zone load balancing is enabled. The value is \"true\", \"false\" or \"use_load_balancer_configuration\". The default is \"use_load_balancer_configuration\""
  type        = bool
  default     = null
}
variable "lb_target_group_name" {
  description = "(Optional, Forces new resource) Name of the target group. If omitted, Terraform will assign a random, unique name. This name must be unique per region per account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen"
  type        = string
  default     = null
}
variable "lb_target_group_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name. Cannot be longer than 6 characters"
  type        = string
  default     = null
}
variable "lb_target_group_port" {
  description = "(May be required, Forces new resource) Port on which targets receive traffic, unless overridden when registering a specific target. Required when target_type is instance, ip or alb. Does not apply when target_type is lambda"
  type        = number
  default     = null
}
variable "lb_target_group_preserve_client_ip" {
  description = "(Optional) Whether client IP preservation is enabled"
  type        = bool
  default     = false
}
variable "lb_target_group_protocol" {
  description = "(May be required, Forces new resource) Protocol to use for routing traffic to the targets. Should be one of GENEVE, HTTP, HTTPS, TCP, TCP_UDP, TLS, UDP, QUIC, or TCP_QUIC. Required when target_type is instance, ip, or alb. Does not apply when target_type is lambda"
  type        = string
  default     = null
}
variable "lb_target_group_protocol_version" {
  description = "(Optional, Forces new resource) Only applicable when protocol is HTTP or HTTPS. The protocol version. Specify GRPC to send requests to targets using gRPC. Specify HTTP2 to send requests to targets using HTTP/2. The default is HTTP1, which sends requests to targets using HTTP/1.1"
  type        = string
  default     = null
}
variable "lb_target_group_proxy_protocol_v2" {
  description = "(Optional) Whether to enable support for proxy protocol v2 on Network Load Balancers. Default is false"
  type        = bool
  default     = false
}
variable "lb_target_group_slow_start" {
  description = "(Optional) Amount time for targets to warm up before the load balancer sends them a full share of requests. The range is 30-900 seconds or 0 to disable. The default value is 0 seconds"
  type        = number
  default     = 0
}
variable "lb_target_group_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "lb_target_group_target_control_port" {
  description = " (Optional) Port on which the target control agent and application load balancer exchange management traffic for the target optimizer feature. Only applicable for Application Load Balancer target groups when target_type is instance or ip"
  type        = number
  default     = null
}
variable "lb_target_group_target_type" {
  description = "(Optional, Forces new resource) Type of target that you must specify when registering targets with this target group. The default is instance"
  type        = string
  default     = null
}
variable "lb_target_group_vpc_id" {
  description = "(Optional, Forces new resource) Identifier of the VPC in which to create the target group. Required when target_type is instance, ip or alb. Does not apply when target_type is lambda"
  type        = string
  default     = null
}
variable "lb_target_group_health_check" {
  description = "(Optional, Maximum of 1) Health Check configuration block"
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
  description = "(Optional, Maximum of 1) Stickiness configuration block"
  type        = list(object({
    cookie_duration = optional(number)
    cookie_name     = optional(string)
    enabled         = optional(bool)
    type            = string
 }))
 default     = []
}
variable "lb_target_group_target_failover" {
  description = "(Optional) Target failover block. Only applicable for Gateway Load Balancer target groups"
  type        = list(object({
    on_deregistration = string
    on_unhealthy      = string
  }))
  default    = [] 
}
variable "lb_target_group_target_group_health" {
  description = "(Optional) Target health requirements block"
  type        = list(object({
    dns_failover            = optional(list(object({
      minimum_healthy_targets_count      = optional(number)
      minimum_healthy_targets_percentage = optional(string)
    })), [])
    unhealthy_state_routing = optional(list(object({
      minimum_healthy_targets_count       = optional(number)
      minimum_healthy_targets_percentage  = optional(string)
    })), [])
  }))
  default     = []
}
