variable "acmpca_permission_certificate_authority_arn" {
  description = "ARN of the CA that grants the permissions"
  type        = string
}
variable "acmpca_permission_actions" {
  description = "Actions that the specified AWS service principal can use. These include IssueCertificate, GetCertificate, and ListPermissions. Note that in order for ACM to automatically rotate certificates issued by a PCA, it must be granted permission on all 3 actions, as per the example above"
  type        = list(string)
}
variable "acmpca_permission_principal" {
  description = "AWS service or identity that receives the permission. At this time, the only valid principal is acm.amazonaws.com"
  type        = string 
  default     = "acm.amazonaws.com"
}
variable "acmpca_permission_source_account" {
  description = "ID of the calling account"
  type        = string
  default     = ""
}
