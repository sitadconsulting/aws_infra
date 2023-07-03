variable "quicksight_template_aws_account_id" {
  description = "AWS account ID"
  type        = string
  default     = ""
}
variable "quicksight_template_name" {
  description = "Display name for the template"
  type        = string
}
variable "quicksight_template_template_id" {
  description = "Identifier for the template"
  type        = string
}
variable "quicksight_template_version_description" {
  description = "A description of the current template version being created/updated"
  type        = string
}
variable "quicksight_template_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "quicksight_template_definition" {
  descrition = "A detailed template definition. Only one of definition or source_entity should be configured"
  type       = list(object({
    analysis_defaults = optional(list(object({
      default_new_sheet_configuration = list(object({
        sheet_content_type = optional(string)
        interactive_layout_configuration = optional(list(object({
          free_form = optional(list(object({
            canvas_size_options = list(object({
              screen_canvas_size_options = optional(list(object({
                optimized_view_port_width = string
              })))
            }))
          })))
          grid = optional(list(object({
            canvas_size_options = list(object({
              screen_canvas_size_options = optional(list(object({
                optimized_view_port_width = optional(string)
                resize_option             = string
              })))
            }))
          })))
        })))
        paginated_layout_configuration = optional(list(object({
          section_based = optional(list(object({
            canvas_size_options = list(object({
              paper_canvas_size_options = optional(list(object({
                paper_orientation = optional(string)
                paper_size        = optional(string)
                paper_margin      = optional(list(object({
                  bottom = optional(string)
                  left   = optional(string)
                  right  = optional(string)
                  top    = optional(string)
                })))
              })))
            }))
          })))
        })))
      }))
    })))
    calculated_fields     = optional(list(object({
      data_set_identifier = string
      expression          = string
      name                = string
    })))
    column_configurations = optional(list(object({
      role                 = optional(string)
      column               = list(object({
        column_name         = string
        data_set_identifier = string
      }))
      format_configuration = optional(list(object({
        date_time_format_configuration = optional(list(object({
          date_time_format                = optional(string)
          null_value_format_configuration = optional(list(object({
            null_string = string
          })))
          numeric_format_configuration    = optional(list(object({
            currency_display_format_configuration = optional(list(object({
              number_scale                    = optional(string)
              prefix                          = optional(string)
              suffix                          = optional(string)
              symbol                          = optional(string)
              decimal_places_configuration    = optional(list(object({
                decimal_places = number
              })))
              negative_value_configuration    = optional(list(object({
                display_mode = string
              })))
              null_value_format_configuration = optional(list(object({
                null_string = string
              })))
              separator_configuration         = optional(list(object({
                decimal_separator = optional(string)
                thousands_separator = optional(list(object({
                  symbol     = optional(string)
                  visibility = optional(string)
                })))
              })))
            })))
            number_display_format_configuration = optional(list(object({
              number_scale                    = optional(string)
              prefix                          = optional(string)
              suffix                          = optional(string)
              decimal_places_configuration    = optional(list(object({
                decimal_places = number
              })))
              negative_value_configuration    = optional(list(object({
                display_mode = string
              })))
              null_value_format_configuration = optional(list(object({
                null_string = string
              })))
              separator_configuration         = optional(list(object({
                decimal_separator = optional(string)
                thousands_separator = optional(list(object({
                  symbol     = optional(string)
                  visibility = optional(string)
                })))
              })))
            })))
            percentage_display_format_configuration = optional(list(object({
              prefix                          = optional(string)
              suffix                          = optional(string)
              decimal_places_configuration    = optional(list(object({
                decimal_places = number
              })))
              negative_value_configuration    = optional(list(object({
                display_mode = string
              })))
              null_value_format_configuration = optional(list(object({
                null_string = string
              })))
              separator_configuration         = optional(list(object({
                decimal_separator = optional(string)
                thousands_separator = optional(list(object({
                  symbol     = optional(string)
                  visibility = optional(string)
                })))
              })))
            })))
          })))
        })))
        string_format_configuration    = optional(list(object({
          null_value_format_configuration = optional(list(object({
            null_string = string
          })))
          numeric_format_configuration    = optional(list(object({
            currency_display_format_configuration = optional(list(object({
              number_scale                    = optional(string)
              prefix                          = optional(string)
              suffix                          = optional(string)
              symbol                          = optional(string)
              decimal_places_configuration    = optional(list(object({
                decimal_places = number
              })))
              negative_value_configuration    = optional(list(object({
                display_mode = string
              })))
              null_value_format_configuration = optional(list(object({
                null_string = string
              })))
              separator_configuration         = optional(list(object({
                decimal_separator = optional(string)
                thousands_separator = optional(list(object({
                  symbol     = optional(string)
                  visibility = optional(string)
                })))
              })))
            })))
            number_display_format_configuration     = optional(list(object({
              number_scale                    = optional(string)
              prefix                          = optional(string)
              suffix                          = optional(string)
              decimal_places_configuration    = optional(list(object({
                decimal_places = number
              })))
              negative_value_configuration    = optional(list(object({
                display_mode = string
              })))
              null_value_format_configuration = optional(list(object({
                null_string = string
              })))
              separator_configuration         = optional(list(object({
                decimal_separator = optional(string)
                thousands_separator = optional(list(object({
                  symbol     = optional(string)
                  visibility = optional(string)
                })))
              })))
            })))
            percentage_display_format_configuration = optional(list(object({
              prefix                          = optional(string)
              suffix                          = optional(string)
              decimal_places_configuration    = optional(list(object({
                decimal_places = number
              })))
              negative_value_configuration    = optional(list(object({
                display_mode = string
              })))
              null_value_format_configuration = optional(list(object({
                null_string = string
              })))
              separator_configuration         = optional(list(object({
                decimal_separator = optional(string)
                thousands_separator = optional(list(object({
                  symbol     = optional(string)
                  visibility = optional(string)
                })))
              })))
            })))
          })))
        })))
      })))
    })))
    data_set_configuration = list(object({
      placeholder              = optional(string)
      column_group_schema_list = optional(list(object({
        name                            = optional(string)
        column_group_column_schema_list = optional(list(object({
          name = optional(string)
        })))
      })))
      data_set_schema          = optional(list(object({
        column_schema_list     = optional(list(object({
          data_type       = optional(string)
          geographic_role = optional(string)
          name            = optional(string)
        })))
      })))
    }))
    filter_groups           = optional(list(object({
      cross_dataset       = string
      filter_group_id     = string
      status              = optional(string)
      scope_configuration = list(object({
        selected_sheets  = optional(list(object({
          sheet_visual_scoping_configurations = optional(list(object({
            scope      = string
            sheet_id   = string
            visual_ids = optional(list(string))
          })))
        })))
      }))
      filters             = list(object({
        category_filter         = optional(list(object({
          filter_id     = string
          column        = list(object({
            column_name         = string
            data_set_identifier = string
          }))  
          configuration = list(object({
            custom_filter_configuration = optional(list(object({
              match_operator     = string
              null_option        = string
              category_value     = optional(string)
              parameter_name     = optional(string)
              select_all_options = optional(list(object({
                visibility = optional(string)
              })))
            })))
            custom_filter_list_configuration = optional(list(object({
              match_operator     = string
              null_option        = string
              category_values    = optional(list(string))
              select_all_options = optional(list(object({
                visibility = optional(string)
              })))
            })))
            filter_list_configuration = optional(list(object({
              match_operator     = string
              category_values    = optional(list(string))
              select_all_options = optional(list(object({
                visibility = optional(string)
              })))
            })))
          }))
        })))
        numeric_equality_filter = optional(list(object({
          filter_id            = string
          match_operator       = string
          null_option          = string
          value                = optional(number)
          select_all_options = optional(list(object({
            visibility = optional(string)
          })))
          aggregation_function = optional(list(object({
            categorical_aggregation_function = optional(string)
            date_aggregation_function        = optional(string)
            numerical_aggregation_function   = optional(list(object({
              simple_numerical_aggregation = optional(string)
              percentile_aggregation = optional(list(object({
                percentile_value = optional(number)
              })))
            })))
          })))
          parameter_name       = optional(string)
          column               = list(object({
            column_name         = string
            data_set_identifier = string
          }))  
        })))
        numeric_range_filter    = optional(list(object({
          filter_id            = string
          null_option          = string
          include_maximum      = optional(bool)
          include_minimum      = optional(bool)
          column               = list(object({
            column_name         = string
            data_set_identifier = string
          }))  
          aggregation_function = optional(list(object({
            categorical_aggregation_function = optional(string)
            date_aggregation_function        = optional(string)
            numerical_aggregation_function   = optional(list(object({
              simple_numerical_aggregation = optional(string)
              percentile_aggregation = optional(list(object({
                percentile_value = optional(number)
              })))
            })))
          })))
          range_maximum = optional(list(object({
            parameter    = optional(string)
            static_value = optional(number)
          })))
          range_minimum = optional(list(object({
            parameter    = optional(string)
            static_value = optional(number)
          })))
          select_all_options = optional(list(object({
            visibility = optional(string)
          })))
        })))
        relative_dates_filter   = optional(list(object({
          filter_id           = string
          null_option         = string
          relative_date_type  = string
          time_granularity    = string
          minimum_granularity = string
          parameter_name      = optional(string)
          relative_date_value = optional(number)
          anchor_date_configuration = list(object({
            anchor_option  = optional(string)
            parameter_name = optional(string)
          }))
          column               = list(object({
            column_name         = string
            data_set_identifier = string
          }))  
          exclude_period_configuration = optional(list(object({
            amount      = number
            granularity = string
            status      = optional(string)
          })))
        })))
        time_equality_filter    = optional(list(object({
          filter_id        = string
          time_granularity = string
          parameter_name   = optional(string)
          value            = optional(string)
          column               = list(object({
            column_name         = string
            data_set_identifier = string
          }))  
        })))
        time_range_filter       = optional(list(object({
          filter_id                    = string
          null_option                  = string
          include_maximum              = optional(bool)
          include_minimum              = optional(bool)
          time_granularity             = string
          column               = list(object({
            column_name         = string
            data_set_identifier = string
          }))  
          exclude_period_configuration = optional(list(object({
            amount      = number
            granularity = string
            status      = optional(string)
          })))
          range_maximum = optional(list(object({
            parameter    = optional(string)
            static_value = optional(number)
          })))
          range_minimum = optional(list(object({
            parameter    = optional(string)
            static_value = optional(number)
          })))
        })))
        top_bottom_filter       = optional(list(object({
          filter_id        = string
          limit            = optional(number)
          parameter_name   = optional(string)
          time_granularity = string
          aggregation_sort_configuration = list(object({
            sort_direction       = string
            aggregation_function = optional(list(object({
              categorical_aggregation_function = optional(string)
              date_aggregation_function        = optional(string)
              numerical_aggregation_function   = optional(list(object({
                simple_numerical_aggregation = optional(string)
                  percentile_aggregation = optional(list(object({
                    percentile_value = optional(number)
                  })))
              })))
            })))
            column               = list(object({
              column_name         = string
              data_set_identifier = string
            }))  
          }))
          column               = list(object({
            column_name         = string
            data_set_identifier = string
          }))  
        })))
      }))
    })))
    parameters_declarations = optional(list(object({
      date_time_parameter_declaration = optional(list(object({
        name             = string
        time_granularity = optional(string)
        default_values = optional(list(object({
          static_values = optional(list(string))
          dynamic_value = optional(list(object({
            default_value_column = list(object({
              column_name         = string
              data_set_identifier = string
            }))
            group_name_column    = list(object({
              column_name         = string
              data_set_identifier = string
            }))
            user_name_column     = list(object({
              column_name         = string
              data_set_identifier = string
            }))
          })))
          rolling_date  = optional(list(object({
            data_set_identifier = optional(string)
            expression          = string
          })))
        })))
        values_when_unset = optional(list(object({
          custom_value            = optional(number)
          value_when_unset_option = optional(string)
        })))
      })))
      decimal_parameter_declaration   = optional(list(object({
        name                 = string
        parameter_value_type = string
        default_values = optional(list(object({
          static_values = optional(list(string))
          dynamic_value = optional(list(object({
            default_value_column = list(object({
              column_name         = string
              data_set_identifier = string
            }))
            group_name_column    = list(object({
              column_name         = string
              data_set_identifier = string
            }))
            user_name_column     = list(object({
              column_name         = string
              data_set_identifier = string
            }))
          })))
          rolling_date  = optional(list(object({
            data_set_identifier = optional(string)
            expression          = string
          })))
        })))
        values_when_unset = optional(list(object({
          custom_value            = optional(number)
          value_when_unset_option = optional(string)
        })))
      })))
      integer_parameter_declaration   = optional(list(object({
        name                 = string
        parameter_value_type = string
        default_values = optional(list(object({
          static_values = optional(list(string))
          dynamic_value = optional(list(object({
            default_value_column = list(object({
              column_name         = string
              data_set_identifier = string
            }))
            group_name_column    = list(object({
              column_name         = string
              data_set_identifier = string
            }))
            user_name_column     = list(object({
              column_name         = string
              data_set_identifier = string
            }))
          })))
          rolling_date  = optional(list(object({
            data_set_identifier = optional(string)
            expression          = string
          })))
        })))
        values_when_unset = optional(list(object({
          custom_value            = optional(number)
          value_when_unset_option = optional(string)
        })))
      })))
      string_parameter_declaration    = optional(list(object({
        name                 = string
        parameter_value_type = string
        default_values = optional(list(object({
          static_values = optional(list(string))
          dynamic_value = optional(list(object({
            default_value_column = list(object({
              column_name         = string
              data_set_identifier = string
            }))
            group_name_column    = list(object({
              column_name         = string
              data_set_identifier = string
            }))
            user_name_column     = list(object({
              column_name         = string
              data_set_identifier = string
            }))
          })))
          rolling_date  = optional(list(object({
            data_set_identifier = optional(string)
            expression          = string
          })))
        })))
        values_when_unset = optional(list(object({
          custom_value            = optional(number)
          value_when_unset_option = optional(string)
        })))
      })))
    })))
    sheets                  = optional(list(object({
      sheet_id              = string
      content_type          = optional(string)
      description           = optional(string)
      name                  = optional(string)
      title                 = optional(string)
      filter_controls       = optional(list(object({
        date_time_picker    = optional(list(object({
          filter_control_id = string
          source_filter_id  = string
          title             = string
          type              = optional(string)
          display_options   = optional(list(object({
            date_time_format = optional(string)
            title_options    = optional(list(object({
              custom_label = optional(string)
              visibility   = optional(string)
              font_configuration = optional(list(object({
                font_color      = optional(string)
                font_decoration = optional(string)
                font_style      = optional(string)
                font_size       = optional(list(object({
                  relative = optional(string)
                })))
                font_weight     = optional(list(object({
                  name = optional(string)
                })))
              }))) 
            })))
          })))
        })))
        dropdown            = optional(list(object({
          filter_control_id               = string
          source_filter_id                = string
          title                           = string
          cascading_control_configuration = 
          selectable_values               =
          type                            = optional(string)
          display_options                 = optional(list(object({
            select_all_options = optional(list(object({
              visibility = optional(string)
            })))
            title_options      = optional(list(object({
              custom_label       = optional(string)
              visibility         = optinal(string)
              font_configuration = optional(list(object({
                font_color      = optional(string)
                font_decoration = optional(string)
                font_style      = optional(string)
                font_size       = optional(list(object({
                  relative = optional(string)
                })))
                font_weight     = optional(list(object({
                  name = optional(string)
                })))
              }))) 
            })))
          })))
        })))
        list                = optional(list(object({
          filter_control_id               = string
          source_filter_id                = string
          title                           = string
          selectable_values               =
          type                            = optional(string)
          cascading_control_configuration = optional(list(object({
            source_controls = optional(list(object({
              column_to_match         = list(object({
                column_name         = string
                data_set_identifier = string
              }))
              source_sheet_control_id = optional(string)
            })))
          })))
          display_options                 = optional(list(object({
            select_all_options = optional(list(object({
              visibility = optional(string)
            })))
            title_options      = optional(list(object({
              custom_label       = optional(string)
              visibility         = optinal(string)
              font_configuration = optional(list(object({
                font_color      = optional(string)
                font_decoration = optional(string)
                font_style      = optional(string)
                font_size       = optional(list(object({
                  relative = optional(string)
                })))
                font_weight     = optional(list(object({
                  name = optional(string)
                })))
              }))) 
            })))
            search_options = optional(list(object({
              visibility = optional(string)
            })))
          })))
        })))
        relative_date_time  = optional(list(object({
          filter_control_id = string
          source_filter_id  = string
          title             = string
          display_options   = optional(list(object({
            date_time_format = optional(string)
            title_options      = optional(list(object({
              custom_label       = optional(string)
              visibility         = optinal(string)
              font_configuration = optional(list(object({
                font_color      = optional(string)
                font_decoration = optional(string)
                font_style      = optional(string)
                font_size       = optional(list(object({
                  relative = optional(string)
                })))
                font_weight     = optional(list(object({
                  name = optional(string)
                })))
              }))) 
            })))
          })))
          slider            = optional(list(object({
            filter_control_id = string
            source_filter_id  = string
            title             = string
            maximum_value     = number
            minimum_value     = number
            step_size         = number
            type              = optional(string)
            display_options   = optional(list(object({
              title_options      = optional(list(object({
                custom_label       = optional(string)
                visibility         = optinal(string)
                font_configuration = optional(list(object({
                  font_color      = optional(string)
                  font_decoration = optional(string)
                  font_style      = optional(string)
                  font_size       = optional(list(object({
                    relative = optional(string)
                  })))
                  font_weight     = optional(list(object({
                    name = optional(string)
                  })))
                }))) 
              })))
            })))
          }))) 
          text_area         = optional(list(object({
            filter_control_id = string
            source_filter_id  = string
            title             = string
            delimiter         = optional(string)
            display_options   = optional(list(object({
              placeholder_options =
              title_options      = optional(list(object({
                custom_label       = optional(string)
                visibility         = optinal(string)
                font_configuration = optional(list(object({
                  font_color      = optional(string)
                  font_decoration = optional(string)
                  font_style      = optional(string)
                  font_size       = optional(list(object({
                    relative = optional(string)
                  })))
                  font_weight     = optional(list(object({
                    name = optional(string)
                  })))
                }))) 
              })))
            })))
          })))
          text_field        = optional(list(object({
            filter_control_id = string
            source_filter_id  = string
            title             = string
            display_options   = optional(list(object({
              placeholder_options =
              title_options      = optional(list(object({
                custom_label       = optional(string)
                visibility         = optinal(string)
                font_configuration = optional(list(object({
                  font_color      = optional(string)
                  font_decoration = optional(string)
                  font_style      = optional(string)
                  font_size       = optional(list(object({
                    relative = optional(string)
                  })))
                  font_weight     = optional(list(object({
                    name = optional(string)
                  })))
                }))) 
              })))
            })))
          })))
        })))
      })))
      layouts               = optional(list(object({
        configuration = list(object({
          free_form_layout = optional(list(object({
            elements = list(object({
              element_id      = string
              element_type    = string
              height          = string
              width           = string
              x_axis_location = string
              y_axis_location = string
              background_style = optional(list(object({
                color      = optional(string)
                visibility = optional(string)
              }))) 
              border_style = optional(list(object({
                color      = optional(string)
                visibility = optional(string)
              })))
              loading_animation = optional(list(object({
                visibility = optional(string)
              })))
              rendering_rules   = optional(list(object({
                expression      = string
                configuration_overrides = list(object({
                  visibility = optional(string)
                }))
              })))
              selected_border_style = optional(list(object({
                color      = optional(string)
                visibility = optional(string)
              })))
              visibility = optional(string)
            }))
            canvas_size_options = optional(list(object({
              screen_canvas_size_options = optional(list(object({
                optimized_view_port_width = string
              })))
            })))
          })))
          grid_layout = optional(list(object({
            elements = list(object({
              column_span  = number
              element_id   = string
              element_type = string
              row_span     = number
              column_index = optional(number)
              row_index    = optional(number)
            }))
            canvas_size_options = optional(list(object({
              screen_canvas_size_options = optional(list(object({
                optimized_view_port_width = string
                resize_option             = string
              })))
            })))
          })))
          section_based_layout = optional(list(object({
            body_sections = list(object({
              section_id = string
              content = list(object({
                layout = optional(list(object({
                  free_form_layout = list(object({
                    elements = list(object({
                      column_span  = number
                      element_id   = string
                      element_type = string
                      row_span     = number
                      column_index = optional(number)
                      row_index    = optional(number)
                    }))
                  }))
                })))
              }))
              page_break_configuration = optional(list(object({
                after = optional(list(object({
                  status = optional(string)
                })))
              })))
              style = optional(list(object({
                height  = optional(string)
                padding = optional(list(object({
                  bottom = optional(string)
                  left   = optional(string)
                  right  = optional(string)
                  top    = optional(string)
                })))  
              })))
            }))
            canvas_size_options = optional(list(object({
              paper_canvas_size_options = optional(list(object({
                paper_orientation = optional(string)
                paper_size        = optional(string)
                paper_margin      = optional(list(object({
                  bottom = optional(string)
                  left   = optional(string)
                  right  = optional(string)
                  top    = optional(string)
              })))
            })))
          })))
          footer_sections = list(object({
            section_id = string
            layout     = optional(list(object({
              free_form_layout = list(object({
                elements = list(object({
                  column_span  = number
                  element_id   = string
                  element_type = string
                  row_span     = number
                  column_index = optional(number)
                  row_index    = optional(number)
                }))
              }))
            })))
            style = optional(list(object({
              height  = optional(string)
              padding = optional(list(object({
                bottom = optional(string)
                left   = optional(string)
                right  = optional(string)
                top    = optional(string)
              })))
            })))
          }))
          header_sections = list(object({
            section_id = string
            layout     = optional(list(object({
              free_form_layout = list(object({
                elements = list(object({
                  column_span  = number
                  element_id   = string
                  element_type = string
                  row_span     = number
                  column_index = optional(number)
                  row_index    = optional(number)
                }))
              }))
            })))
            style = optional(list(object({
              height  = optional(string)
              padding = optional(list(object({
                bottom = optional(string)
                left   = optional(string)
                right  = optional(string)
                top    = optional(string)
              })))
            })))
          }))
        })))
      }))
      parameter_controls    = optional(list(object({
        date_time_picker    = optional(list(object({
          filter_control_id = string
          source_filter_id  = string
          title             = string
          type              = optional(string)
          display_options   = optional(list(object({
            date_time_format = optional(string)
            title_options    = optional(list(object({
              custom_label = optional(string)
              visibility   = optional(string)
              font_configuration = optional(list(object({
                font_color      = optional(string)
                font_decoration = optional(string)
                font_style      = optional(string)
                font_size       = optional(list(object({
                  relative = optional(string)
                })))
                font_weight     = optional(list(object({
                  name = optional(string)
                })))
              }))) 
            })))
          })))
        })))
        dropdown            = optional(list(object({
          filter_control_id               = string
          source_filter_id                = string
          title                           = string
          cascading_control_configuration = 
          selectable_values               =
          type                            = optional(string)
          display_options                 = optional(list(object({
            select_all_options = optional(list(object({
              visibility = optional(string)
            })))
            title_options      = optional(list(object({
              custom_label       = optional(string)
              visibility         = optinal(string)
              font_configuration = optional(list(object({
                font_color      = optional(string)
                font_decoration = optional(string)
                font_style      = optional(string)
                font_size       = optional(list(object({
                  relative = optional(string)
                })))
                font_weight     = optional(list(object({
                  name = optional(string)
                })))
              }))) 
            })))
          })))
        })))
        list                = optional(list(object({
          filter_control_id               = string
          source_filter_id                = string
          title                           = string
          selectable_values               =
          type                            = optional(string)
          cascading_control_configuration = optional(list(object({
            source_controls = optional(list(object({
              column_to_match         = list(object({
                column_name         = string
                data_set_identifier = string
              }))
              source_sheet_control_id = optional(string)
            })))
          })))
          display_options                 = optional(list(object({
            select_all_options = optional(list(object({
              visibility = optional(string)
            })))
            title_options      = optional(list(object({
              custom_label       = optional(string)
              visibility         = optinal(string)
              font_configuration = optional(list(object({
                font_color      = optional(string)
                font_decoration = optional(string)
                font_style      = optional(string)
                font_size       = optional(list(object({
                  relative = optional(string)
                })))
                font_weight     = optional(list(object({
                  name = optional(string)
                })))
              }))) 
            })))
            search_options = optional(list(object({
              visibility = optional(string)
            })))
          })))
        })))
        relative_date_time  = optional(list(object({
          filter_control_id = string
          source_filter_id  = string
          title             = string
          display_options   = optional(list(object({
            date_time_format = optional(string)
            title_options      = optional(list(object({
              custom_label       = optional(string)
              visibility         = optinal(string)
              font_configuration = optional(list(object({
                font_color      = optional(string)
                font_decoration = optional(string)
                font_style      = optional(string)
                font_size       = optional(list(object({
                  relative = optional(string)
                })))
                font_weight     = optional(list(object({
                  name = optional(string)
                })))
              }))) 
            })))
          })))
          slider            = optional(list(object({
            filter_control_id = string
            source_filter_id  = string
            title             = string
            maximum_value     = number
            minimum_value     = number
            step_size         = number
            type              = optional(string)
            display_options   = optional(list(object({
              title_options      = optional(list(object({
                custom_label       = optional(string)
                visibility         = optinal(string)
                font_configuration = optional(list(object({
                  font_color      = optional(string)
                  font_decoration = optional(string)
                  font_style      = optional(string)
                  font_size       = optional(list(object({
                    relative = optional(string)
                  })))
                  font_weight     = optional(list(object({
                    name = optional(string)
                  })))
                }))) 
              })))
            })))
          }))) 
          text_area         = optional(list(object({
            filter_control_id = string
            source_filter_id  = string
            title             = string
            delimiter         = optional(string)
            display_options   = optional(list(object({
              placeholder_options =
              title_options      = optional(list(object({
                custom_label       = optional(string)
                visibility         = optinal(string)
                font_configuration = optional(list(object({
                  font_color      = optional(string)
                  font_decoration = optional(string)
                  font_style      = optional(string)
                  font_size       = optional(list(object({
                    relative = optional(string)
                  })))
                  font_weight     = optional(list(object({
                    name = optional(string)
                  })))
                }))) 
              })))
            })))
          })))
          text_field        = optional(list(object({
            filter_control_id = string
            source_filter_id  = string
            title             = string
            display_options   = optional(list(object({
              placeholder_options =
              title_options      = optional(list(object({
                custom_label       = optional(string)
                visibility         = optinal(string)
                font_configuration = optional(list(object({
                  font_color      = optional(string)
                  font_decoration = optional(string)
                  font_style      = optional(string)
                  font_size       = optional(list(object({
                    relative = optional(string)
                  })))
                  font_weight     = optional(list(object({
                    name = optional(string)
                  })))
                }))) 
              })))
            })))
          })))
        })))
      })))
      sheet_control_layouts = optional(list(object({
        configuration = list(object({
          grid_layout = optional(list(object({
            elements = list(object({
              column_span  = number
              element_id   = string
              element_type = string
              row_span     = number
              column_index = optional(number)
              row_index    = optional(number)
            }))
          })))
        }))
      })))
      visuals               = optional(list(object({
        bar_chart_visual = optional(list(object({
          visual_id
          actions
          column_hierarchies
          subtitle
          title
          chart_configuration = optional(list(object({
            bars_arrangement
            category_axis
            category_label_options
            color_label_options
            contribution_analysis_defaults 
            data_labels
            legend
            orientation
            reference_lines
            small_multiples_options
            tooltip
            value_axis
            value_label_options
            visual_palette
            field_wells = optional(list(object({
              bar_chart_aggregated_field_wells = optional(list(object({
                category
                colors
                small_multiples
                values
              })))
            })))
            sort_configuration  = optional(list(object({
              category_items_limit
              category_sort
              color_items_limit
              color_sort
              small_multiples_limit_configuration
              small_multiples_sort
            })))
          })))
        })))
        box_plot_visual = optional(list(object({
          visual_id
          actions
          column_hierarchies
          subtitle
          title
          chart_configuration = optional(list(object({
            box_plot_options = optional(list(object({
              all_data_points_visibility
              outlier_visibility
              style_options  = optional(list(object({
                fill_style = optional(string)
              })))
            })))
            category_axis
            category_label_options
            field_wells = optional(list(object({
              box_plot_aggregated_field_wells = optional(list(object({
                group_by
                values
              })))
            })))
            legend
            primary_y_axis_display_options
            primary_y_axis_label_options
            reference_lines
            sort_configuration = optional(list(object({
              category_sort
              pagination_configuration
            })))
            tooltip
            visual_palette
          })))
        })))
        combo_chart_visual = optional(list(object({
          visual_id
          actions
          column_hierarchies
          subtitle
          title
          chart_configuration = optional(list(object({
            bar_data_labels
            bars_arrangement
            category_axis
            category_label_options
            color_label_options
            field_wells = optional(list(object({
              combo_chart_aggregated_field_wells = optional(list(object({
                bar_values
                category
                colors
                line_values
              })))
            }))) 
            legend
            line_data_labels
            primary_y_axis_display_options
            primary_y_axis_label_options
            reference_lines
            secondary_y_axis_display_options
            secondary_y_axis_label_options
            sort_configuration = optional(list(object({
              category_items_limit
              category_sort
              color_items_limit
              color_sort 
            })))
            tooltip
            visual_palette
          })))
        })))
        custom_content_visual = optional(list(object({
          data_set_identifier
          visual_id
          actions
          subtitle
          title
          chart_configuration = optional(list(object({
            content_type
            content_url
            image_scaling
          })))
        })))
        empty_visual = optional(list(object({
          data_set_identifier
          visual_id
          actions
        })))
        filled_map_visual = optional(list(object({
          visual_id
          actions
          column_hierarchies
          subtitle
          title
          chart_configuration = optional(list(object({
            field_wells = optional(list(object({
              filled_map_aggregated_field_wells = optional(list(object({
                geospatial
                values
              })))
            })))
            legend
            map_style_options
            sort_configuration = optional(list(object({
              category_sort
            })))
            tooltip
            window_options
          })))
          conditional_formatting = optional(list(object({
            conditional_formatting_options = list(object({
              shape = list(object({
                field_id
                format = optional(list(object({
                  background_color
                })))
              }))
            }))
          })))
        })))
        funnel_chart_visual = optional(list(object({
          visual_id
          actions
          column_hierarchies
          subtitle
          title
          chart_configuration = optional(list(object({
            category_label_options
            data_label_options = optional(list(object({
              category_label_visibility
              label_color
              label_font_configuration
              measure_data_label_style
              measure_label_visibility
              position
              visibility
            })))
            field_wells = optional(list(object({
              funnel_chart_aggregated_field_wells = optional(list(object({
                category
                values
              })))
            })))
            sort_configuration = optional(list(object({
              category_items_limit
              category_sort
            })))
            tooltip
            value_label_options
            visual_palette
          })))
        })))
        gauge_chart_visual = optional(list(object({
          visual_id
          actions
          subtitle
          title
          chart_configuration = optional(list(object({
            data_labels
            field_wells = optional(list(object({
              target_values
              values
            }))) 
            gauge_chart_options = optional(list(object({
              arc = optional(list(object({
                arc_angle
                arc_thickness
              })))
              arc_axis = optional(list(object({
                range = optional(list(object({
                  max
                  min
                })))
                reserve_range = optional(number)
              })))
              comparison
              primary_value_display_type
              primary_value_font_configuration
            })))
            tooltip
            visual_palette
          })))
          conditional_formatting = optional(list(object({
            conditional_formatting_options = optional(list(object({
              arc = optional(list(object({
                foreground_color
              })))
              primary_value = optional(list(object({
                icon
                text_color
              })))
            })))
          })))
        })))
        geospatial_map_visual = optional(list(object({
          visual_id
          actions
          column_hierarchies
          subtitle
          title
          chart_configuration = optional(list(object({
            field_wells = optional(list(object({
              geospatial_map_aggregated_field_wells = optional(list(object({
                colors
                geospatial
                values
              })))
            }))) 
            legend
            map_style_options
            point_style_options = optional(list(object({
              selected_point_style = optional(string)
              cluster_marker_configuration = optional(list(object({
                cluster_marker = optional(list(object({
                  simple_cluster_marker = optional(list(object({
                    color = optional(string)
                  })))
                })))
              })))
            })))
            tooltip
            visual_palette
            window_options
          })))
        })))
        heat_map_visual = optional(list(object({
          visual_id
          actions
          column_hierarchies
          subtitle
          title
          chart_configuration = optional(list(object({
            color_scale
            column_label_options
            data_labels
            field_wells = optional(list(object({
              heat_map_aggregated_field_wells = optional(list(object({
                columns
                rows
                values
              })))
            })))
            legend
            row_label_options
            sort_configuration = optional(list(object({
              heat_map_column_items_limit_configuration
              heat_map_column_sort
              heat_map_row_items_limit_configuration
              heat_map_row_sort
            })))
            tooltip
          }))) 
        })))
        histogram_visual = optional(list(object({
          visual_id
          actions
          subtitle
          title
          chart_configuration = optional(list(object({
            bin_options = optional(list(object({
              selected_bin_type = optional(string)
              start_value       = optional(number)
              bin_count = optional(list(object({
                value = optional(number)
              })))
              bin_width = optional(list(object({
                bin_count_limit = optional(number)
                value           = optional(number)  
              })))
            })))          
            data_labels
            field_wells = optional(list(object({
              histogram_aggregated_field_wells = optional(list(object({
                values
              })))
            })))
            tooltip
            visual_palette
            x_axis_display_options
            x_axis_label_options
            y_axis_display_options
          })))
        })))
        insight_visual = optional(list(object({

        })))
        kpi_visual = optional(list(object({


        })))
        line_chart_visual = optional(list(object({


        })))
        pie_chart_visual = optional(list(object({


        })))
        pivot_table_visual = optional(list(object({


        })))
        radar_chart_visual = optional(list(object({


        })))
        sankey_diagram_visual = optional(list(object({



        })))
        scatter_plot_visual = optional(list(object({



        })))
        table_visual = optional(list(object({


        })))
        tree_map_visual = optional(list(object({


        })))
        waterfall_visual = optional(list(object({


        })))
        word_cloud_visual = optional(list(object({


        })))
      })))
      text_boxes            = optional(list(object({
        sheet_text_box_id = string
        content           = optional(string)
      })))
    })))
  })))
  default    = []
}
variable "quicksight_template_permissions" {
  description = "A set of resource permissions on the template"
  type        = list(object({
    actions   = list(string)
    principal = string
  }))
  default = []
}
variable "quicksight_template_source_entity" {
  description = "The entity that you are using as a source when you create the template (analysis or template). Only one of definition or source_entity should be configured"
  type        = list(object({
    source_analysis = optional(list(object({
      arn                 = string
      data_set_references = list(object({
        data_set_arn         = string
        data_set_placeholder = string
      }))
    })))
    source_template = optional(list(object({
      arn = string
    })))
  }))
  default     = []
}
