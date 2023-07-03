variable "db_proxy_target_db_proxy_name" {
  description = "DB proxy name"
  type        = string
}
variable "db_proxy_target_target_group_name" {
  description = "Target group name"
  type        = string
}
variable "db_proxy_target_db_instance_identifier" {
  description = "DB instance identifier"
  type        = string
  default     = ""
}
variable "db_proxy_target_db_cluster_identifier" {
  description = "DB cluster identifier"
  type        = string
  default     = ""
}
