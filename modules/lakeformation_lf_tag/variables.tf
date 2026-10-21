variable "lakeformation_lf_tag_catalog_id" {
  description = "(Optional) ID of the Data Catalog to create the tag in. If omitted, this defaults to the AWS Account ID"
  type        = string
  default     = null
}
variable "lakeformation_lf_tag_key" {
  description = "(Required) Key-name for the tag"
  type        = string
}
variable "lakeformation_lf_tag_values" {
  description = "(Required) List of possible values an attribute can take"
  type        = list(string)
}
