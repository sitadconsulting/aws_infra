variable "config_conformance_pack_delivery_s3_bucket" {
  description = "(Optional) Amazon S3 bucket where AWS Config stores conformance pack templates. Maximum length of 63"
  type        = string
  default     = null
}
variable "config_conformance_pack_delivery_s3_key_prefix" {
  description = "(Optional) The prefix for the Amazon S3 bucket. Maximum length of 1024"
  type        = string
  default     = null
}
variable "config_conformance_pack_name" {
  description = "(Required, Forces new resource) The name of the conformance pack. Must begin with a letter and contain from 1 to 256 alphanumeric characters and hyphens"
  type        = string
}
variable "config_conformance_pack_template_body" {
  description = "(Optional, required if template_s3_uri is not provided) A string containing full conformance pack template body. Maximum length of 51200. Drift detection is not possible with this argument"
  type        = string
  default     = null
}
variable "config_conformance_pack_template_s3_uri" {
  description = "(Optional, required if template_body is not provided) Location of file, e.g., s3://bucketname/prefix, containing the template body. The URI must point to the conformance pack template that is located in an Amazon S3 bucket in the same region as the conformance pack. Maximum length of 1024. Drift detection is not possible with this argument"
  type        = string
  default     = null
}
variable "config_conformance_pack_input_parameter" {
  description = "(Optional) Set of configuration blocks describing input parameters passed to the conformance pack template. Documented below. When configured, the parameters must also be included in the template_body or in the template stored in Amazon S3 if using template_s3_uri"
  type        = list(object({
    parameter_name  = string
    parameter_value = string
  }))
  default     = []
}
