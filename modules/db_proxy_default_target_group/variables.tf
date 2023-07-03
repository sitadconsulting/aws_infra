variable "db_proxy_default_target_group_db_proxy_name" {
  description = "Name of the RDS DB Proxy"
  type        = string
}
variable "db_proxy_default_target_group_connection_pool_config" {
  description = "Determine the size and behavior of the connection pool for the target group"
  type        = list(object({
    connection_borrow_timeout    = optional(number)
    init_query                   = optional(string)
    max_connections_percent      = optional(number)
    max_idle_connections_percent = optional(number)
    session_pinning_filters      = list(object({
      type = string
    }))
  }))
  default     = []
}
