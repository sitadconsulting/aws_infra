variable "glue_ml_transform_description" {
  description = "Description of the ML Transform"
  type        = string
  default     = ""
}
variable "glue_ml_transform_glue_version" {
  description = "The version of glue to use"
  type        = string
  default     = null
}
variable "glue_ml_transform_max_capacity" {
  description = "The number of AWS Glue data processing units (DPUs) that are allocated to task runs for this transform. You can allocate from 2 to 100 DPUs; the default is 10. max_capacity is a mutually exclusive option with number_of_workers and worker_type"
  type        = number
  default     = null
}
variable "glue_ml_transform_max_retries" {
  description = "The maximum number of times to retry this ML Transform if it fails"
  type        = number
  default     = null
}
variable "glue_ml_transform_name" {
  description = "The name you assign to this ML Transform. It must be unique in your account"
  type        = string
}
variable "glue_ml_transform_number_of_workers" {
  description = "The number of workers of a defined worker_type that are allocated when an ML Transform runs. Required with worker_type"
  type        = number
  default     = null
}
variable "glue_ml_transform_role_arn" {
  description = "The ARN of the IAM role associated with this ML Transform"
  type        = string
}
variable "glue_ml_transform_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "glue_ml_transform_timeout" {
  description = "The ML Transform timeout in minutes. The default is 2880 minutes (48 hours)"
  type        = number
  default     = null
}
variable "glue_ml_transform_worker_type" {
  description = "The type of predefined worker that is allocated when an ML Transform runs. Accepts a value of Standard, G.1X, or G.2X. Required with number_of_workers"
  type        = string
  default     = null
}
variable "glue_ml_transform_input_record_tables" {
  description = "A list of AWS Glue table definitions used by the transform"
  type        = list(object({
    database_name    = string
    table_name       = string
    catalog_id       = optional(string)
    connection_name  = optional(string)
  }))
  default     = []
}
variable "glue_ml_transform_parameters" {
  description = "The algorithmic parameters that are specific to the transform type used. Conditionally dependent on the transform type"
  type        = list(object({
    transform_type = string
    find_matches_parameters = list(object({
      accuracy_cost_trade_off    = optional(number)
      enforce_provided_labels    = optional(bool)
      precision_recall_trade_off = optional(number)
      primary_key_column_name    = optional(string)
    })) 
  }))
  default     = []
}
