variable "opensearch_outbound_connection_connection_alias" {
  description = "Specifies the connection alias that will be used by the customer for this connection"
  type        = string
}
variable "opensearch_outbound_connection_local_domain_info" {
  description = "Configuration block for the local Opensearch domain"
  type        = list(object({
    owner_id    = string
    domain_name = string
    region      = string
  }))
}
variable "opensearch_outbound_connection_remote_domain_info" {
  description = "Configuration block for the remote Opensearch domain"
  type        = list(object({
    owner_id    = string
    domain_name = string
    region      = string
  }))
}
