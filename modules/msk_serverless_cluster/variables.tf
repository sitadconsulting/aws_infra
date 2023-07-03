variable "msk_serverless_cluster_cluster_name" {
  description = "The name of the serverless cluster"
  type        = string
}
variable "msk_serverless_cluster_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "msk_serverless_cluster_client_authentication" {
  description = "Specifies client authentication information for the serverless cluster"
  type        = list(object({
    sasl  = list(object({
      iam = list(object({
        enabled = bool
      }))
    }))
  }))
}
variable "msk_serverless_cluster_vpc_config" {
  description = "VPC configuration information"
  type        = list(object({
    security_group_ids = optional(list(string))
    subnet_ids         = list(string)
  }))
}
