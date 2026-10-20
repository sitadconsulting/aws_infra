variable "iam_server_certificate_certificate_body" {
  description = "(Required, Forces new resource) The contents of the public key certificate in PEM-encoded format"
  type        = string
}
variable "iam_server_certificate_certificate_chain" {
  description = "(Optional, Forces new resource) The contents of the certificate chain. This is typically a concatenation of the PEM-encoded public key certificates of the chain"
  type        = string
  default     = null
}
variable "iam_server_certificate_name" {
  description = "(Optional) The name of the Server Certificate. Do not include the path in this value. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = null
}
variable "iam_server_certificate_name_prefix" {
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "iam_server_certificate_path" {
  description = "(Optional) The IAM path for the server certificate. If it is not included, it defaults to a slash (/). If this certificate is for use with AWS CloudFront, the path must be in format /cloudfront/your_path_here"
  type        = string
  default     = null
}
variable "iam_server_certificate_private_key" {
  description = "(Required, Forces new resource) The contents of the private key in PEM-encoded format"
  type        = string
}
variable "iam_server_certificate_tags" {
  description = "(Optional) Map of resource tags for the server certificate"
  type        = map(string)
  default     = {}
}
