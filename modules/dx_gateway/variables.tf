variable "dx_gateway_amazon_side_asn" {
  description = "(Required) The ASN to be configured on the Amazon side of the connection. The ASN must be in the private range of 64,512 to 65,534 or 4,200,000,000 to 4,294,967,294"
  type        = string
}
variable "dx_gateway_name" {
  description = "(Required) The name of the connection"
  type        = string
}
variable "dx_gateway_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
