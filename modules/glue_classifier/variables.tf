variable "glue_classifier_name" {
  description = "The name of the classifier"
  type        = string
}
variable "glue_classifier_csv_classifier" {
  description = "A classifier for Csv content"
  type        = list(object({
    allow_single_column        = optional(bool)
    contains_header            = optional(string)
    custom_datatype_configured = optional(bool)
    custom_datatypes           = optional(list(string))
    delimiter                  = optional(string)
    disable_value_trimming     = optional(bool)
    header                     = optional(list(string))
    quote_symbol               = optional(string)
  }))
  default     = []
}
variable "glue_classifier_grok_classifier" {
  description = "A classifier that uses grok patterns"
  type        = list(object({
    classification  = string
    custom_patterns = optional(string)
    grok_pattern    = string
  }))
  default     = []
}
variable "glue_classifier_json_classifier" {
  description = "A classifier for JSON content"
  type        = list(object({
    json_path = string
  }))
  default     = []
}
variable "glue_classifier_xml_classifier" {
  description = "A classifier for XML content"
  type        = list(object({
    classification = string
    row_tag        = string
  }))
  default     = []
}
