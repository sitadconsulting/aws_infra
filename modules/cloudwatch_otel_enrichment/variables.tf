variable "cloudwatch_otel_enrichment_exclude_filter" {
  description = "(Optional) Namespaces and metric names to leave unenriched"
  type        = list(object({
    metric_names = optional(list(string))
    namespace    = string
  })) 
  default     = []
}
variable "cloudwatch_otel_enrichment_include_filter" {
  description = "(Optional) Namespaces and metric names to enrich"
  type        = list(object({
    metric_names = optional(list(string))
    namespace    = string
  }))
  default     = []
}
