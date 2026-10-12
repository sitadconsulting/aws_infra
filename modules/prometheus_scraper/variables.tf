variable "prometheus_scraper_alias" {
  description = "(Optional) a name to associate with the managed scraper. This is for your use, and does not need to be unique"
  type        = string
  default     = null
}
variable "prometheus_scraper_scrape_configuration" {
  description = "(Required) The configuration file to use in the new scraper"
  type        = string
}
variable "prometheus_scraper_destination" {
  description = "(Required) Configuration block for the managed scraper to send metrics to"
  type        = list(object({
    amp = list(object({
      workspace_arn = string
    }))
  }))
}
variable "prometheus_scraper_role_configuration" {
  description = "Optional) Configuration block to enable writing to an Amazon Managed Service for Prometheus workspace in a different account"
  type        = list(object({
    source_role_arn = optional(string)
    target_role_arn = optional(string)
  }))
  default     = []
}
variable "prometheus_scraper_source" {
  description = " (Required) Configuration block to specify where the managed scraper will collect metrics from"
  type        = list(object({
    eks  = optional(list(object({
      cluster_arn        = string
      subnet_ids         = list(string)
      security_group_ids = optional(list(string))
    })), [])
    vpc      = optional(list(object({
      security_group_ids = list(string)
      subnet_ids         = list(string)
    })), [])
  }))
}
