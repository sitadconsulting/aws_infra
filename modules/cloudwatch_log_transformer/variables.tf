variable "cloudwatch_log_transformer_log_group_arn" {
  description = "(Required) Log group ARN to set the transformer for"
  type        = string
}
variable "cloudwatch_log_transformer_transformer_config" {
  description = "(Required) Specifies the configuration of the transformer. You must include at least one configuration, and 20 at most"
  type        = list(object({
    add_keys            = optional(list(object({
      entry = list(object({
        key                 = string
        overwrite_if_exists = optional(bool)
        value               = string
      }))
    })), [])
    copy_value          = optional(list(object({
      entry = list(object({
        overwrite_if_exists = optional(bool)
        source              = string
        target              = string
      }))
    })), [])
    csv                 = optional(list(object({
      columns         = optional(list(string))
      delimiter       = optional(string)
      quote_character = optional(string)
      source          = optional(string)
    })), [])
    date_time_converter = optional(list(object({
      locale          = optional(string)
      match_patterns  = list(string)
      source          = string
      source_timezone = optional(string)
      target          = string
      target_format   = optional(string)
      target_timezone = optional(string)
    })), [])
    delete_keys         = optional(list(object({
      with_keys = list(string)
    })), [])
    grok                = optional(list(object({
      match  = string
      source = optional(string)
    })), [])
    list_to_map         = optional(list(object({
      flatten           = optional(bool)
      flattened_element = optional(string)
      key               = string
      source            = string
      target            = optional(string)
      value_key         = optional(string)
    })), [])
    lower_case_string   = optional(list(object({
      with_keys = list(string)
    })), [])
    move_keys           = optional(list(object({
      entry = list(object({
        overwrite_if_exists = optional(bool)
        source              = string
        target              = string
      }))
    })), [])
    parse_cloudfront    = optional(list(object({
      source = optional(string)
    })), [])
    parse_json          = optional(list(object({
      destination = optional(string)
      source      = optional(string)
    })), [])
    parse_key_value     = optional(list(object({
      destination         = optional(string)
      field_delimiter     = optional(string)
      key_prefix          = optional(string)
      key_value_delimiter = optional(string)
      non_match_value     = optional(string)
      overwrite_if_exists = optional(bool)
      source              = optional(string)
    })), [])
    parse_postgres      = optional(list(object({
      source = optional(string)
    })), [])
    parse_route53       = optional(list(object({
      source = optional(string)
    })), [])
    parse_to_ocsf       = optional(list(object({
      event_type   = string
      ocsf_version = string
      source       = optional(string)
    })), [])
    parse_vpc           = optional(list(object({
      source = optional(string)
    })), [])
    parse_waf           = optional(list(object({
      source = optional(string) 
    })), [])
    rename_keys         = optional(list(object({
      entry = list(object({
        key                 = string
        overwrite_if_exists = optional(bool)
        rename_to           = string
      }))
    })), [])
    split_string        = optional(list(object({
      entry = list(object({
        delimiter = string
        source    = string
      }))
    })), [])
    substitute_string   = optional(list(object({
      entry = list(object({
        from   = string
        source = string
        to     = string
      }))
    })), [])
    trim_string         = optional(list(object({
      with_keys = list(string)
    })), [])
    type_converter      = optional(list(object({
      entry = list(object({
        key   = string
        value = string
      }))
    })), [])
    upper_case_string   = optional(list(object({
      with_keys = list(string) 
    })), [])
  }))
}
