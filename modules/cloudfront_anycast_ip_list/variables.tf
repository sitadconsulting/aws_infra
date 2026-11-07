variable "cloudfront_anycast_ip_list_ip_count" {
  description = "(Required, Forces new resource) The number of static IP addresses that are allocated to the Anycast IP list. Valid values: 3, 21"
  type        = number
}
variable "cloudfront_anycast_ip_list_name" {
  description = "(Required, Forces new resource) Name of the Anycast IP list"
  type        = string
}
variable "cloudfront_anycast_ip_list_tags" {
  description = "(Optional) Key-value tags for the place index"
  type        = map(string)
  default     = {}
}
