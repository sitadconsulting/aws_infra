variable "route53_zone_name" {
  description = "The name of the hosted zone" 
  type        = string
}
variable "route53_zone_comment" {
  description = "A comment for the hosted zone. Defaults to 'Managed by Terraform'"
  type        = string
  default     = "Managed by Terraform"
}
variable "route53_zone_delegation_set_id" {
  description = "The ID of the reusable delegation set whose NS records you want to assign to the hosted zone"
  type        = string
  default     = ""
}
variable "route53_zone_force_destroy" {
  description = "Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone"
  type        = bool
  default     = true
}
variable "route53_tags" {
  description = "A map of tags to assign to the zone"
  type        = map(string)
  default     = {}
}
variable "route53_zone_vpc" {
  description = "Configuration block(s) specifying VPC(s) to associate with a private hosted zone"
  type        = list(object({
    vpc_id     = string
    vpc_region = optional(string)
  }))
  default     = []
}
