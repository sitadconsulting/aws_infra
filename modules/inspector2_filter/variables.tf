variable "inspector2_filter_action" {
  description = "(Required) Action to be applied to the findings that maatch the filter. Possible values are NONE and SUPPRESS"
  type        = string
}
variable "inspector2_filter_description" {
  description = "(Optional) Description"
  type        = string
  default     = null
}
variable "inspector2_filter_name" {
  description = "(Required) Name of the filter"
  type        = string
}
variable "inspector2_filter_reason" {
  description = "(Optional) Reason for creating the filter"
  type        = string
  default     = null
}
variable "inspector2_filter_tags" {
  description = "(Optional) Map of tags assigned to the resource"
  type        = map(string)
  default     = {}
}
variable "inspector2_filter_filter_criteria" {
  description = "(Required) Details on the filter criteria"
  type        = list(object({
    aws_account_id                     = optional(list(object({
      comparison = string
      value      = string
    })), [])
    code_repository_project_name       = optional(list(object({
      comparison = string
      value      = string
    })), [])
    code_repository_provider_type      = optional(list(object({
      comparison = string
      value      = string
    })), [])
    code_vulnerability_detector_name   = optional(list(object({
      comparison = string
      value      = string
    })), [])
    code_vulnerability_detector_tags   = optional(list(object({
      comparison = string
      value      = string
    })), [])
    code_vulnerability_file_path       = optional(list(object({
      comparison = string
      value      = string
    })), [])
    component_id                       = optional(list(object({
      comparison = string
      value      = string
    })), [])
    component_type                     = optional(list(object({
      comparison = string
      value      = string
    })), [])
    ec2_instance_image_id              = optional(list(object({
      comparison = string
      value      = string
    })), [])
    ec2_instance_subnet_id             = optional(list(object({
      comparison = string
      value      = string

    })), [])
    ec2_instance_vpc_id                = optional(list(object({
      comparison = string
      value      = string

    })), [])
    ecr_image_architecture             = optional(list(object({
      comparison = string
      value      = string
    })), [])
    ecr_image_in_use_count             = optional(list(object({
      lower_inclusive = number
      upper_inclusive = number
    })), [])
    ecr_image_last_in_use_at           = optional(list(object({
      end_inclusive   = optional(string)
      start_inclusive = optional(string)
    })), [])
    ecr_image_hash                     = optional(list(object({
      comparison = string
      value      = string
    })), [])
    ecr_image_pushed_at                = optional(list(object({
      end_inclusive   = optional(string)
      start_inclusive = optional(string)
    })), [])
    ecr_image_registry                 = optional(list(object({
      comparison = string
      value      = string
    })), [])
    ecr_image_repository_name          = optional(list(object({
      comparison = string
      value      = string
    })), [])
    ecr_image_tags                     = optional(list(object({
      comparison = string
      value      = string
    })), [])
    epss_score                         = optional(list(object({
      lower_inclusive = number
      upper_inclusive = number
    })), [])
    exploit_available                  = optional(list(object({
      comparison = string
      value      = string
    })), [])
    finding_arn                        = optional(list(object({
      comparison = string
      value      = string
    })), [])
    finding_status                     = optional(list(object({
      comparison = string
      value      = string
    })), [])
    finding_type                       = optional(list(object({
      comparison = string
      value      = string
    })), [])
    fix_available                      = optional(list(object({
      comparison = string
      value      = string
    })), [])
    first_observed_at                  = optional(list(object({
      end_inclusive   = optional(string)
      start_inclusive = optional(string)
    })), [])
    inspector_score                    = optional(list(object({
      lower_inclusive = number
      upper_inclusive = number
    })), [])
    lambda_function_execution_role_arn = optional(list(object({
      comparison = string
      value      = string
    })), [])
    lambda_function_last_modified_at   = optional(list(object({
      end_inclusive   = optional(string)
      start_inclusive = optional(string)
    })), [])
    lambda_function_layers             = optional(list(object({
      comparison = string
      value      = string
    })), [])
    lambda_function_name               = optional(list(object({
      comparison = string
      value      = string
    })), [])
    lambda_function_runtime            = optional(list(object({
      comparison = string
      value      = string
    })), [])
    last_observed_at                   = optional(list(object({
      end_inclusive   = optional(string)
      start_inclusive = optional(string)
    })), [])
    network_protocol                   = optional(list(object({
      comparison = string
      value      = string
    })), [])
    port_range                         = optional(list(object({
      begin_inclusive = number
      end_inclusive   = number
    })), [])
    related_vulnerabilities            = optional(list(object({
      comparison = string
      value      = string
    })), [])
    resource_id                        = optional(list(object({
      comparison = string
      value      = string
    })), [])
    resource_tags                      = optional(list(object({
      comparison = string
      key        = string
      value      = string
    })), [])
    resource_type                      = optional(list(object({
      comparison = string
      value      = string
    })), [])
    severity                           = optional(list(object({
      comparison = string
      value      = string
    })), [])
    title                              = optional(list(object({
      comparison = string
      value      = string
    })), [])
    updated_at                         = optional(list(object({
      end_inclusive   = optional(string)
      start_inclusive = optional(string)
    })), [])
    vendor_severity                    = optional(list(object({
      comparison = string
      value      = string
    })), [])
    vulnerability_id                   = optional(list(object({
      comparison = string
      value      = string
    })), [])
    vulnerability_source               = optional(list(object({
      comparison = string
      value      = string
    })), [])
    vulnerable_packages                = optional(list(object({
      architecture            = optional(list(object({
        comparison = string
        value      = string
      })), [])
      epoch                   = optional(list(object({
        end_inclusive   = optional(string)
        start_inclusive = optional(string)
      })), [])
      file_path               = optional(list(object({
        comparison = string
        value      = string
      })), [])
      name                    = optional(list(object({
        comparison = string
        value      = string
      })), [])
      release                 = optional(list(object({
        comparison = string
        value      = string
      })), [])
      source_lambda_layer_arn = optional(list(object({
        comparison = string
        value      = string
      })), [])
      source_layer_hash       = optional(list(object({
        comparison = string
        value      = string
      })), [])
      version                 = optional(list(object({
        comparison = string
        value      = string
      })), [])
    })), [])
  }))
}
