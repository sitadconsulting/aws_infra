variable "cloudwatchomni_view_definition" {
  description = "(Required) SQL query that defines the view. Must be 1 to 10000 characters. The service validates the query when the view is created or updated"
  type        = string
}
variable "cloudwatchomni_view_description" {
  description = "(Optional) Description of the view. Must be 1 to 1024 characters"
  type        = string
  default     = null
}
variable "cloudwatchomni_view_name" {
  description = "(Required) Name of the view. Must start with view. followed by a lowercase letter or digit, contain only lowercase letters, digits, underscores and hyphens, and be 6 to 256 characters long. Unique within the account and Region. Changing this value forces replacement"
  type        = string
}
variable "cloudwatchomni_view_tags" {
  description = "(Optional) Map of tags assigned to the resource"
  type        = map(string)
  default     = {}
}
