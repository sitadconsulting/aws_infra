variable "s3_bucket_replication_configuration_bucket" {
  description = "Name of the source S3 bucket you want Amazon S3 to monitor"
  type        = string
}
variable "s3_bucket_replication_configuration_role" {
  description = "ARN of the IAM role for Amazon S3 to assume when replicating the objects"
  type        = string
}
variable "s3_bucket_replication_configuration_token" {
  description = "Token to allow replication to be enabled on an Object Lock-enabled bucket. You must contact AWS support for the bucket's \"Object Lock token\""
  type        = string
  default     = ""
}
variable "s3_bucket_replication_configuration_rule" {
  description = "Configuration rules for managing replication"
  type        = list(object({
    id       = optional(string)
    priority = optional(number)
    status   = string
    delete_marker_replication = optional(list(object({
      status = string
    })), [])
    destination               = list(object({
      account       = optional(string)
      bucket        = string
      storage_class = optional(string)
      access_control_translation = optional(list(object({
        owner = string
      })), [])
      encryption_configuration = optional(list(object({
        replica_kms_key_id =string
      })), [])
      metrics                  = optional(list(object({
        status = string
        event_threshold = optional(list(object({
          minutes = number
        })), [])
      })), [])
      replication_time         = optional(list(object({
        status  = string
        time    = list(object({
          minutes = number
        }))
      })), [])
    }))
    existing_object_replication = optional(list(object({
      status = string
    })), [])
    filter = optional(list(object({
      prefix = optional(string)
      and  = optional(list(object({
        prefix = optional(string)
        tags   = map(string)
      })), [])
      tag  = optional(list(object({
        key   = string
        value = string
      })), [])
    })), [])
    source_selection_criteria = optional(list(object({
      replica_modifications = optional(list(object({
        status = string 
      })), [])
      sse_kms_encrypted_objects = optional(list(object({
        status = string
      })), [])
    })), [])
  }))
  default     = []
}
