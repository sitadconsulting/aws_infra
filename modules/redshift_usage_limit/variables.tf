variable "redshift_usage_limit_amount" {
  description = "The limit amount. If time-based, this amount is in minutes. If data-based, this amount is in terabytes (TB). The value must be a positive number"
  type        = number
}
variable "redshift_usage_limit_breach_action" {
  description = "The action that Amazon Redshift takes when the limit is reached. The default is log. Valid values are log, emit-metric, and disable"
  type        = string
  default     = "log"
}
variable "redshift_usage_limit_cluster_identifier" {
  description = "The identifier of the cluster that you want to limit usage"
  type        = string
}
variable "redshift_usage_limit_feature_type" {
  description = "The Amazon Redshift feature that you want to limit. Valid values are spectrum, concurrency-scaling, and cross-region-datasharing"
  type        = string
}
variable "redshift_usage_limit_limit_type" {
  description = "The type of limit. Depending on the feature type, this can be based on a time duration or data size. If FeatureType is spectrum, then LimitType must be data-scanned. If FeatureType is concurrency-scaling, then LimitType must be time. If FeatureType is cross-region-datasharing, then LimitType must be data-scanned. Valid values are data-scanned, and time"
  type        =string
}
variable "redshift_usage_limit_period" {
  description = "The time period that the amount applies to. A weekly period begins on Sunday. The default is monthly. Valid values are daily, weekly, and monthly"
  type        = string
  default     = ""
}
variable "redshift_usage_limit_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
