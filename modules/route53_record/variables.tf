variable "route53_record_zone_id" {
  description = "The ID of the hosted zone to contain this record"
  type        = string
  default     = ""
}
variable "route53_record_name" {
  description = "The name of the record"
  type        = string
  default     = ""
}
variable "route53_record_type" {
  description = "The record type. Valid values are A, AAAA, CAA, CNAME, DS, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT"
  type        = string
  default     = ""
}
variable "route53_record_ttl" {
  description = "The TTL of the record"
  type        = number
  default     = null
}
variable "route53_record_records" {
  description = "A string list of records"
  type        = list(string)
  default     = []
}
variable "route53_record_set_identifier" {
  description = "Unique identifier to differentiate records with routing policies from one another"
  type        = string
  default     = ""
}
variable "route53_record_health_check_id" {
  description = "The health check the record should be associated with"
  type        = string
  default     = ""
}
variable "route53_record_multivalue_answer_routing_policy" {
  description = "Set to true to indicate a multivalue answer routing policy"
  type        = bool
  default     = null
}
variable "route53_record_allow_overwrite" {
  description = "Allow creation of this record in Terraform to overwrite an existing record, if any"
  type        = bool
  default     = false
}
variable "route53_record_alias" {
  description = "An alias block. Conflicts with ttl & records"
  type        = list(object({
    name                   = string
    zone_id                = string
    evaluate_target_health = bool
  }))
  default = []
}
variable "route53_record_cidr_routing_policy" {
  description = "A block indicating a routing policy based on the IP network ranges of requestors. Conflicts with any other routing policy"
  type        = list(object({
    collection_id = string
    location_name = string
  }))
  default = []
}
variable "route53_record_failover_routing_policy" {
  description = "A block indicating the routing behavior when associated health check fails. Conflicts with any other routing policy"
  type        = list(object({
    type = string
  }))
  default = []
}
variable "route53_record_geolocation_routing_policy" {
  description = "A block indicating a routing policy based on the geolocation of the requestor. Conflicts with any other routing policy"
  type        = list(object({
    continent   = optional(string)
    country     = optional(string)
    subdivision = optional(string)  
  }))
  default = []
}
variable "route53_record_latency_routing_policy" {
  description = "A block indicating a routing policy based on the latency between the requestor and an AWS region. Conflicts with any other routing policy"
  type        = list(object({
    region = string
  }))
  default = []
}
variable "route53_record_weighted_routing_policy" {
  description = "A block indicating a weighted routing policy. Conflicts with any other routing policy"
  type        = list(object({
    weight = number
  }))
  default = []
}
