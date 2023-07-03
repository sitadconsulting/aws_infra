variable "route53_zone_association_zone_id" {
  description = "The private hosted zone to associate"
  type        = string
}
variable "route53_zone_association_vpc_id" {
  description = "The VPC to associate with the private hosted zone"
  type        = string
}
variable "route53_zone_association_vpc_region" {
  description = "The VPC's region"
  type        = string
  default     = ""
}
