variable "lb_customer_owned_ipv4_pool" {
  description = "The ID of the customer owned ipv4 pool to use for this load balancer"
  type        = string
  default     = ""
}
variable "lb_desync_mitigation_mode" {
  description = "Determines how the load balancer handles requests that might pose a security risk to an application due to HTTP desync. Valid values are monitor, defensive, strictest"
  type        = string
  default     = "defensive"
}
variable "lb_drop_invalid_header_fields" {
  description = "Indicates whether HTTP headers with header fields that are not valid are removed by the load balancer (true) or routed to targets (false). The default is false"
  type        = bool
  default     = false
}
variable "lb_enable_cross_zone_load_balancing" {
  description = "Whether to enable cross-zone loadbalancing. Does to apply to Application Loadbalance which defaults to true"
  type        = bool
  default     = false
}
variable "lb_enable_deletion_protection" {
  description = "Whether deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false"
  type        = bool
  default     = false
}
variable "lb_enable_http2" {
  description = "Whether HTTP/2 is enabled in application load balancers. Defaults to true "
  type        = bool
  default     = true
}
variable "lb_enable_tls_version_and_cipher_suite_headers" {
  description = "Indicates whether the two headers (x-amzn-tls-version and x-amzn-tls-cipher-suite), which contain information about the negotiated TLS version and cipher suite, are added to the client request before sending it to the target. Only valid for Load Balancers of type application. Defaults to false"
  type        = bool
  default     = false
}
variable "lb_enable_xff_client_port" {
  description = "Indicates whether the X-Forwarded-For header should preserve the source port that the client used to connect to the load balancer in application load balancers. Defaults to false"
  type        = bool
  default     = false
}
variable "lb_enable_waf_fail_open" {
  description = "Indicates whether to allow a WAF-enabled load balancer to route requests to targets if it is unable to forward the request to AWS WAF. Defaults to false"
  type        = bool
  default     = false
}
variable "lb_idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle. Only valid for Load Balancers of type application. Default: 60"
  type        = number
  default     = 69
}
variable "lb_internal" {
  description = "Whether the LB will be internal. Defaults to false "
  type        = bool
  default     = false
}
variable "lb_ip_address_type" {
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack "
  type        = string
  default     = "ipv4"
}
variable "lb_load_balancer_type" {
  description = "he type of load balancer to create. Possible values are application, gateway, or network. The default value is application"
  type        = string
  default     = "application"
}
variable "lb_name" {
  description = "The name of the LB"
  type        = string
  default     = ""
}
variable "lb_security_groups" {
  description = "A list of security group IDs to assign to the LB. Only valid for Load Balancers of type application"
  type        = list(string)
  default     = []
}
variable "lb_preserve_host_header" {
  description = "Indicates whether the Application Load Balancer should preserve the Host header in the HTTP request and send it to the target without any change. Defaults to false"
  type        = bool
  default     = false
}
variable "lb_subnets" {
  description = "A list of subnet IDs to attach to the LB"
  type        = list(string)
  default     = []
}
variable "lb_xff_header_processing_mode" {
  description = "Determines how the load balancer modifies the X-Forwarded-For header in the HTTP request before sending the request to the target. The possible values are append, preserve, and remove. Only valid for Load Balancers of type application. The default is append"
  type        = string
  default     = "append"
}
variable "lb_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "lb_access_logs" {
  description = "An Access Logs block"
  type        = list(object({
    bucket    = string
    enabled   = optional(bool)
    prefix    = optional(string)
  }))
  default     = []
}
variable "subnet_mapping" {
  description = "A subnet mapping block"
  type        = list(object({
    allocation_id        = optional(string)
    ipv6_address         = optional(string)
    private_ipv4_address = optional(string)
    subnet_id            = string
  }))
  default     = []


}
