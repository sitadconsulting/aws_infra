variable "cloudfront_vpc_origin_tags" {
  description = "(Optional) Key-value tags for the place index"
  type        = map(string)
  default     = {}
}
variable "cloudfront_vpc_origin_vpc_origin_endpoint_config" {
  description = "(Required) - The VPC origin endpoint configuration"
  type        = list(object({
    arn                    = string
    http_port              = number
    https_port             = number
    name                   = string
    origin_protocol_policy = string
    origin_ssl_protocols   = string
  }))
}
