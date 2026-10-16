variable "glue_data_quality_ruleset_description" {
  description = "(Optional) Description of the data quality ruleset"
  type        = string
  default     = null
}
variable "glue_data_quality_ruleset_name" {
  description = "(Required, Forces new resource) Name of the data quality ruleset"
  type        = string
}
variable "glue_data_quality_ruleset_ruleset" {
  description = "(Optional) A Data Quality Definition Language (DQDL) ruleset"
  type        = string
  default     = null
}
variable "glue_data_quality_ruleset_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "glue_data_quality_ruleset_target_table" {
  description = "(Optional, Forces new resource) A Configuration block specifying a target table associated with the data quality ruleset"
  type        = list(object({
    catalog_id    = optional(string)
    database_name = string
    table_name    = string
  }))
  default     = []
}
