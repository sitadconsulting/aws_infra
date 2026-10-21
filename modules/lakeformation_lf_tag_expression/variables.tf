variable "lakeformation_lf_tag_expression_catalog_id" {
  description = "(Optional) ID of the Data Catalog. Defaults to the account ID if not specified"
  type        = string
  default     = null
}
variable "lakeformation_lf_tag_expression_description" {
  description = "(Optional) Description of the LF-Tag Expression"
  type        = string
  default     = null
}
variable "lakeformation_lf_tag_expression_name" {
  description = "(Required) Name of the LF-Tag Expression"
  type        = string
}
variable "lakeformation_lf_tag_expression_expression" {
  description = "(Required) A list of LF-Tag conditions (key-value pairs)"
  type        = list(object({
    tag_key    = string
    tag_values = list(string)
  }))
}

