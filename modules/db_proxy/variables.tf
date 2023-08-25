variable "db_proxy_name" {
  description = "The identifier for the proxy. This name must be unique for all proxies owned by your AWS account in the specified AWS Region"
  type        = string
}
variable "db_proxy_debug_logging" {
  description = "Whether the proxy includes detailed information about SQL statements in its logs"
  type        = bool
  default     = false
}
variable "db_proxy_engine_family" {
  description = "The kinds of databases that the proxy can connect to. This value determines which database network protocol the proxy recognizes when it interprets network traffic to and from the database. The engine family applies to MySQL and PostgreSQL for both RDS and Aurora. Valid values are MYSQL and POSTGRESQL"
  type        = string
}
variable "db_proxy_idle_client_timeout" {
  description = "The number of seconds that a connection to the proxy can be inactive before the proxy disconnects it. You can set this value higher or lower than the connection timeout limit for the associated database"
  type        = number
  default     = null
}
variable "db_proxy_require_tls" {
  description = "Whether Transport Layer Security (TLS) encryption is required for connections to the proxy"
  type        = bool
  default     = false
}
variable "db_proxy_role_arn" {
  description = "ARN of the IAM role that the proxy uses to access secrets in AWS Secrets Manager"
  type        = string
}
variable "db_proxy_vpc_security_group_ids" {
  description = "One or more VPC security group IDs to associate with the new proxy"
  type        = string
  default     = null
}
variable "db_proxy_vpc_subnet_ids" {
  description = "One or more VPC subnet IDs to associate with the new proxy"
  type        = string
}
variable "db_proxy_tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "db_proxy_auth" {
  description = "Authorization mechanisms to connect to the associated instances or clusters"
  type        = list(object({
    auth_scheme               = optional(string)
    client_password_auth_type = optional(string)
    description               = optional(string)
    iam_auth                  = optional(string)
    secret_arn                = optional(string)
    username                  = optional(string)
  }))
  default     = []
}
