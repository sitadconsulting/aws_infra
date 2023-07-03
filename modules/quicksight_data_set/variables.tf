variable "quicksight_data_set_aws_account_id" {
  description = "AWS account ID"
  type        = string
  default     = ""
}
variable "quicksight_data_set_data_set_id" {
  description = "Identifier for the data set"
  type        = string
}
variable "quicksight_data_set_import_mode" {
  description = "Indicates whether you want to import the data into SPICE. Valid values are SPICE and DIRECT_QUERY"
  type        = string
}
variable "quicksight_data_set_name" {
  description = "Display name for the dataset"
  type        = string
}
variable "quicksight_data_set_column_groups" {
  description = "Groupings of columns that work together in certain Amazon QuickSight features. Currently, only geospatial hierarchy is supported"
  type        = list(object({
    geo_spatial_column_group = optional(list(object({
      columns      = list(string) 
      country_code = string
      name         = string
    })))
  }))
  default     = []
}
variable "quicksight_data_set_column_level_permission_rules" {
  description = " A set of 1 or more definitions of a ColumnLevelPermissionRule"
  type        = list(object({
    column_names = optional(list(string))
    principals   = optional(list(string))
  }))
  default     = []
}
variable "quicksight_data_set_data_set_usage_configuration" {
  description = "The usage configuration to apply to child datasets that reference this dataset as a source"
  type        = list(object({
    disable_use_as_direct_query_source = optional(bool)
    disable_use_as_imported_source     = optional(bool)
  }))
  default     = []
}
variable "quicksight_data_set_field_folders" {
  description = "The folder that contains fields and nested subfolders for your dataset"
  type        = list(object({
    field_folders_id = string
    columns          = optional(list(string))
    description      = optional(string)
  }))
  default     = []
}
variable "quicksight_data_set_logical_table_map" {
  description = "Configures the combination and transformation of the data from the physical tables. Maximum of 1 entry"
  type        = list(object({
    alias                = string
    logical_table_map_id = string
    data_transforms = optional(list(object({
      cast_column_type_operation = optional(list(object({
        column_name     = string
        format          = optional(string)
        new_column_type = string
      })))
      create_columns_operation = optional(list(object({
        columns = list(object({
          column_id   = string
          column_name = string
          expression  = string
        }))
      })))
      filter_operation = optional(list(object({
        condition_expression = string
      })))
      project_operation = optional(list(object({
        projected_columns = list(string)
      })))
      rename_column_operation = optional(list(object({
        column_name     = string
        new_column_name = string
      })))
      tag_column_operation = optional(list(object({
        column_name = string
        tags        = list(object({
          column_geographic_role = optional(string)
          column_description = optional(list(object({
            text = optional(string)
          })))
        }))
      })))
      untag_column_operation = optional(list(object({
        column_name = string
        tag_names   = list(string)

      })))
    })))
    source = list(object({
      data_set_arn      = optional(string)
      physical_table_id = optional(string)
      join_instruction = optional(list(object({
        left_operand  = string
        on_clause     = string
        right_operand = string
        type          = string
        left_join_key_properties = optional(list(object({
          unique_key = optional(bool)
        })))
        right_join_key_properties = optional(list(object({
          unique_key = optional(bool)
        })))
      })))
    }))
  }))
  default     = []
}
variable "quicksight_data_set_permissions" {
  description = "A set of resource permissions on the data source. Maximum of 64 items"
  type        = list(object({
    actions   = list(string)
    principal = string
  }))
  default     = []
}
variable "quicksight_data_set_physical_table_map" {
  description = "Declares the physical tables that are available in the underlying data sources"
  type        = list(object({
    physical_table_map_id = string
    custom_sql = optional(list(object({
      data_source_arn = string
      name            = string
      sql_query       = string
      columns = optional(list(object({
        name = string
        type = string
      })))
    })))
    relational_table = optional(list(object({
      catalog         = optional(string)
      data_source_arn = string
      name            = string
      schema          = optional(string)
      input_columns   = list(object({
        name = string
        type = string
      }))
    })))
    s3_source = optional(list(object({
      data_source_arn = string
      input_columns   = list(object({
        name = string
        type = string
      }))
      upload_settings = list(object({
        contains_header = optional(bool)
        delimiter       = optional(string)
        format          = optional(string)
        start_from_row  = optional(number)
        text_qualifier  = optional(string)
      }))
    })))
  }))
}
variable "quicksight_data_set_row_level_permission_data_set" {
  description = "The row-level security configuration for the data that you want to create"
  type        = list(object({
    arn               = string
    format_version    = optional(string)
    namespace         = optional(string)
    permission_policy = string
    status            = optional(string)

  }))
  default     = []
}
variable "quicksight_data_set_row_level_permission_tag_configuration" {
  description = "The configuration of tags on a dataset to set row-level security. Row-level security tags are currently supported for anonymous embedding only"
  type        = list(object({
    status    = optional(string)
    tag_rules = list(object({
      column_name               = string
      match_all_value           = optional(string)
      tag_key                   = string
      tag_multi_value_delimiter = optional(string)
    }))
  }))
  default     = []
}
variable "quicksight_data_set_refresh_properties" {
  description = "The refresh properties for the data set. NOTE: Only valid when import_mode is set to SPICE"
  type        = list(object({
    refresh_configuration = list(object({
      incremental_refresh = list(object({
        lookback_window   = list(object({
          column_name = string
          size        = number
          size_unit   = string
        }))
      }))
    }))
  }))
  default     = []
}
