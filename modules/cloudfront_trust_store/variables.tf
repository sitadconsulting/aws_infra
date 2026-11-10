variable "cloudfront_trust_store_name" {
  description = "(Required) Name of the trust store. Changing this forces a new resource to be created"
  type        = string
}
variable "cloudfront_trust_store_tags" {
  description = "(Optional) Key-value tags for the place index"
  type        = map(string)
  default     = {}
}
variable "cloudfront_trust_store_ca_certificates_bundle_source" {
  description = "(Required) Configuration block for the CA certificates bundle source"
  type        = list(object({
    ca_certificates_bundle_s3_location = list(object({
      bucket  = string
      key     = string
      region  = string
      version = optional(string)
    }))
  }))
}
