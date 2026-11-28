variable "macie2_classification_job_custom_data_identifier_ids" {
  description = "(Optional) Custom data identifiers to use for data analysis and classification"
  type        = list(string)
  default     = null
}
variable "macie2_classification_job_description" {
  description = "(Optional) Custom description of the job. Can contain as many as 200 characters"
  type        = string
  default     = null
}
variable "macie2_classification_job_initial_run" {
  description = "(Optional) Whether to analyze all existing, eligible objects immediately after the job is created"
  type        = bool
  default     = null
}
variable "macie2_classification_job_job_status" {
  description = "(Optional) Status for the job. Valid values are CANCELLED, RUNNING and USER_PAUSED"
  type        = string
  default     = null
}
variable "macie2_classification_job_job_type" {
  description = "(Required) Schedule for running the job. Valid values are ONE_TIME, to run the job only once, and SCHEDULED, to run the job on a daily, weekly, or monthly basis. When set to SCHEDULED, use schedule_frequency to define the recurrence pattern for the job"
  type        = string
}
variable "macie2_classification_job_name" {
  description = "(Optional) Custom name for the job. Can contain as many as 500 characters. If omitted, Terraform assigns a random, unique name. Conflicts with name_prefix "
  type        = string
  default     = null
}
variable "macie2_classification_job_name_prefix" {
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "macie2_classification_job_sampling_percentage" {
  description = "(Optional) Sampling depth, as a percentage, to apply when processing objects. This value determines the percentage of eligible objects that the job analyzes. If this value is less than 100, Amazon Macie selects the objects to analyze at random, up to the specified percentage, and analyzes all the data in those objects"
  type        = number
  default     = null
}
variable "macie2_classification_job_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "macie2_classification_job_s3_job_definition" {
  description = "(Required) S3 buckets that contain the objects to analyze, and the scope of that analysis"
  type        = list(object({
    bucket_criteria    = optional(list(object({
      excludes = optional(list(object({
        and = optional(list(object({
         simple_criterion = optional(list(object({
           comparator = optional(string)
           key        = optional(string)
           values     = optional(list(string))
         })), [])
         tag_criterion    = optional(list(object({
           comparator = optional(string)
           tag_values = optional(list(object({
             key   = optional(string)
             value = optional(string)
           })), [])
         })), [])
        })), [])
      })), [])
      includes = optonal(list(object({
        add = optional(list(object({
          simple_criterion = optional(list(object({
            comparator = optional(string)
            key        = optional(string)
            values     = optional(list(string))
          })), [])
          tag_criterion    = optional(list(object({
            comparator = optional(string)
            tag_values = optional(list(object({
              key   = optional(string)
              value = optional(string)
            })), [])
          })), [])
        })), [])
      })), [])
    })), [])
    bucket_definitions = optional(list(object({
      account_id = string
      buckets    = list(string)
    })), [])
    scoping            = optional(list(object({
      excludes = optional(list(object({
        and = optional(list(object({
          simple_scope_term = optional(list(object({
            comparator = optional(string)
            key        = optional(string)
            values     = optional(list(string))
          })), [])
          tag_scope_term    = optional(list(object({
            comparator = optional(string)
            key        = optional(string)
            target     = optional(string)
            tag_values = optional(list(object({
              key   = optional(string)
              value = optional(string)
            })), [])
          })), [])
        })), [])
      })), [])
      includes = optional(list(object({
        and = optional(list(object({
          simple_scope_term = optional(list(object({
            comparator = optional(string)
            key        = optional(string)
            values     = optional(list(string))
          })), [])
          tag_scope_term    = optional(list(object({
            comparator = optional(string)
            key        = optional(string)
            target     = optional(string)
            tag_values = optional(list(object({
              key   = optional(string)
              value = optional(string)
            })), [])
          })), [])
        })), [])
      })), [])
    })), []) 
  }))
  default     = []
}
variable "macie2_classification_job_schedule_frequency" {
  description = "(Optional) Recurrence pattern for running the job. To run the job only once, omit this argument and set job_type to ONE_TIME"
  type        = list(object({
    daily_schedule   = optional(bool)
    monthly_schedule = optional(number)
    weekly_schedule  = optional(string)
  }))
  default     = []
}
