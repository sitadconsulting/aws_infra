variable "opensearch_domain_access_policies" {
  description = "IAM policy document specifying the access policies for the domain"
  type        = string
  default     = null
}
variable "opensearch_domain_advanced_options" {
  description = "Key-value string pairs to specify advanced configuration options. Note that the values for these configuration options must be strings (wrapped in quotes) or they may be wrong and cause a perpetual diff, causing Terraform to want to recreate your OpenSearch domain on every apply"
  type        = map(string)
  default     = {}
}
variable "opensearch_domain_domain_name" {
  description = "Name of the domain"
  type        = string
}
variable "opensearch_domain_engine_version" {
  description = "Either Elasticsearch_X.Y or OpenSearch_X.Y to specify the engine version for the Amazon OpenSearch Service domain. For example, OpenSearch_1.0 or Elasticsearch_7.9. See Creating and managing Amazon OpenSearch Service domains. Defaults to the lastest version of OpenSearch"
  type        = string
  default     = null
}
variable "opensearch_domain_tags" {
  description = "Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "opensearch_domain_advanced_security_options" {
  description = "Configuration block for fine-grained access control"
  type        = list(object({
    anonymous_auth_enabled         = optional(bool)
    enabled                        = bool
    internal_user_database_enabled = optional(bool)
    master_user_options            = optional(list(object({
      master_user_arn      = optional(string)
      master_user_name     = optional(string)
      master_user_password = optional(string)
    })), [])
  }))
  default     = []
}
variable "opensearch_domain_auto_tune_options" {
  description = "Configuration block for the Auto-Tune options of the domain"
  type        = list(object({
    desired_state        = string
    rollback_on_disable  = string
    maintenance_schedule = optional(list(object({
      cron_expression_for_recurrence = string
      start_at                       = string
      duration                       = list(object({
        unit  = string
        value = number
      }))
    })), [])
  }))
  default     = []
}
variable "opensearch_domain_cluster_config" {
  description = "Configuration block for the cluster of the domain"
  type        = list(object({
    dedicated_master_count   = optional(number)
    dedicated_master_enabled = optional(bool)
    dedicated_master_type    = optional(string)
    instance_count           = optional(number)
    instance_type            = optional(string)
    warm_count               = optional(number)
    warm_enabled             = optional(bool)
    warm_type                = optional(string)
    zone_awareness_enabled   = optional(bool)
    cold_storage_options = optional(list(object({
      enabled = optional(bool)
    })), [])
    zone_awareness_config    = optional(list(object({
      availability_zone_count = optional(number)
    })), [])
  }))
  default     = []
}
variable "opensearch_domain_cognito_options" {
  description = "Configuration block for authenticating dashboard with Cognito"
  type        = list(object({
    enabled          = optional(bool)
    identity_pool_id = string
    role_arn         = string
    user_pool_id     = string
  }))
  default     = []
}
variable "opensearch_domain_domain_endpoint_options" {
  description = "Configuration block for domain endpoint HTTP(S) related options"
  type        = list(object({
    custom_endpoint                 = optional(string)
    custom_endpoint_certificate_arn = optional(string)
    custom_endpoint_enabled         = optional(bool)
    enforce_https                   = optional(bool)
    tls_security_policy             = optional(string) 
  }))
  default     = []
}
variable "opensearch_domain_ebs_options" {
  description = "Configuration block for EBS related options, may be required based on chosen instance size"
  type        = list(object({
    ebs_enabled = bool
    iops        = optional(number)
    throughput  = optional(number)
    volume_size = optional(number)
    volume_type = optional(string)
  }))
  default     = []
}
variable "opensearch_domain_encrypt_at_rest" {
  description = "Configuration block for encrypt at rest options. Only available for certain instance types"
  type        = list(object({
    enabled    = bool
    kms_key_id = optional(string)
  }))
  default     = []
}
variable "opensearch_domain_log_publishing_options" {
  description = "Configuration block for publishing slow and application logs to CloudWatch Logs. This block can be declared multiple times, for each log_type, within the same resourc"
  type        = list(object({
    cloudwatch_log_group_arn = string
    enabled                  = optional(bool)
    log_type                 = string
  }))
  default     = []
}
variable "opensearch_domain_node_to_node_encryption" {
  description = "Configuration block for node-to-node encryption options"
  type        = list(object({
    enabled = bool
  }))
  default     = []
}
variable "opensearch_domain_off_peak_window_options" {
  description = "Configuration to add Off Peak update options"
  type        = list(object({
    enabled         = optional(bool)
    off_peak_window = optional(list(object({
      window_start_time = optional(list(object({
        hours   = optional(number)
        minutes = optional(number)
      })), [])
    })), []) 
  }))
  default     = []
}
variable "opensearch_domain_snapshot_options" {
  description = "Configuration block for snapshot related options. Detailed below. DEPRECATED. For domains running OpenSearch 5.3 and later, Amazon OpenSearch takes hourly automated snapshots, making this setting irrelevant. For domains running earlier versions, OpenSearch takes daily automated snapshots"
  type        = list(object({
    automated_snapshot_start_hour = number
  }))
  default     = []
}
variable "opensearch_domain_vpc_options" {
  description = "Configuration block for VPC related options. Adding or removing this configuration forces a new resource"
  type        = list(object({
    security_group_ids = optional(list(string))
    subnet_ids         = optional(list(string))
  }))
  default     = []
}
