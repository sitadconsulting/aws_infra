variable "lb_client_keep_alive" {
  description = "(Optional) Client keep alive value in seconds. The valid range is 60-604800 seconds. The default is 3600 seconds"
  type        = number
  default     = null
}
variable "lb_customer_owned_ipv4_pool" {
  description = "(Optional) ID of the customer owned ipv4 pool to use for this load balancer"
  type        = string
  default     = null
}
variable "lb_desync_mitigation_mode" {
  description = "(Optional) How the load balancer handles requests that might pose a security risk to an application due to HTTP desync. Valid values are monitor, defensive (default), strictest"
  type        = string
  default     = "defensive"
}
variable "lb_dns_record_client_routing_policy" {
  description = "(Optional) How traffic is distributed among the load balancer Availability Zones. Possible values are any_availability_zone (default), availability_zone_affinity, or partial_availability_zone_affinity. Only valid for network type load balancers"
  type        = string
  default     = null
}
variable "lb_drop_invalid_header_fields" {
  description = "(Optional) Whether HTTP headers with header fields that are not valid are removed by the load balancer (true) or routed to targets (false). The default is false. Elastic Load Balancing requires that message header names contain only alphanumeric characters and hyphens. Only valid for Load Balancers of type application"
  type        = bool
  default     = false
}
variable "lb_enable_cross_zone_load_balancing" {
  description = "(Optional) If true, cross-zone load balancing of the load balancer will be enabled. For network and gateway type load balancers, this feature is disabled by default (false). For application load balancer this feature is always enabled (true) and cannot be disabled. Defaults to false"
  type        = bool
  default     = false
}
variable "lb_enable_deletion_protection" {
  description = "(Optional) If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false"
  type        = bool
  default     = false
}
variable "lb_enable_http2" {
  description = "(Optional) Whether HTTP/2 is enabled in application load balancers. Defaults to true"
  type        = bool
  default     = true
}
variable "lb_enable_prefix_for_ipv6_source_nat" {
  description = "(Optional) Whether to use an IPv6 prefix from each subnet for source NAT. ip_address_type must be dualstack. Valid values: on, off"
  type        = string
  default     = null
}
variable "lb_enable_tls_version_and_cipher_suite_headers" {
  description = "(Optional) Whether the two headers (x-amzn-tls-version and x-amzn-tls-cipher-suite), which contain information about the negotiated TLS version and cipher suite, are added to the client request before sending it to the target. Only valid for Load Balancers of type application. Defaults to false"
  type        = bool
  default     = false
}
variable "lb_enable_xff_client_port" {
  description = "(Optional) Whether the X-Forwarded-For header should preserve the source port that the client used to connect to the load balancer in application load balancers. Defaults to false"
  type        = bool
  default     = false
}
variable "lb_enable_waf_fail_open" {
  description = "(Optional) Whether to allow a WAF-enabled load balancer to route requests to targets if it is unable to forward the request to AWS WAF. Defaults to false"
  type        = bool
  default     = false
}
variable "lb_enable_zonal_shift" {
  description = "(Optional) Whether zonal shift is enabled. Defaults to false"
  type        = bool
  default     = false
}
variable "lb_enforce_security_group_inbound_rules_on_private_link_traffic" {
  description = "(Optional) Whether inbound security group rules are enforced for traffic originating from a PrivateLink. Only valid for Load Balancers of type network. The possible values are on and off"
  type        = string
  default     = null
}
variable "lb_idle_timeout" {
  description = "(Optional) Time in seconds that the connection is allowed to be idle. Only valid for Load Balancers of type application. Default: 60"
  type        = number
  default     = 60
}
variable "lb_internal" {
  description = "(Optional) If true, the LB will be internal. Defaults to false"
  type        = bool
  default     = false
}
variable "lb_ip_address_type" {
  description = "(Optional) Type of IP addresses used by the subnets for your load balancer. The possible values depend upon the load balancer type: ipv4 (all load balancer types), dualstack (all load balancer types), and dualstack-without-public-ipv4 (type application only)"
  type        = string
  default     = null
}
variable "lb_load_balancer_type" {
  description = "(Optional) Type of load balancer to create. Possible values are application, gateway, or network. The default value is application"
  type        = string
  default     = null
}
variable "lb_name" {
  description = "(Optional) Name of the LB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen. If not specified, Terraform will autogenerate a name beginning with tf-lb"
  type        = string
  default     = null
}
variable "lb_name_prefix" {
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "lb_security_groups" {
  description = "(Optional) List of security group IDs to assign to the LB. Only valid for Load Balancers of type application or network. For load balancers of type network security groups cannot be added if none are currently present, and cannot all be removed once added. If either of these conditions are met, this will force a recreation of the resource"
  type        = list(string)
  default     = []
}
variable "lb_preserve_host_header" {
  description = "(Optional) Whether the Application Load Balancer should preserve the Host header in the HTTP request and send it to the target without any change. Defaults to false"
  type        = bool
  default     = false
}
variable "lb_secondary_ips_auto_assigned_per_subnet" {
  description = "(Optional) The number of secondary IP addresses to configure for your load balancer nodes. Only valid for Load Balancers of type network. The valid range is 0-7. When decreased, this will force a recreation of the resource. Default: 0"
  type        = number
  default     = 0
}
variable "lb_subnets" {
  description = "(Optional) List of subnet IDs to attach to the LB. For Load Balancers of type network subnets can only be added, deleting a subnet for load balancers of type network will force a recreation of the resource"
  type        = list(string)
  default     = []
}
variable "lb_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "lb_xff_header_processing_mode" {
  description = "(Optional) Determines how the load balancer modifies the X-Forwarded-For header in the HTTP request before sending the request to the target. The possible values are append, preserve, and remove. Only valid for Load Balancers of type application. The default is append"
  type        = string
  default     = "append"
}
variable "lb_access_logs" {
  description = "(Optional) Access Logs block"
  type        = list(object({
    bucket    = string
    enabled   = optional(bool)
    prefix    = optional(string)
  }))
  default     = []
}
variable "lb_connection_logs" {
  description = "(Optional) Connection Logs block. See below. Only valid for Load Balancers of type application" 
  type        = list(object({
    bucket    = string
    enabled   = optional(bool)
    prefix    = optional(string)
  }))
  default     = []
} 
variable "lb_health_check_logs" {
 description = "(Optional) Health Check Logs block. See below. Only valid for Load Balancers of type application"
 type        = list(object({
   bucket    = string
   enabled   = optional(bool)
   prefix    = optional(string)
 }))
 default     = []
}
variable "lb_ipam_pools" {
  description = "(Optional). The IPAM pools to use with the load balancer. Only valid for Load Balancers of type application"
  type        = list(object({
    ipv4_ipam_pool_id = string
  }))
  default     = []
}
variable "lb_minimum_load_balancer_capacity" {
  description = "(Optional) Minimum capacity for a load balancer. Only valid for Load Balancers of type application or network" 
  type        = list(object({
    capacity_units = number
  }))
  default     = []
}
variable "subnet_mapping" {
  description = "(Optional) Subnet mapping block. See below. For Load Balancers of type network subnet mappings can only be added"
  type        = list(object({
    allocation_id        = optional(string)
    ipv6_address         = optional(string)
    private_ipv4_address = optional(string)
    subnet_id            = string
  }))
  default     = []
}
