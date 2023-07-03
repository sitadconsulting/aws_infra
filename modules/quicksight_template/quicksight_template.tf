#################################################################
# PLEASE DO NOT USE THIS MODULE AS IT IS UNDER CONSTRUCTION
#
#################################################################
resource "aws_quicksight_template" "quicksight_template" {
  aws_account_id      = var.quicksight_template_aws_account_id
  name                = var.quicksight_template_name
  template_id         = var.quicksight_template_template_id
  version_description = var.quicksight_template_version_description
  tags                = var.quicksight_template_tags

  dynamic "definition" {
    for_each = var.quicksight_template_definition
      content {
        dynamic "data_set_configuration" {
          for_each = definition.value.data_set_configuration
            content {
              placeholder = data_set_configuration.value["placeholder"]
              dynamic "column_group_schema_list" {
                for_each = data_set_configuration.value.column_group_schema_list
                  content {
                    name = column_group_schema_list.value["name"]
                    dynamic "column_group_column_schema_list" {
                      for_each = column_group_schema_list.value.column_group_column_schema_list
                        content {
                          name = column_group_column_schema_list.value["name"]
                        }
                    }
                  }
              }
              dynamic "data_set_schema" {
                for_each = column_group_schema_list.value.data_set_schema
                  content {
                    dynamic "column_schema_list" {
                      for_each = data_set_schema.value.column_schema_list
                        content {
                          data_type       = column_schema_list.value["data_type"]
                          geographic_role = column_schema_list.value["geographic_role"]
                          name            = column_schema_list.value["name"]
                        }
                    }
                  }
              }
            }
        }
        dynamic "analysis_defaults" {
          for_each = definition.value.analysis_defaults
            content {
              dynamic "default_new_sheet_configuration" {
                for_each = analysis_defaults.value.default_new_sheet_configuration
                  content {
                    sheet_content_type = default_new_sheet_configuration.value["sheet_content_type"]
                    dynamic "interactive_layout_configuration" {
                      for_each = default_new_sheet_configuration.value.interactive_layout_configuration
                        content {
                          dynamic "free_form" {
                            for_each = interactive_layout_configuration.value.free_form
                              content {
                                dynamic "canvas_size_options" {
                                  for_each = free_form.value.canvas_size_options
                                    content {
                                      dynamic "screen_canvas_size_options" {
                                        for_each = canvas_size_options.value.screen_canvas_size_options
                                          content {
                                            optimized_view_port_width = screen_canvas_size_options.value["optimized_view_port_width"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "grid" {
                            for_each = interactive_layout_configuration.value.grid
                              content {
                                dynamic "canvas_size_options" {
                                  for_each = grid.value.canvas_size_options
                                    content {
                                      dynamic "screen_canvas_size_options" {
                                        for_each = canvas_size_options.value.screen_canvas_size_options
                                          content {
                                            optimized_view_port_width = screen_canvas_size_options.value["optimized_view_port_width"]
                                            resize_option             = screen_canvas_size_options.value["resize_option"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "paginated_layout_configuration" {
                      for_each = default_new_sheet_configuration.value.paginated_layout_configuration
                        content {
                          dynamic "section_based" {
                            for_each = paginated_layout_configuration.value.section_based
                              content {
                                dynamic "canvas_size_options" {
                                  for_each = section_based.value.canvas_size_options
                                    content {
                                      dynamic "paper_canvas_size_options" {
                                        for_each = canvas_size_options.value.paper_canvas_size_options
                                          content {
                                            paper_margin      = paper_canvas_size_options.value["paper_margin"]
                                            paper_orientation = paper_canvas_size_options.value["paper_orientation"]
                                            paper_size        = paper_canvas_size_options.value["paper_size"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "calculated_fields" {
          for_each = definition.value.calculated_fields
            content {
              data_set_identifier = calculated_fields.value["data_set_identifier"]
              expression          = calculated_fields.value["expression"]
              name                = calculated_fields.value["name"]
            }
        }
        dynamic "column_configurations" {
          for_each = definition.value.column_configurations
            content {
              role = column_configurations.value["role"]
              dynamic "column" {
                for_each = column_configurations.value.column
                  content {
                    column_name         = column.value["column_name"]
                    data_set_identifier = column.value["data_set_identifier"]
                  }
              }
              dynamic "format_configuration" {
                for_each = column_configurations.value.format_configuration
                  content {
                    dynamic "date_time_format_configuration" {
                      for_each = format_configuration.value.date_time_format_configuration
                        content {
                          date_time_format = date_time_format_configuration.value["date_time_format"]
                          dynamic "null_value_format_configuration" {
                            for_each = date_time_format_configuration.value.null_value_format_configuration
                              content {
                                null_string = null_value_format_configuration.value["null_string"]
                              }
                          }  
                          dynamic "numeric_format_configuration" {
                            for_each = date_time_format_configuration.value.numeric_format_configuration
                              content {
                                dynamic "currency_display_format_configuration" {
                                  for_each = numeric_format_configuration.value.currency_display_format_configuration
                                    content {
                                      number_scale = currency_display_format_configuration.value["number_scale"]
                                      prefix       = currency_display_format_configuration.value["prefix"]
                                      suffix       = currency_display_format_configuration.value["suffix"]
                                      symbol       = currency_display_format_configuration.value["symbol"]
                                      dynamic "decimal_places_configuration" {
                                        for_each = currency_display_format_configuration.value.decimal_places_configuration
                                          content {
                                            decimal_places = decimal_places_configuration.value["decimal_places"]
                                          }
                                      } 
                                      dynamic "negative_value_configuration" {
                                        for_each = currency_display_format_configuration.value.negative_value_configuration
                                          content {
                                            display_mode = negative_value_configuration.value["display_mode"]
                                          }
                                      }
                                      dynamic "null_value_format_configuration" {
                                        for_each = currency_display_format_configuration.value.null_value_format_configuration
                                          content {
                                            null_string = null_value_format_configuration.value["null_string"]
                                          }
                                      }
                                      dynamic "separator_configuration" {
                                        for_each = currency_display_format_configuration.value.separator_configuration
                                          content {
                                            decimal_separator = separator_configuration.value["decimal_separator"]
                                            dynamic "thousands_separator" {
                                              for_each = separator_configuration.value.thousands_separator
                                                content {
                                                  symbol     = thousands_separator.value["symbol"]
                                                  visibility = thousands_separator.value["visibility"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "number_display_format_configuration" {
                                  for_each = numeric_format_configuration.value.number_display_format_configuration
                                    content {
                                      number_scale = number_display_format_configuration.value["number_scale"]
                                      prefix       = number_display_format_configuration.value["prefix"]
                                      suffix       = number_display_format_configuration.value["suffix"]
                                      dynamic "decimal_places_configuration" {
                                        for_each = number_display_format_configuration.value.decimal_places_configuration
                                          content {
                                            decimal_places = decimal_places_configuration.value["decimal_places"]
                                          }
                                      }
                                      dynamic "negative_value_configuration" {
                                        for_each = number_display_format_configuration.value.negative_value_configuration
                                          content {
                                            display_mode = negative_value_configuration.value["display_mode"]
                                          }
                                      }
                                      dynamic "null_value_format_configuration" {
                                        for_each = number_display_format_configuration.value.null_value_format_configuration
                                          content {
                                            null_string = null_value_format_configuration.value["null_string"]
                                          }
                                      }
                                      dynamic "separator_configuration" {
                                        for_each = number_display_format_configuration.value.separator_configuration
                                          content {
                                            decimal_separator = separator_configuration.value["decimal_separator"]
                                            dynamic "thousands_separator" {
                                              for_each = separator_configuration.value.thousands_separator
                                                content {
                                                  symbol     = thousands_separator.value["symbol"]
                                                  visibility = thousands_separator.value["visibility"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "percentage_display_format_configuration" {
                                  for_each = numeric_format_configuration.value.percentage_display_format_configuration
                                    content {
                                      prefix = percentage_display_format_configuration.value["prefix"]
                                      suffix = percentage_display_format_configuration.value["suffix"]
                                      dynamic "decimal_places_configuration" {
                                        for_each = percentage_display_format_configuration.value.decimal_places_configuration
                                          content {
                                            decimal_places = decimal_places_configuration.value["decimal_places"]
                                          }
                                      }
                                      dynamic "negative_value_configuration" {
                                        for_each = percentage_display_format_configuration.value.negative_value_configuration
                                          content {
                                            display_mode = negative_value_configuration.value["display_mode"]
                                          }
                                      }
                                      dynamic "null_value_format_configuration" {
                                        for_each = percentage_display_format_configuration.value.null_value_format_configuration
                                          content {
                                            null_string = null_value_format_configuration.value["null_string"]
                                          }
                                      }
                                      dynamic "separator_configuration" {
                                        for_each = percentage_display_format_configuration.value.separator_configuration
                                          content {
                                            decimal_separator = separator_configuration.value["decimal_separator"]
                                            dynamic "thousands_separator" {
                                              for_each = separator_configuration.value.thousands_separator
                                                content {
                                                  symbol     = thousands_separator.value["symbol"]
                                                  visibility = thousands_separator.value["visibility"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "number_format_configuration" {
                      for_each = format_configuration.value.number_format_configuration
                        content {
                          dynamic "numeric_format_configuration" {
                            for_each = number_format_configuration.value.numeric_format_configuration
                              content {
                                dynamic "currency_display_format_configuration" {
                                  for_each = numeric_format_configuration.value.currency_display_format_configuration
                                    content {
                                      number_scale = currency_display_format_configuration.value["number_scale"]
                                      prefix       = currency_display_format_configuration.value["prefix"]
                                      suffix       = currency_display_format_configuration.value["suffix"]
                                      symbol       = currency_display_format_configuration.value["symbol"]
                                      dynamic "decimal_places_configuration" {
                                        for_each = currency_display_format_configuration.value.decimal_places_configuration
                                          content {
                                            decimal_places = decimal_places_configuration.value["decimal_places"]
                                          }
                                      }
                                      dynamic "negative_value_configuration" {
                                        for_each = currency_display_format_configuration.value.negative_value_configuration
                                          content {
                                            display_mode = negative_value_configuration.value["display_mode"]
                                          }
                                      }
                                      dynamic "null_value_format_configuration" {
                                        for_each = currency_display_format_configuration.value.null_value_format_configuration
                                          content {
                                            null_string = null_value_format_configuration.value["null_string"]
                                          }
                                      }
                                      dynamic "separator_configuration" {
                                        for_each = currency_display_format_configuration.value.separator_configuration
                                          content {
                                            decimal_separator = separator_configuration.value["decimal_separator"]
                                            dynamic "thousands_separator" {
                                              for_each = separator_configuration.value.thousands_separator
                                                content {
                                                  symbol     = thousands_separator.value["symbol"]
                                                  visibility = thousands_separator.value["visibility"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                } 
                                dynamic "number_display_format_configuration" {
                                  for_each = numeric_format_configuration.value.number_display_format_configuration
                                    content {
                                      number_scale = number_display_format_configuration.value["number_scale"]
                                      prefix       = number_display_format_configuration.value["prefix"]
                                      suffix       = number_display_format_configuration.value["suffix"]
                                      dynamic "decimal_places_configuration" {
                                        for_each = number_display_format_configuration.value.decimal_places_configuration
                                          content {
                                            decimal_places = decimal_places_configuration.value["decimal_places"]
                                          }
                                      }
                                      dynamic "negative_value_configuration" {
                                        for_each = number_display_format_configuration.value.negative_value_configuration
                                          content {
                                            display_mode = negative_value_configuration.value["display_mode"]
                                          }
                                      }
                                      dynamic "null_value_format_configuration" {
                                        for_each = number_display_format_configuration.value.null_value_format_configuration
                                          content {
                                            null_string = null_value_format_configuration.value["null_string"]
                                          }
                                      }
                                      dynamic "separator_configuration" {
                                        for_each = number_display_format_configuration.value.separator_configuration
                                          content {
                                            decimal_separator = separator_configuration.value["decimal_separator"]
                                            dynamic "thousands_separator" {
                                              for_each = separator_configuration.value.thousands_separator
                                                content {
                                                  symbol     = thousands_separator.value["symbol"]
                                                  visibility = thousands_separator.value["visibility"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "percentage_display_format_configuration" {
                                  for_each = numeric_format_configuration.value.percentage_display_format_configuration
                                    content {
                                      prefix = percentage_display_format_configuration.value["prefix"]
                                      suffix = percentage_display_format_configuration.value["suffix"]
                                      dynamic "decimal_places_configuration" {
                                        for_each = percentage_display_format_configuration.value.decimal_places_configuration
                                          content {
                                            decimal_places = decimal_places_configuration.value["decimal_places"]
                                          }
                                      }
                                      dynamic "negative_value_configuration" {
                                        for_each = percentage_display_format_configuration.value.negative_value_configuration
                                          content {
                                            display_mode = negative_value_configuration.value["display_mode"]
                                          }
                                      }
                                      dynamic "null_value_format_configuration" {
                                        for_each = percentage_display_format_configuration.value.null_value_format_configuration
                                          content {
                                            null_string = null_value_format_configuration.value["null_string"]
                                          }
                                      }
                                      dynamic "separator_configuration" {
                                        for_each = percentage_display_format_configuration.value.separator_configuration
                                          content {
                                            decimal_separator = separator_configuration.value["decimal_separator"]
                                            dynamic "thousands_separator" {
                                              for_each = separator_configuration.value.thousands_separator
                                                content {
                                                  symbol     = thousands_separator.value["symbol"]
                                                  visibility = thousands_separator.value["visibility"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "string_format_configuration" {
                      for_each = format_configuration.value.string_format_configuration
                        content {
                          dynamic "null_value_format_configuration" {
                            for_each = string_format_configuration.value.null_value_format_configuration
                              content {
                                null_string = null_value_format_configuration.value["null_string"]
                              }
                          }
                          dynamic "numeric_format_configuration" {
                            for_each = string_format_configuration.value.numeric_format_configuration
                              content {
                                dynamic "currency_display_format_configuration" {
                                  for_each = numeric_format_configuration.value.currency_display_format_configuration
                                    content {
                                      prefix = currency_display_format_configuration.value["prefix"]
                                      suffix = currency_display_format_configuration.value["suffix"]
                                      symbol = currency_display_format_configuration.value["symbol"]
                                      dynamic "decimal_places_configuration" {
                                        for_each = currency_display_format_configuration.value.decimal_places_configuration
                                          content {
                                            decimal_places = decimal_places_configuration.value["decimal_places"]
                                          }
                                      }
                                      dynamic "negative_value_configuration" {
                                        for_each = currency_display_format_configuration.value.negative_value_configuration
                                          content {
                                            display_mode = negative_value_configuration.value["display_mode"]
                                          }
                                      }
                                      dynamic "null_value_format_configuration" {
                                        for_each = currency_display_format_configuration.value.null_value_format_configuration
                                          content {
                                            null_string = null_value_format_configuration.value["null_string"]
                                          }
                                      }
                                      dynamic "separator_configuration" {
                                        for_each = currency_display_format_configuration.value.separator_configuration
                                          content {
                                            decimal_separator = separator_configuration.value["decimal_separator"]
                                            dynamic "thousands_separator" {
                                              for_each = separator_configuration.value.thousands_separator
                                                content {
                                                  symbol     = thousands_separator.value["symbol"]
                                                  visibility = thousands_separator.value["visibility"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "number_display_format_configuration" {
                                  for_each = numeric_format_configuration.value.number_display_format_configuration
                                    content {
                                      number_scale = number_display_format_configuration.value["number_scale"]
                                      prefix       = number_display_format_configuration.value["prefix"]
                                      suffix       = number_display_format_configuration.value["suffix"]
                                      dynamic "decimal_places_configuration" {
                                        for_each = number_display_format_configuration.value.decimal_places_configuration
                                          content {
                                            decimal_places = decimal_places_configuration.value["decimal_places"]
                                          }
                                      }
                                      dynamic "negative_value_configuration" {
                                        for_each = number_display_format_configuration.value.negative_value_configuration
                                          content {
                                            display_mode = negative_value_configuration.value["display_mode"]
                                          }
                                      }
                                      dynamic "null_value_format_configuration" {
                                        for_each = number_display_format_configuration.value.null_value_format_configuration
                                          content {
                                            null_string = null_value_format_configuration.value["null_string"]
                                          }
                                      }
                                      dynamic "separator_configuration" {
                                        for_each = number_display_format_configuration.value.separator_configuration
                                          content {
                                            decimal_separator = separator_configuration.value["decimal_separator"]
                                            dynamic "thousands_separator" {
                                              for_each = separator_configuration.value.thousands_separator
                                                content {
                                                  symbol     = thousands_separator.value["symbol"]
                                                  visibility = thousands_separator.value["visibility"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "percentage_display_format_configuration" {
                                  for_each = numeric_format_configuration.value.percentage_display_format_configuration
                                    content {
                                      prefix = percentage_display_format_configuration.value["prefix"]
                                      suffix = percentage_display_format_configuration.value["suffix"]
                                      dynamic "decimal_places_configuration"  {
                                        for_each = percentage_display_format_configuration.value.decimal_places_configuration
                                          content {
                                            decimal_places = decimal_places_configuration.value["decimal_places"]
                                          }
                                      }
                                      dynamic "negative_value_configuration" {
                                        for_each = percentage_display_format_configuration.value.negative_value_configuration
                                          content {
                                            display_mode = negative_value_configuration.value["display_mode"]
                                          }
                                      }
                                      dynamic "null_value_format_configuration" {
                                        for_each = percentage_display_format_configuration.value.null_value_format_configuration
                                          content {
                                            null_string = null_value_format_configuration.value["null_string"]
                                          }
                                      }
                                      dynamic "separator_configuration" {
                                        for_each = percentage_display_format_configuration.value.separator_configuration
                                          content {
                                            decimal_separator = separator_configuration.value["decimal_separator"]
                                            dynamic "thousands_separator" {
                                              for_each = separator_configuration.value.thousands_separator
                                                content {
                                                  symbol     = thousands_separator.value["symbol"]
                                                  visibility = thousands_separator.value["visibility"]
                                                }
                                            }
                                          } 
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "filter_groups" {
          for_each = definition.value.filter_groups
            content {
              cross_dataset   = filter_groups.value["cross_dataset"]
              filter_group_id = filter_groups.value["filter_group_id"]
              status          = filter_groups.value["status"]
              dynamic "filters" {
                for_each = filter_groups.value.filters
                  content {
                    dynamic "category_filter" {
                      for_each = filters.value.category_filter
                        content {
                          filter_id = category_filter.value["filter_id"]
                          dynamic "column" {
                            for_each = category_filter.value.column
                              content {
                                column_name         = column.value["column_name"]
                                data_set_identifier = column.value["data_set_identifier"]
                              }
                          }
                          dynamic "configuration" {
                            for_each = category_filter.value.configuration
                              content {
                                dynamic "custom_filter_configuration" {
                                  for_each = configuration.value.custom_filter_configuration
                                    content {
                                      match_operator     = custom_filter_configuration.value["match_operator"]
                                      null_option        = custom_filter_configuration.value["null_option"]
                                      category_value     = custom_filter_configuration.value["category_value"]
                                      parameter_name     = custom_filter_configuration.value["parameter_name"]
                                      select_all_options = custom_filter_configuration.value["select_all_options"]
                                    }
                                }
                                dynamic "custom_filter_list_configuration" {
                                  for_each = configuration.value.custom_filter_list_configuration
                                    content {
                                      match_operator     = custom_filter_list_configuration.value["match_operator"]
                                      null_option        = custom_filter_list_configuration.value["null_option"]
                                      category_values    = custom_filter_list_configuration.value["category_values"]
                                      select_all_options = custom_filter_list_configuration.value["select_all_options"]
                                    }
                                }
                                dynamic "filter_list_configuration" {
                                  for_each = configuration.value.filter_list_configuration
                                    content {
                                      match_operator     = filter_list_configuration.value["match_operator"]
                                      category_values    = filter_list_configuration.value["category_values"]
                                      select_all_options = filter_list_configuration.value["select_all_options"]
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "numeric_equality_filter" {
                      for_each = filters.value.numeric_equality_filter
                        content {
                          filter_id          = numeric_equality_filter.value["filter_id"]
                          match_operator     = numeric_equality_filter.value["match_operator"]
                          null_option        = numeric_equality_filter.value["null_option"]
                          parameter_name     = numeric_equality_filter.value["parameter_name"]
                          select_all_options = numeric_equality_filter.value["select_all_options"]
                          value              = numeric_equality_filter.value["value"]
                          dynamic "column" {
                            for_each = numeric_equality_filter.value.column
                              content {
                                column_name         = column.value["column_name"]
                                data_set_identifier = column.value["data_set_identifier"]
                              }
                          }
                          dynamic "aggregation_function" {
                            for_each = numeric_equality_filter.value.aggregation_function
                              content {
                                categorical_aggregation_function = aggregation_function.value["categorical_aggregation_function"]
                                date_aggregation_function        = aggregation_function.value["date_aggregation_function"]
                                dynamic "numerical_aggregation_function" {
                                  for_each = aggregation_function.value.numerical_aggregation_function
                                    content {
                                      simple_numerical_aggregation = numerical_aggregation_function.value["simple_numerical_aggregation"]
                                      dynamic "percentile_aggregation" {
                                        for_each = numerical_aggregation_function.value.percentile_aggregation
                                          content {
                                            percentile_value = percentile_aggregation.value["percentile_value"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }                       
                    }
                    dynamic "numeric_range_filter" {
                      for_each = filters.value.numeric_range_filter
                        content {
                          filter_id          = numeric_range_filter.value["filter_id"]
                          null_option        = numeric_range_filter.value["null_option"]
                          include_maximum    = numeric_range_filter.value["include_maximum"]
                          include_minimum    = numeric_range_filter.value["include_minimum"]
                          select_all_options = numeric_range_filter.value["select_all_options"]
                          dynamic "column" {
                            for_each = numeric_range_filter.value.column
                              content {
                                column_name         = column.value["column_name"]
                                data_set_identifier = column.value["data_set_identifier"]
                              }
                          }
                          dynamic "aggregation_function" {
                            for_each = numeric_range_filter.value.aggregation_function
                              content {
                                categorical_aggregation_function = aggregation_function.value["categorical_aggregation_function"]
                                date_aggregation_function        = aggregation_function.value["date_aggregation_function"]
                                dynamic "numerical_aggregation_function" {
                                  for_each = aggregation_function.value.numerical_aggregation_function
                                    content {
                                      simple_numerical_aggregation = numerical_aggregation_function.value["simple_numerical_aggregation"]
                                      dynamic "percentile_aggregation" {
                                        for_each = numerical_aggregation_function.value.percentile_aggregation
                                          content {
                                            percentile_value = percentile_aggregation.value["percentile_value"] 
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "range_maximum" {
                            for_each = numeric_range_filter.value.range_maximum
                              content {
                                parameter    = range_maximum.value["parameter"]
                                static_value = range_maximum.value["static_value"]
                              }
                          }
                          dynamic "range_minimum" {
                            for_each = numeric_range_filter.value.range_minimum
                              content {
                                parameter    = range_maximum.value["parameter"]
                                static_value = range_maximum.value["static_value"]
                              }
                          }
                        }
                    }
                    dynamic "relative_dates_filter" {
                      for_each = filters.value.relative_dates_filter
                        content {
                          filter_id           = relative_dates_filter.value["filter_id"]
                          null_option         = relative_dates_filter.value["null_option"]
                          relative_date_type  = relative_dates_filter.value["relative_date_type"]
                          time_granularity    = relative_dates_filter.value["time_granularity"]
                          minimum_granularity = relative_dates_filter.value["minimum_granularity"]
                          parameter_name      = relative_dates_filter.value["parameter_name"]
                          relative_date_value = relative_dates_filter.value["relative_date_value"]
                          dynamic "anchor_date_configuration" {
                            for_each = relative_dates_filter.value.anchor_date_configuration
                              content {
                                anchor_option  = anchor_date_configuration.value["anchor_option"]
                                parameter_name = anchor_date_configuration.value["parameter_name"]
                              }
                          }
                          dynamic "column" {
                            for_each = relative_dates_filter.value.column
                              content {
                                column_name         = column.value["column_name"]
                                data_set_identifier = column.value["data_set_identifier"]
                              }
                          }
                          dynamic "exclude_period_configuration" {
                            for_each = relative_dates_filter.value.exclude_period_configuration
                              content {
                                amount      = exclude_period_configuration.value["amount"]
                                granularity = exclude_period_configuration.value["granularity"]
                                status      = exclude_period_configuration.value["status"]
                              }
                          }
                        }
                    }
                    dynamic "time_equality_filter" {
                      for_each = filters.value.time_equality_filter
                        content {
                          filter_id        = time_equality_filter.value["filter_id"]
                          time_granularity = time_equality_filter.value["time_granularity"]
                          parameter_name   = time_equality_filter.value["parameter_name"]
                          value            = time_equality_filter.value["value"]
                          dynamic "column" {
                            for_each = time_equality_filter.value.column
                              content {
                                column_name         = column.value["column_name"]
                                data_set_identifier = column.value["data_set_identifier"]
                              }
                          }
                        }
                    }
                    dynamic "time_range_filter" {
                      for_each = filters.value.time_range_filter
                        content {
                          filter_id        = time_range_filter.value["filter_id"]
                          null_option      = time_range_filter.value["null_option"]
                          include_maximum  = time_range_filter.value["include_maximum"]
                          include_minimum  = time_range_filter.value["include_minimum"]
                          time_granularity = time_range_filter.value["time_granularity"]
                          dynamic "column" {
                            for_each = time_range_filter.value.column
                              content {
                                column_name         = column.value["column_name"]
                                data_set_identifier = column.value["data_set_identifier"]
                              }
                          }
                          dynamic "exclude_period_configuration" {
                            for_each = time_range_filter.value.exclude_period_configuration
                              content {
                                amount      = exclude_period_configuration.value["amount"]
                                granularity = exclude_period_configuration.value["granularity"]
                                status      = exclude_period_configuration.value["status"]
                              }
                          }
                          dynamic "range_maximum_value" {
                            for_each = time_range_filter.value.range_maximum_value
                              content {
                                parameter    = range_maximum.value["parameter"]
                                static_value = range_maximum.value["static_value"]
                              }
                          }
                          dynamic "range_minimum_value" {
                            for_each = time_range_filter.value.range_minimum_value
                              content {
                                parameter    = range_maximum.value["parameter"]
                                static_value = range_maximum.value["static_value"]
                              }
                          }
                        }
                    }
                    dynamic "top_bottom_filter" {
                      for_each = filters.value.top_bottom_filter
                        content {
                          filter_id        = top_bottom_filter.value["filter_id"]
                          limit            = top_bottom_filter.value["limit"]
                          parameter_name   = top_bottom_filter.value["parameter_name"]
                          time_granularity = top_bottom_filter.value["time_granularity"]
                          dynamic "aggregation_sort_configuration" {
                            for_each = top_bottom_filter.value.aggregation_sort_configuration
                              content {
                                sort_direction = aggregation_sort_configuration.value["sort_direction"]
                                dynamic "aggregation_function" {
                                  for_each = aggregation_sort_configuration.value.aggregation_function
                                    content {
                                      categorical_aggregation_function = aggregation_function.value["categorical_aggregation_function"]
                                      date_aggregation_function        = aggregation_function.value["date_aggregation_function"]
                                      dynamic "numerical_aggregation_function" {
                                        for_each = aggregation_function.value.numerical_aggregation_function
                                          content {
                                            simple_numerical_aggregation = numerical_aggregation_function.value["simple_numerical_aggregation"]
                                            dynamic "percentile_aggregation" {
                                              for_each = numerical_aggregation_function.value.percentile_aggregation
                                                content {
                                                  percentile_value = percentile_aggregation.value["percentile_value"] 
                                                }
                                            }
                                          } 
                                      } 
                                    }
                                }
                                dynamic "column" {
                                  for_each = aggregation_sort_configuration.value.column
                                    content {
                                      column_name         = column.value["column_name"]
                                      data_set_identifier = column.value["data_set_identifier"]
                                    }
                                } 
                              }
                          }
                          dynamic "column" {
                            for_each = top_bottom_filter.value.column
                              content {
                                column_name         = column.value["column_name"]
                                data_set_identifier = column.value["data_set_identifier"]
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "scope_configuration" {
                for_each = filter_groups.value.scope_configuration
                  content {
                    dynamic "selected_sheets" {
                      for_each = scope_configuration.value.selected_sheets
                        content {
                          dynamic "sheet_visual_scoping_configurations" {
                            for_each = selected_sheets.value.sheet_visual_scoping_configurations
                              content {
                                scope      = sheet_visual_scoping_configurations.value["scope"]
                                sheet_id   = sheet_visual_scoping_configurations.value["sheet_id"]
                                visual_ids = sheet_visual_scoping_configurations.value["visual_ids"]
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "parameters_declarations" {
          for_each = definition.value.parameters_declarations
            content {
              dynamic "date_time_parameter_declaration" {
                for_each = parameters_declarations.value.date_time_parameter_declaration
                  content {
                    name             = date_time_parameter_declaration.value["name"]
                    time_granularity = date_time_parameter_declaration.value["time_granularity"]
                    dynamic "default_values" {
                      for_each = date_time_parameter_declaration.value.default_values
                        content {
                          static_values = default_values.value["static_values"]
                          dynamic "dynamic_value" {
                            for_each = default_values.value.dynamic_value
                              content {
                                dynamic "default_value_column" {
                                  for_each = dynamic_value.value.default_value_column
                                    content {
                                      column_name         = default_value_column.value["column_name"]
                                      data_set_identifier = default_value_column.value["data_set_identifier"]
                                    }
                                }
                                dynamic "group_name_column" {
                                  for_each = dynamic_value.value.group_name_column
                                    content {
                                      column_name         = group_name_column.value["column_name"]
                                      data_set_identifier = group_name_column.value["data_set_identifier"]
                                    }
                                }
                                dynamic "user_name_column" {
                                  for_each = dynamic_value.value.user_name_column
                                    content {
                                      column_name         = user_name_column.value["column_name"]
                                      data_set_identifier = user_name_column.value["data_set_identifier"]
                                    }
                                }
                              }
                          }
                          dynamic "rolling_date" {
                            for_each = default_values.value.rolling_date
                              content {
                                data_set_identifier = rolling_date.value["data_set_identifier"]
                                expression          = rolling_date.value["expression"]
                              }
                          }
                        }
                    }
                    dynamic "values_when_unset" {
                      for_each = date_time_parameter_declaration.value.values_when_unset
                        content {
                          custom_value            = values_when_unset.value["custom_value"]
                          value_when_unset_option = values_when_unset.value["value_when_unset_option"]
                        }
                    }
                  }
              }
              dynamic "decimal_parameter_declaration" {
                for_each = parameters_declarations.value.decimal_parameter_declaration
                  content {
                    name
                    parameter_value_type
                    dynamic "default_values" {
                      for_each = decimal_parameter_declaration.value.default_values
                        content {
                          static_values = default_values.value["static_values"]
                          dynamic "dynamic_value" {
                            for_each = default_values.value.dynamic_value
                              content {
                                dynamic "default_value_column" {
                                  for_each = dynamic_value.value.default_value_column
                                    content {
                                      column_name         = default_value_column.value["column_name"]
                                      data_set_identifier = default_value_column.value["data_set_identifier"]
                                    }
                                }
                                dynamic "group_name_column" {
                                  for_each = dynamic_value.value.group_name_column
                                    content {
                                      column_name         = group_name_column.value["column_name"]
                                      data_set_identifier = group_name_column.value["data_set_identifier"]
                                    }
                                }
                                dynamic "user_name_column" {
                                  for_each = dynamic_value.value.user_name_column
                                    content {
                                      column_name         = user_name_column.value["column_name"]
                                      data_set_identifier = user_name_column.value["data_set_identifier"]
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "values_when_unset" {
                      for_each =  decimal_parameter_declaration.value.values_when_unset
                        content {
                          custom_value            = values_when_unset.value["custom_value"]
                          value_when_unset_option = values_when_unset.value["value_when_unset_option"]
                        }
                    }
                  }
              }
              dynamic "integer_parameter_declaration" {
                for_each = parameters_declarations.value.integer_parameter_declaration
                  content {
                    name                 = integer_parameter_declaration.value["name"]
                    parameter_value_type = integer_parameter_declaration.value["parameter_value_type"]
                    dynamic "default_values" {
                      for_each = integer_parameter_declaration.value.default_values
                        content {
                          static_values = default_values.value["static_values"]
                          dynamic "dynamic_value" {
                            for_each = default_values.value.dynamic_value
                              content {
                                dynamic "default_value_column" {
                                  for_each = dynamic_value.value.default_value_column
                                    content {
                                      column_name         = default_value_column.value["column_name"]
                                      data_set_identifier = default_value_column.value["data_set_identifier"]
                                    }
                                }
                                dynamic "group_name_column" {
                                  for_each = dynamic_value.value.group_name_column
                                    content {
                                      column_name         = group_name_column.value["column_name"]
                                      data_set_identifier = group_name_column.value["data_set_identifier"]
                                    }
                                }
                                dynamic "user_name_column" {
                                  for_each = dynamic_value.value.user_name_column
                                    content {
                                      column_name         = user_name_column.value["column_name"]
                                      data_set_identifier = user_name_column.value["data_set_identifier"]
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "values_when_unset" {
                      for_each = integer_parameter_declaration.value.values_when_unset
                        content {
                          custom_value            = values_when_unset.value["custom_value"]
                          value_when_unset_option = values_when_unset.value["value_when_unset_option"]
                        }
                    }
                  }
              }
              dynamic "string_parameter_declaration" {
                for_each = parameters_declarations.value.string_parameter_declaration
                  content {
                    name                 = string_parameter_declaration.value["name"]
                    parameter_value_type = string_parameter_declaration.value["parameter_value_type"]
                    dynamic "default_values" {
                      for_each = string_parameter_declaration.value.default_values
                        content {
                          static_values = default_values.value["static_values"]
                          dynamic "dynamic_value" {
                            for_each = default_values.value.dynamic_value
                              content {
                                dynamic "default_value_column" {
                                  for_each = dynamic_value.value.default_value_column
                                    content {
                                      column_name         = default_value_column.value["column_name"]
                                      data_set_identifier = default_value_column.value["data_set_identifier"]
                                    }
                                }
                                dynamic "group_name_column" {
                                  for_each = dynamic_value.value.group_name_column
                                    content {
                                      column_name         = group_name_column.value["column_name"]
                                      data_set_identifier = group_name_column.value["data_set_identifier"]
                                    }
                                }
                                dynamic "user_name_column" {
                                  for_each = dynamic_value.value.user_name_column
                                    content {
                                      column_name         = user_name_column.value["column_name"]
                                      data_set_identifier = user_name_column.value["data_set_identifier"]
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "values_when_unset" {
                      for_each = string_parameter_declaration.value.values_when_unset
                        content {
                          custom_value            = values_when_unset.value["custom_value"]
                          value_when_unset_option = values_when_unset.value["value_when_unset_option"]
                        }
                    }
                  }
              }
            }
        }
        dynamic "sheets" {
          for_each = definition.value.sheets
            content {
              sheet_id     = sheets.value["sheet_id"]
              content_type = sheets.value["content_type"]
              description  = sheets.value["description"]
              name         = sheets.value["name"]
              title        = sheets.value["title"]
              dynamic "filter_controls" {
                for_each = sheets.value.filter_controls
                  content {
                    dynamic "date_time_picker" {
                      for_each = filter_controls.value.date_time_picker
                        content {
                          filter_control_id = date_time_picker.value["filter_control_id"]
                          source_filter_id  = date_time_picker.value["source_filter_id"]
                          title             = date_time_picker.value["title"]
                          type              = date_time_picker.value["type"]
                          dynamic "display_options" {
                            for_each = date_time_picker.value.display_options
                              content {
                                date_time_format = display_options.value["date_time_format"]
                                dynamic "title_options" {
                                  for_each = display_options.value.title_options
                                    content {
                                      custom_label = title_options.value["custom_label"]
                                      visibility   = title_options.value["visibility"]
                                      dynamic "font_configuration" {
                                        for_each = title_options.value.font_configuration
                                          content {
                                            font_color      = font_configuration.value["font_color"]
                                            font_decoration = font_configuration.value["font_decoration"]
                                            font_style      = font_configuration.value["font_style"]
                                            dynamic "font_size" {
                                              for_each = font_configuration.value.font_size
                                                content {
                                                  relative = font_size.value["relative"]
                                                }
                                            }
                                            dynamic "font_weight" {
                                              for_each = font_configuration.value.font_weight
                                                content {
                                                  name = font_weight.value["name"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "dropdown" {
                      for_each = filter_controls.value.dropdown
                        content {
                          filter_control_id = dropdown.value["filter_control_id"]
                          source_filter_id  = dropdown.value["source_filter_id"]
                          title             = dropdown.value["title"]
                          type              = dropdown.value["type"]
                          dynamic "cascading_control_configuration" {
                            for_each = dropdown.value.cascading_control_configuration
                              content {
                                dynamic "source_controls" {
                                  for_each = cascading_control_configuration.value.source_controls
                                    content {
                                      source_sheet_control_id = source_controls.value["source_sheet_control_id"]
                                      dynamic "column_to_match" {
                                        for_each = source_controls.value.column_to_match
                                          content {
                                            column_name         = column_to_match.value["column_name"]
                                            data_set_identifier = column_to_match.value["data_set_identifier"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "display_options" {
                            for_each = dropdown.value.display_options
                              content {
                                dynamic "select_all_options" {
                                  for_each = display_options.value.select_all_options
                                    content {
                                      visibility = select_all_options.value["visibility"]
                                    }
                                }
                                dynamic "title_options" {
                                  for_each = display_options.value.title_options
                                    content {
                                      custom_label = title_options.value["custom_label"]
                                      visibility   = title_options.value["visibility"]
                                      dynamic "font_configuration" {
                                        for_each = title_options.value.font_configuration
                                          content {
                                            font_color      = font_configuration.value["font_color"]
                                            font_decoration = font_configuration.value["font_decoration"]
                                            font_style      = font_configuration.value["font_style"]
                                            dynamic "font_size" {
                                              for_each = font_configuration.value.font_size
                                                content {
                                                  relative = font_size.value["relative"]
                                                }
                                            }
                                            dynamic "font_weight" {
                                              for_each = font_configuration.value.font_weight
                                                content {
                                                  name = font_weight.value["name"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "selectable_values" {
                            for_each = dropdown.value.selectable_values
                              content {
                                values = selectable_values.value["values"]
                              }
                          }
                        }
                    }
                    dynamic "list" {
                      for_each = filter_controls.value.list
                        content {
                          filter_control_id = list.value["filter_control_id"]
                          source_filter_id  = list.value["source_filter_id"]
                          title             = list.value["title"]
                          type              = list.value["type"]
                          dynamic "cascading_control_configuration" {
                            for_each = list.value.cascading_control_configuration
                              content {
                                dynamic "source_controls" {
                                  for_each = cascading_control_configuration.value.source_controls
                                    content {
                                      source_sheet_control_id = source_controls.value["source_sheet_control_id"]
                                      dynamic "column_to_match" {
                                        for_each = source_controls.value.column_to_match
                                          content {
                                            column_name         = column_to_match.value["column_name"]
                                            data_set_identifier = column_to_match.value["data_set_identifier"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "display_options" {
                            for_each = list.value.display_options
                              content {
                                dynamic "search_options" {
                                  for_each = display_options.value.search_options
                                    content {
                                      visibility = search_options.value["visibility"]
                                    }
                                } 
                                dynamic "select_all_options" {
                                  for_each = display_options.value.select_all_options
                                    content {
                                      visibility = select_all_options.value["visibility"]
                                    }
                                }
                                dynamic "title_options" {
                                  for_each =  display_options.value.title_options
                                    content {
                                      custom_label = title_options.value["custom_label"]
                                      visibility   = title_options.value["visibility"]
                                      dynamic "font_configuration" {
                                        for_each = title_options.value.font_configuration
                                          content {
                                            font_color      = font_configuration.value["font_color"]
                                            font_decoration = font_configuration.value["font_decoration"]
                                            font_style      = font_configuration.value["font_style"]
                                            dynamic "font_size" {
                                              for_each = font_configuration.value.font_size
                                                content {
                                                  relative = font_size.value["relative"]
                                                }
                                            }
                                            dynamic "font_weight" {
                                              for_each = font_configuration.value.font_weight
                                                content {
                                                  name = font_weight.value["name"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "selectable_values" {
                            for_each = list.value.selectable_values
                              content {
                                values = selectable_values.value["values"]
                              }
                          }
                        }
                    }
                    dynamic "relative_date_time" {
                      for_each = filter_controls.value.relative_date_time
                        content {
                          filter_control_id = relative_date_time.value["filter_control_id"]
                          source_filter_id  = relative_date_time.value["source_filter_id"]
                          title             = relative_date_time.value["title"]
                          dynamic "display_options" {
                            for_each = relative_date_time.value.display_options
                              content {
                                date_time_format = display_options.value["date_time_format"]
                                dynamic "title_options" {
                                  for_each = display_options.value.title_options
                                    content {
                                      custom_label = title_options.value["custom_label"]
                                      visibility   = title_options.value["visibility"]
                                      dynamic "font_configuration" {
                                        for_each = title_options.value.font_configuration
                                          content {
                                            font_color      = font_configuration.value["font_color"]
                                            font_decoration = font_configuration.value["font_decoration"]
                                            font_style      = font_configuration.value["font_style"]
                                            dynamic "font_size" {
                                              for_each = font_configuration.value.font_size
                                                content {
                                                  relative = font_size.value["relative"]
                                                }
                                            }
                                            dynamic "font_weight" {
                                              for_each = font_configuration.value.font_weight
                                                content {
                                                  name = font_weight.value["name"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "slider" {
                      for_each = filter_controls.value.slider
                        content {
                          filter_control_id = slider.value["filter_control_id"]
                          source_filter_id  = slider.value["source_filter_id"]
                          title             = slider.value["title"]
                          maximum_value     = slider.value["maximum_value"]
                          minimum_value     = slider.value["minimum_value"]
                          step_size         = slider.value["step_size"]
                          type              = slider.value["type"]
                          dynamic "display_options" {
                            for_each = slider.value.display_options
                              content {
                                dynamic "title_options" {
                                  for_each = display_options.value.title_options
                                    content {
                                      custom_label = title_options.value["custom_label"]
                                      visibility   = title_options.value["visibility"]
                                      dynamic "font_configuration" {
                                        for_each = title_options.value.font_configuration
                                          content {
                                            font_color      = font_configuration.value["font_color"]
                                            font_decoration = font_configuration.value["font_decoration"]
                                            font_style      = font_configuration.value["font_style"]
                                            dynamic "font_size" {
                                              for_each = font_configuration.value.font_size
                                                content {
                                                  relative = font_size.value["relative"]
                                                }
                                            }
                                            dynamic "font_weight" {
                                              for_each = font_configuration.value.font_weight
                                                content {
                                                  name = font_weight.value["name"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "text_area" {
                      for_each = filter_controls.value.text_area
                        content {
                          filter_control_id = text_area.value["filter_control_id"]
                          source_filter_id  = text_area.value["source_filter_id"]
                          title             = text_area.value["title"]
                          delimiter         = text_area.value["delimiter"]
                          dynamic "display_options" {
                            for_each = text_area.value.display_options
                              content {
                                dynamic "placeholder_options" {
                                  for_each = display_options.value.placeholder_options
                                    content {
                                      visibility = placeholder_options.value["visibility"]
                                    }
                                }
                                dynamic "title_options" {
                                  for_each = display_options.value.title_options
                                    content {
                                      custom_label = title_options.value["custom_label"]
                                      visibility   = title_options.value["visibility"]
                                      dynamic "font_configuration" {
                                        for_each = title_options.value.font_configuration
                                          content {
                                            font_color      = font_configuration.value["font_color"]
                                            font_decoration = font_configuration.value["font_decoration"]
                                            font_style      = font_configuration.value["font_style"]
                                            dynamic "font_size" {
                                              for_each = font_configuration.value.font_size
                                                content {
                                                  relative = font_size.value["relative"]
                                                }
                                            }
                                            dynamic "font_weight" {
                                              for_each = font_configuration.value.font_weight
                                                content {
                                                  name = font_weight.value["name"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "text_field" {
                      for_each = filter_controls.value.text_field
                        content {
                          filter_control_id = text_field.value["filter_control_id"]
                          source_filter_id  = text_field.value["source_filter_id"]
                          title             = text_field.value["title"]
                          dynamic "display_options" {
                            for_each = text_field.value.display_options
                              content {
                                dynamic "placeholder_options" {
                                  for_each = display_options.value.placeholder_options
                                    content {
                                      visibility = placeholder_options.value["visibility"]
                                    }
                                }
                                dynamic "title_options" {
                                  for_each = display_options.value.title_options
                                    content {
                                      custom_label = title_options.value["custom_label"]
                                      visibility   = title_options.value["visibility"]
                                      dynamic "font_configuration" {
                                        for_each = title_options.value.font_configuration
                                          content {
                                            font_color      = font_configuration.value["font_color"]
                                            font_decoration = font_configuration.value["font_decoration"]
                                            font_style      = font_configuration.value["font_style"]
                                            dynamic "font_size" {
                                              for_each = font_configuration.value.font_size
                                                content {
                                                  relative = font_size.value["relative"]
                                                }
                                            }
                                            dynamic "font_weight" {
                                              for_each = font_configuration.value.font_weight
                                                content {
                                                  name = font_weight.value["name"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "layouts" {
                for_each = sheets.value.layouts
                  content {
                    dynamic "configuration" {
                      for_each = layouts.value.configurations
                        content {
                          dynamic "free_form_layout" {
                            for_each = configuration.value.free_form_layout
                              content {
                                dynamic "elements" {
                                  for_each = free_form_layout.value.elements
                                    content {
                                      element_id      = elements.value["element_id"]
                                      element_type    = elements.value["element_type"]
                                      height          = elements.value["height"]
                                      width           = elements.value["width"]
                                      x_axis_location = elements.value["x_axis_location"]
                                      y_axis_location = elements.value["y_axis_location"]
                                      visibility      = elements.value["visibility"]
                                      dynamic "background_style" {
                                        for_each = elements.value.background_style
                                          content {
                                            color      = background_style.value["color"]
                                            visibility = background_style.value["visibility"]
                                          }
                                      }
                                      dynamic "border_style" {
                                        for_each = elements.value.border_style
                                          content {
                                            color      = background_style.value["color"]
                                            visibility = background_style.value["visibility"]
                                          }
                                      }
                                      dynamic "loading_animation" {
                                        for_each = elements.value.loading_animation
                                          content {
                                            visibility = loading_animation.value["visibility"]
                                          }
                                      }
                                      dynamic "rendering_rules" {
                                        for_each = elements.value.rendering_rules
                                          content {
                                            expression = rendering_rules.value["expression"]
                                            dynamic "configuration_overrides" {
                                              for_each = rendering_rules.value.configuration_overrides
                                                content {
                                                  visibility = configuration_overrides.value["visibility"]
                                                }
                                            }
                                          }
                                      }
                                      dynamic "selected_border_style" {
                                        for_each = elements.value.selected_border_style
                                          content {
                                            color      = selected_border_style.value["color"]
                                            visibility = selected_border_style.value["visibility"]
                                          }
                                      }
                                    }
                                }
                                dynamic "canvas_size_options" {
                                  for_each = free_form_layout.value.canvas_size_options
                                    content {
                                      dynamic "screen_canvas_size_options" {
                                        for_each = canvas_size_options.value.screen_canvas_size_options
                                          content {
                                            optimized_view_port_width = screen_canvas_size_options.value["optimized_view_port_width"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "grid_layout" {
                            for_each = configuration.value.grid_layout
                              content {
                                dynamic "elements" {
                                  for_each = grid_layout.value["elements"]
                                    content {
                                      column_span  = elements.value["column_span"]
                                      element_id   = elements.value["element_id"]
                                      element_type = elements.value["element_type"]
                                      row_span     = elements.value["row_span"]
                                      column_index = elements.value["column_index"]
                                      row_index    = elements.value["row_index"]
                                    }
                                }
                                dynamic "canvas_size_options" {
                                  for_each = grid_layout.value,canvas_size_options
                                    content {
                                      dynamic "screen_canvas_size_options" {
                                        for_each = canvas_size_options.value.screen_canvas_size_options
                                          content {
                                            optimized_view_port_width = screen_canvas_size_options.value["optimized_view_port_width"]
                                            resize_option             = screen_canvas_size_options.value["resize_option"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "section_based_layout" {
                            for_each = configuration.value.section_based_layout
                              content {
                                dynamic "body_sections" {
                                  for_each = section_based_layout.value.body_sections
                                    content {
                                      section_id = body_sections.value["section_id"]
                                      dynamic "content" {
                                        for_each = body_sections.value.content
                                          content {
                                            dynamic "layout" {
                                              for_each = content.value.layout
                                                content {
                                                  dynamic "free_form_layout" {
                                                    for_each = layout.value.free_form_layout
                                                      content {
                                                        element_id      = elements.value["element_id"]
                                                        element_type    = elements.value["element_type"]
                                                        height          = elements.value["height"]
                                                        width           = elements.value["width"]
                                                        x_axis_location = elements.value["x_axis_location"]
                                                        y_axis_location = elements.value["y_axis_location"]
                                                        visibility      = elements.value["visibility"]
                                                        dynamic "background_style" {
                                                          for_each = elements.value.background_style
                                                            content {
                                                              color      = background_style.value["color"]
                                                              visibility = background_style.value["visibility"]
                                                            }
                                                        }
                                                        dynamic "border_style" {
                                                          for_each = elements.value.border_style
                                                            content {
                                                              color      = background_style.value["color"]
                                                              visibility = background_style.value["visibility"]
                                                            }
                                                        }
                                                        dynamic "loading_animation" {
                                                          for_each = elements.value.loading_animation
                                                            content {
                                                              visibility = loading_animation.value["visibility"]
                                                            }
                                                        }
                                                        dynamic "rendering_rules" {
                                                          for_each = elements.value.rendering_rules
                                                            content {
                                                              expression = rendering_rules.value["expression"]
                                                              dynamic "configuration_overrides" {
                                                                for_each = rendering_rules.value.configuration_overrides
                                                                  content {
                                                                    visibility = configuration_overrides.value["visibility"]
                                                                  }
                                                              }
                                                            }
                                                        } 
                                                        dynamic "selected_border_style" {
                                                          for_each = elements.value.selected_border_style
                                                            content {
                                                              color      = selected_border_style.value["color"]
                                                              visibility = selected_border_style.value["visibility"]
                                                            }
                                                        }
                                                      }
                                                  }
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "page_break_configuration" {
                                        for_each = body_sections.value.page_break_configuration
                                          content {
                                            dynamic "after" {
                                              for_each = page_break_configuration.value.after
                                                content {
                                                  status = after.value["status"]
                                                }
                                            }
                                          }
                                      }
                                      dynamic "style" {
                                        for_each = body_sections.value.style
                                          content {
                                            height  = style.value["height"] 
                                            dynamic "padding" {
                                              for_each = style.value.padding
                                                content {
                                                  bottom = padding.value["bottom"]
                                                  left   = padding.value["left"]
                                                  right  = padding.value["right"]
                                                  top    = padding.value["top"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "canvas_size_options" {
                                  for_each = section_based_layout.value.canvas_size_options
                                    content {
                                      dynamic "paper_canvas_size_options" {
                                        for_each = canvas_size_options.value.paper_canvas_size_options
                                          content {
                                            paper_margin      = paper_canvas_size_options.value["paper_margin"]
                                            paper_orientation = paper_canvas_size_options.value["paper_orientation"]
                                            paper_size        = paper_canvas_size_options.value["paper_size"]
                                          }
                                      }
                                    }
                                }
                                dynamic "footer_sections" {
                                  for_each = section_based_layout.value.footer_sections
                                    content {
                                      section_id = footer_sections.value["section_id"]
                                      dynamic "layout" {
                                        for_each = footer_sections.value.layout
                                          content {
                                            dynamic "free_form_layout" {
                                              for_each = layout.value.free_form_layout
                                                content {
                                                  element_id      = elements.value["element_id"]
                                                  element_type    = elements.value["element_type"]
                                                  height          = elements.value["height"]
                                                  width           = elements.value["width"]
                                                  x_axis_location = elements.value["x_axis_location"]
                                                  y_axis_location = elements.value["y_axis_location"]
                                                  visibility      = elements.value["visibility"]
                                                  dynamic "background_style" {
                                                    for_each = elements.value.background_style
                                                      content {
                                                        color      = background_style.value["color"]
                                                        visibility = background_style.value["visibility"]
                                                      }
                                                  }
                                                  dynamic "border_style" {
                                                    for_each = elements.value.border_style
                                                      content {
                                                        color      = background_style.value["color"]
                                                        visibility = background_style.value["visibility"]
                                                      }
                                                  }
                                                  dynamic "loading_animation" {
                                                    for_each = elements.value.loading_animation
                                                      content {
                                                        visibility = loading_animation.value["visibility"]
                                                      }
                                                  }
                                                  dynamic "rendering_rules" {
                                                    for_each = elements.value.rendering_rules
                                                      content {
                                                        expression = rendering_rules.value["expression"]
                                                        dynamic "configuration_overrides" {
                                                          for_each = rendering_rules.value.configuration_overrides
                                                            content {
                                                              visibility = configuration_overrides.value["visibility"]
                                                            }
                                                        }
                                                      }
                                                  } 
                                                  dynamic "selected_border_style" {
                                                    for_each = elements.value.selected_border_style
                                                      content {
                                                        color      = selected_border_style.value["color"]
                                                        visibility = selected_border_style.value["visibility"]
                                                      }
                                                  }
                                                }
                                            }
                                      }
                                      dynamic "style" {
                                        for_each = footer_sections.value.style
                                          content {
                                            height = style.value["height"]
                                            dynamic "padding" {
                                              for_each = style.value.padding
                                                content {
                                                  bottom = padding.value["bottom"]
                                                  left   = padding.value["left"]
                                                  right  = padding.value["right"]
                                                  top    = padding.value["top"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "header_sections" {
                                  for_each = section_based_layout.value.header_sections
                                    content {
                                      section_id = header_sections.value["section_id"]
                                      dynamic "layout" {
                                        for_each = header_sections.value.layout
                                          content {
                                            dynamic "free_form_layout" {
                                              for_each = layout.value.free_form_layout
                                                content {
                                                  element_id      = elements.value["element_id"]
                                                  element_type    = elements.value["element_type"]
                                                  height          = elements.value["height"]
                                                  width           = elements.value["width"]
                                                  x_axis_location = elements.value["x_axis_location"]
                                                  y_axis_location = elements.value["y_axis_location"]
                                                  visibility      = elements.value["visibility"]
                                                  dynamic "background_style" {
                                                    for_each = elements.value.background_style
                                                      content {
                                                        color      = background_style.value["color"]
                                                        visibility = background_style.value["visibility"]
                                                      }
                                                  }
                                                  dynamic "border_style" {
                                                    for_each = elements.value.border_style
                                                      content {
                                                        color      = background_style.value["color"]
                                                        visibility = background_style.value["visibility"]
                                                      }
                                                  }
                                                  dynamic "loading_animation" {
                                                    for_each = elements.value.loading_animation
                                                      content {
                                                        visibility = loading_animation.value["visibility"]
                                                      }
                                                  }
                                                  dynamic "rendering_rules" {
                                                    for_each = elements.value.rendering_rules
                                                      content {
                                                        expression = rendering_rules.value["expression"]
                                                        dynamic "configuration_overrides" {
                                                          for_each = rendering_rules.value.configuration_overrides
                                                            content {
                                                              visibility = configuration_overrides.value["visibility"]
                                                            }
                                                        }
                                                      }
                                                  } 
                                                  dynamic "selected_border_style" {
                                                    for_each = elements.value.selected_border_style
                                                      content {
                                                        color      = selected_border_style.value["color"]
                                                        visibility = selected_border_style.value["visibility"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }    
                    }            
                  }
              }
              dynamic "parameter_controls" {
                for_each = sheets.value.parameter_controls
                  content {
                    dynamic "date_time_picker" {
                      for_each = parameter_controls.value.date_time_picker
                        content {
                          filter_control_id = date_time_picker.value["filter_control_id"]
                          source_filter_id  = date_time_picker.value["source_filter_id"]
                          title             = date_time_picker.value["title"]
                          type              = date_time_picker.value["type"]
                          dynamic "display_options" {
                            for_each = date_time_picker.value.display_options
                              content {
                                date_time_format = display_options.value["date_time_format"]
                                dynamic "title_options" {
                                  for_each = display_options.value.title_options
                                    content {
                                      custom_label = title_options.value["custom_label"]
                                      visibility   = title_options.value["visibility"]
                                      dynamic "font_configuration" {
                                        for_each = title_options.value.font_configuration
                                          content {
                                            font_color      = font_configuration.value["font_color"]
                                            font_decoration = font_configuration.value["font_decoration"]
                                            font_style      = font_configuration.value["font_style"]
                                            dynamic "font_size" {
                                              for_each = font_configuration.value.font_size
                                                content {
                                                  relative = font_size.value["relative"]
                                                }
                                            }
                                            dynamic "font_weight" {
                                              for_each = font_configuration.value.font_weight
                                                content {
                                                  name = font_weight.value["name"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "dropdown" {
                      for_each = parameter_controls.value.dropdown
                        content {
                          filter_control_id = dropdown.value["filter_control_id"]
                          source_filter_id  = dropdown.value["source_filter_id"]
                          title             = dropdown.value["title"]
                          type              = dropdown.value["type"]
                          dynamic "cascading_control_configuration" {
                            for_each = dropdown.value.cascading_control_configuration
                              content {
                                dynamic "source_controls" {
                                  for_each = cascading_control_configuration.value.source_controls
                                    content {
                                      source_sheet_control_id = source_controls.value["source_sheet_control_id"]
                                      dynamic "column_to_match" {
                                        for_each = source_controls.value.column_to_match
                                          content {
                                            column_name         = column_to_match.value["column_name"]
                                            data_set_identifier = column_to_match.value["data_set_identifier"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "display_options" {
                            for_each = dropdown.value.display_options
                              content {
                                dynamic "select_all_options" {
                                  for_each = display_options.value.select_all_options
                                    content {
                                      visibility = select_all_options.value["visibility"]
                                    }
                                }
                                dynamic "title_options" {
                                  for_each = display_options.value.title_options
                                    content {
                                      custom_label = title_options.value["custom_label"]
                                      visibility   = title_options.value["visibility"]
                                      dynamic "font_configuration" {
                                        for_each = title_options.value.font_configuration
                                          content {
                                            font_color      = font_configuration.value["font_color"]
                                            font_decoration = font_configuration.value["font_decoration"]
                                            font_style      = font_configuration.value["font_style"]
                                            dynamic "font_size" {
                                              for_each = font_configuration.value.font_size
                                                content {
                                                  relative = font_size.value["relative"]
                                                }
                                            }
                                            dynamic "font_weight" {
                                              for_each = font_configuration.value.font_weight
                                                content {
                                                  name = font_weight.value["name"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "selectable_values" {
                            for_each = dropdown.value.selectable_values
                              content {
                                values = selectable_values.value["values"]
                              }
                          }
                        }
                    }
                    dynamic "list" {
                      for_each = parameter_controls.value.list
                        content {
                          filter_control_id = list.value["filter_control_id"]
                          source_filter_id  = list.value["source_filter_id"]
                          title             = list.value["title"]
                          type              = list.value["type"]
                          dynamic "cascading_control_configuration" {
                            for_each = list.value.cascading_control_configuration
                              content {
                                dynamic "source_controls" {
                                  for_each = cascading_control_configuration.value.source_controls
                                    content {
                                      source_sheet_control_id = source_controls.value["source_sheet_control_id"]
                                      dynamic "column_to_match" {
                                        for_each = source_controls.value.column_to_match
                                          content {
                                            column_name         = column_to_match.value["column_name"]
                                            data_set_identifier = column_to_match.value["data_set_identifier"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "display_options" {
                            for_each = list.value.display_options
                              content {
                                dynamic "search_options" {
                                  for_each = display_options.value.search_options
                                    content {
                                      visibility = search_options.value["visibility"]
                                    }
                                } 
                                dynamic "select_all_options" {
                                  for_each = display_options.value.select_all_options
                                    content {
                                      visibility = select_all_options.value["visibility"]
                                    }
                                }
                                dynamic "title_options" {
                                  for_each =  display_options.value.title_options
                                    content {
                                      custom_label = title_options.value["custom_label"]
                                      visibility   = title_options.value["visibility"]
                                      dynamic "font_configuration" {
                                        for_each = title_options.value.font_configuration
                                          content {
                                            font_color      = font_configuration.value["font_color"]
                                            font_decoration = font_configuration.value["font_decoration"]
                                            font_style      = font_configuration.value["font_style"]
                                            dynamic "font_size" {
                                              for_each = font_configuration.value.font_size
                                                content {
                                                  relative = font_size.value["relative"]
                                                }
                                            }
                                            dynamic "font_weight" {
                                              for_each = font_configuration.value.font_weight
                                                content {
                                                  name = font_weight.value["name"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "selectable_values" {
                            for_each = list.value.selectable_values
                              content {
                                values = selectable_values.value["values"]
                              }
                          }
                        }
                    }
                    dynamic "slider" {
                      for_each = parameter_controls.value.slider
                        content {
                          filter_control_id = slider.value["filter_control_id"]
                          source_filter_id  = slider.value["source_filter_id"]
                          title             = slider.value["title"]
                          maximum_value     = slider.value["maximum_value"]
                          minimum_value     = slider.value["minimum_value"]
                          step_size         = slider.value["step_size"]
                          type              = slider.value["type"]
                          dynamic "display_options" {
                            for_each = slider.value.display_options
                              content {
                                dynamic "title_options" {
                                  for_each = display_options.value.title_options
                                    content {
                                      custom_label = title_options.value["custom_label"]
                                      visibility   = title_options.value["visibility"]
                                      dynamic "font_configuration" {
                                        for_each = title_options.value.font_configuration
                                          content {
                                            font_color      = font_configuration.value["font_color"]
                                            font_decoration = font_configuration.value["font_decoration"]
                                            font_style      = font_configuration.value["font_style"]
                                            dynamic "font_size" {
                                              for_each = font_configuration.value.font_size
                                                content {
                                                  relative = font_size.value["relative"]
                                                }
                                            }
                                            dynamic "font_weight" {
                                              for_each = font_configuration.value.font_weight
                                                content {
                                                  name = font_weight.value["name"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "text_area" {
                      for_each =  parameter_controls.value.text_area
                        content {
                          filter_control_id = text_area.value["filter_control_id"]
                          source_filter_id  = text_area.value["source_filter_id"]
                          title             = text_area.value["title"]
                          delimiter         = text_area.value["delimiter"]
                          dynamic "display_options" {
                            for_each = text_area.value.display_options
                              content {
                                dynamic "placeholder_options" {
                                  for_each = display_options.value.placeholder_options
                                    content {
                                      visibility = placeholder_options.value["visibility"]
                                    }
                                }
                                dynamic "title_options" {
                                  for_each = display_options.value.title_options
                                    content {
                                      custom_label = title_options.value["custom_label"]
                                      visibility   = title_options.value["visibility"]
                                      dynamic "font_configuration" {
                                        for_each = title_options.value.font_configuration
                                          content {
                                            font_color      = font_configuration.value["font_color"]
                                            font_decoration = font_configuration.value["font_decoration"]
                                            font_style      = font_configuration.value["font_style"]
                                            dynamic "font_size" {
                                              for_each = font_configuration.value.font_size
                                                content {
                                                  relative = font_size.value["relative"]
                                                }
                                            }
                                            dynamic "font_weight" {
                                              for_each = font_configuration.value.font_weight
                                                content {
                                                  name = font_weight.value["name"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "text_field" {
                      for_each = parameter_controls.value.text_field
                        content {
                          filter_control_id = text_field.value["filter_control_id"]
                          source_filter_id  = text_field.value["source_filter_id"]
                          title             = text_field.value["title"]
                          dynamic "display_options" {
                            for_each = text_field.value.display_options
                              content {
                                dynamic "placeholder_options" {
                                  for_each = display_options.value.placeholder_options
                                    content {
                                      visibility = placeholder_options.value["visibility"]
                                    }
                                }
                                dynamic "title_options" {
                                  for_each = display_options.value.title_options
                                    content {
                                      custom_label = title_options.value["custom_label"]
                                      visibility   = title_options.value["visibility"]
                                      dynamic "font_configuration" {
                                        for_each = title_options.value.font_configuration
                                          content {
                                            font_color      = font_configuration.value["font_color"]
                                            font_decoration = font_configuration.value["font_decoration"]
                                            font_style      = font_configuration.value["font_style"]
                                            dynamic "font_size" {
                                              for_each = font_configuration.value.font_size
                                                content {
                                                  relative = font_size.value["relative"]
                                                }
                                            }
                                            dynamic "font_weight" {
                                              for_each = font_configuration.value.font_weight
                                                content {
                                                  name = font_weight.value["name"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "sheet_control_layouts" {
                for_each = sheets.value.sheet_control_layouts
                  content {
                    dynamic "configuration" {
                      for_each = sheet_control_layouts.value.configuration
                        content {
                          dynamic "grid_layout" {
                            for_each = configuration.value.grid_layout
                              content {
                                dynamic "elements" {
                                  for_each = grid_layout.value["elements"]
                                    content {
                                      column_span  = elements.value["column_span"]
                                      element_id   = elements.value["element_id"]
                                      element_type = elements.value["element_type"]
                                      row_span     = elements.value["row_span"]
                                      column_index = elements.value["column_index"]
                                      row_index    = elements.value["row_index"]
                                    }
                                }
                                dynamic "canvas_size_options" {
                                  for_each = grid_layout.value,canvas_size_options
                                    content {
                                      dynamic "screen_canvas_size_options" {
                                        for_each = canvas_size_options.value.screen_canvas_size_options
                                          content {
                                            optimized_view_port_width = screen_canvas_size_options.value["optimized_view_port_width"]
                                            resize_option             = screen_canvas_size_options.value["resize_option"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              } 
              dynamic "text_boxes" {
                for_each = sheets.value.text_boxes
                  content {
                    sheet_text_box_id = text_boxes.value["sheet_text_box_id"]
                    content           = text_boxes.value["content"]
                  }
              }
              dynamic "visuals" {
                for_each = sheets.value.visuals
                  content {
                    dynamic "bar_chart_visual" {
                      for_each = visuals.value.bar_chart_visual
                        content {
                          visual_id = bar_chart_visual.value["visual_id"]
                          dynamic "actions" {
                            for_each = bar_chart_visual.value.actions
                              content {
                                custom_action_id = action.value["custom_action_id"]
                                name             = action.value["name"]
                                trigger          = action.value["trigger"]
                                status           = action.value["status"] 
                                dynamic "action_operations" {
                                  for_each = actions.value.action_operations
                                    content {
                                      dynamic "filter_operation" {
                                        for_each = action_operations.value.filter_operation
                                          content {
                                            dynamic "selected_fields_configuration" {
                                              for_each = filter_operation.value.selected_fields_configuration
                                                content {
                                                  selected_field_option = selected_fields_configuration.value["selected_field_option"]
                                                  selected_fields       = selected_fields_configuration.value["selected_fields"]
                                                }
                                            }
                                            dynamic "target_visuals_configuration" {
                                              for_each = filter_operation.value.target_visuals_configuration
                                                content {
                                                  dynamic "same_sheet_target_visual_configuration" {
                                                    for_each = target_visuals_configuration.value.same_sheet_target_visual_configuration
                                                      content {
                                                        target_visual_option = same_sheet_target_visual_configuration.value["target_visual_option"]
                                                        target_visuals       = same_sheet_target_visual_configuration.value["target_visuals"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                      dynamic "navigation_operation" {
                                        for_each = action_operations.value.navigation_operation
                                          content {
                                            dynamic "local_navigation_configuration" {
                                              for_each = navigation_operation.value.local_navigation_configuration
                                                content {
                                                  target_sheet_id = local_navigation_configuration.value["target_sheet_id"]
                                                }
                                            }
                                          }
                                      }
                                      dynamic "set_parameters_operation" {
                                        for_each = action_operations.value.set_parameters_operation
                                          content {
                                            dynamic "parameter_value_configurations" {
                                              for_each = set_parameters_operation.value.parameter_value_configurations
                                                content {
                                                  destination_parameter_name = parameter_value_configurations.value["destination_parameter_name"]
                                                  dynamic "value" {
                                                    for_each = parameter_value_configurations.value.value
                                                      content {
                                                        select_all_value_options = value.value["select_all_value_options"]
                                                        source_field             = value.value["source_field"]
                                                        source_parameter_name    = value.value["source_parameter_name"]
                                                        dynamic "custom_values_configuration" {
                                                          for_each = value.value.custom_values_configuration
                                                            content {
                                                              include_null_value = custom_values_configuration.value["include_null_value"]
                                                              dynamic "custom_values" {
                                                                for_each = custom_values_configuration.value.custom_values
                                                                  content {
                                                                    date_time_values = custom_values.value["date_time_values"] 
                                                                    decimal_values   = custom_values.value["decimal_values"]
                                                                    integer_values   = custom_values.value["integer_values"]
                                                                    string_values    = custom_values.value["string_values"]
                                                                  }
                                                              }
                                                            }
                                                        }
                                                      }
                                                  }
                                                }
                                            }
                                          }  
                                      }
                                      dynamic "url_operation" {
                                        for_each = action_operations.value.url_operation
                                          content {
                                            url_target   = url_operation.value["url_target"]
                                            url_template = url_operation.value["url_template"]
                                          }
                                      }
                                    }
                                }
                              }    
                          }
                          dynamic "chart_configuration" {
                            for_each = bar_chart_visual.value.chart_configuration
                              content {
                                bars_arrangement = chart_configuration.value["bars_arrangement"]
                                orientation      = chart_configuration.value["orientation"]
                                dynamic "category_axis" {
                                  for_each = chart_configuration.value.category_axis
                                    content {
                                      axis_line_visibility = category_axis.value["axis_line_visibility"]
                                      axis_offset          = category_axis.value["axis_offset"]
                                      grid_line_visibility = category_axis.value["grid_line_visibility"]
                                      dynamic "data_options" {
                                        for_each = category_axis.value.data_options
                                          content {
                                            dynamic "date_axis_options" {
                                              for_each = data_options.value.date_axis_options
                                                content {
                                                  missing_date_visibility = date_axis_options.value["missing_date_visibility"]
                                                }
                                            }
                                            dynamic "numeric_axis_options" {
                                              for_each = data_options.value.numeric_axis_options
                                                content {
                                                  dynamic "range" {
                                                    for_each = numeric_axis_options.value.range
                                                      content {
                                                        data_driven = range.value["data_driven"]
                                                        dynamic "min_max" {
                                                          for_each = range.value.min_max
                                                            content {
                                                              maximum = min_max.value["maximum"]
                                                              minimum = min_max.value["minimum"]
                                                            }
                                                        }
                                                      }
                                                  }
                                                  dynamic "scale" {
                                                    for_each = numeric_axis_options.value.scale
                                                      content {
                                                        dynamic "linear" {
                                                          for_each = scale.value.linear
                                                            content {
                                                              step_count = linear.value["step_count"]
                                                              step_size  = linear.value["step_size"]
                                                            }
                                                        }
                                                        dynamic "logarithmic" {
                                                          for_each = scale.value.logarithmic
                                                            content {
                                                              base = logarithmic.value["base"]
                                                            }
                                                        }
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                      dynamic "scrollbar_options" {
                                        for_each = category_axis.value.scrollbar_options
                                          content {
                                            visibility = scrollbar_options.value["visibility"]
                                            dynamic "visible_range" {
                                              for_each = crollbar_options.value.visible_range
                                                content {
                                                  dynamic "percent_range" {
                                                    for_each = visible_range.value.percent_range
                                                      content {
                                                        from = percent_range.value["from"]
                                                        to   = percent_range.value["to"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                      dynamic "tick_label_options" {
                                        for_each = category_axis.value.tick_label_options
                                          content {
                                            rotation_angle = tick_label_options.value["rotation_angle"]
                                            dynamic "label_options" {
                                              for_each = tick_label_options.value.label_options
                                                content {
                                                  custom_label = label_options.value["custom_label"]
                                                  visibility   = label_options.value["visibility"]
                                                  dynamic "font_configuration" {
                                                    for_each = label_options.value.font_configuration
                                                      content {
                                                        font_color      = font_configuration.value["font_color"]
                                                        font_decoration = font_configuration.value["font_decoration"]
                                                        font_style      = font_configuration.value["font_style"]
                                                        dynamic "font_size" {
                                                          for_each = font_configuration.value.font_size
                                                            content {
                                                              relative = font_size.value["relative"]
                                                            }
                                                        }
                                                        dynamic "font_weight" {
                                                          for_each = font_configuration.value.font_weight
                                                            content {
                                                              name = font_weight.value["name"]
                                                            }
                                                        }
                                                      }
                                                  } 
                                                }
                                            } 
                                         }
                                      }
                                   }
                                }
                                dynamic "category_label_options" {
                                  for_each = chart_configuration.value.category_label_options
                                    content {
                                      sort_icon_visibility = category_label_options.value["sort_icon_visibility"]
                                      visibility           = category_label_options.value["visibility"]
                                      dynamic "axis_label_options" {
                                        for_each = category_label_options.value.axis_label_options
                                          content {
                                            custom_label = axis_label_options.value["custom_label"]
                                            dynamic "apply_to" {
                                              for_each = axis_label_options.value.apply_to
                                                content {
                                                  field_id     = apply_to.value["field_id"]
                                                  dynamic "column" {
                                                    for_each = apply_to.value.column
                                                      content {
                                                        column_name         = column.value["column_name"]
                                                        data_set_identifier = column.value["data_set_identifier"]
                                                      }
                                                  }
                                                }
                                            }
                                            dynamic "font_configuration" {
                                              for_each = axis_label_options.value.font_configuration
                                                content {
                                                  font_color      = font_configuration.value["font_color"]
                                                  font_decoration = font_configuration.value["font_decoration"]
                                                  font_style      = font_configuration.value["font_style"]
                                                  dynamic "font_size" {
                                                    for_each = font_configuration.value.font_size
                                                      content {
                                                        relative = font_size.value["relative"]
                                                      }
                                                  }
                                                  dynamic "font_weight" {
                                                    for_each = font_configuration.value.font_weight
                                                      content {
                                                        name = font_weight.value["name"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }                                     
                                    }
                                }
                                dynamic "color_label_options" {
                                  for_each = chart_configuration.value.color_label_options
                                    content {
                                      sort_icon_visibility = color_label_options.value["sort_icon_visibility"]
                                      visibility           = color_label_options.value["visibility"]
                                      dynamic "axis_label_options" {
                                        for_each = color_label_options.value.axis_label_options
                                          content {
                                            custom_label = axis_label_options.value["custom_label"]
                                            dynamic "apply_to" {
                                              for_each = axis_label_options.value.apply_to
                                                content {
                                                  field_id     = apply_to.value["field_id"]
                                                  dynamic "column" {
                                                    for_each = apply_to.value.column
                                                      content {
                                                        column_name         = column.value["column_name"]
                                                        data_set_identifier = column.value["data_set_identifier"]
                                                      }
                                                  }
                                                }
                                            }
                                            dynamic "font_configuration" {
                                              for_each = axis_label_options.value.font_configuration
                                                content {
                                                  font_color      = font_configuration.value["font_color"]
                                                  font_decoration = font_configuration.value["font_decoration"]
                                                  font_style      = font_configuration.value["font_style"]
                                                  dynamic "font_size" {
                                                    for_each = font_configuration.value.font_size
                                                      content {
                                                        relative = font_size.value["relative"]
                                                      }
                                                  }
                                                  dynamic "font_weight" {
                                                    for_each = font_configuration.value.font_weight
                                                      content {
                                                        name = font_weight.value["name"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }                                     
                                    }
                                }
                                dynamic "contribution_analysis_defaults" {
                                  for_each = chart_configuration.value.contribution_analysis_defaults
                                    content {
                                      measure_field_id = contribution_analysis_defaults.value["measure_field_id"]
                                      dynamic "contributor_dimensions" {
                                        for_each = contribution_analysis_defaults.value.contributor_dimensions
                                          content {
                                            column_name         = contributor_dimensions.value["column_name"]
                                            data_set_identifier = contributor_dimensions.value["data_set_identifier"]
                                          }
                                      }
                                    }
                                }
                                dynamic "data_labels" {
                                  for_each = chart_configuration.value.data_labels
                                    content {
                                      category_label_visibility = data_labels.value["category_label_visibility"]
                                      label_color               = data_labels.value["label_color"]
                                      label_content             = data_labels.value["label_content"]
                                      measure_label_visibility  = data_labels.value["measure_label_visibility"]
                                      overlap                   = data_labels.value["overlap"]
                                      position                  = data_labels.value["position"]
                                      visibility                = data_labels.value["visibility"]
                                      dynamic "label_font_configuration" {
                                        for_each = data_labels.value.label_font_configuration
                                          content {
                                            font_color      = font_configuration.value["font_color"]
                                            font_decoration = font_configuration.value["font_decoration"]
                                            font_style      = font_configuration.value["font_style"]
                                            dynamic "font_size" {
                                              for_each = font_configuration.value.font_size
                                                content {
                                                  relative = font_size.value["relative"]
                                                }
                                            }
                                            dynamic "font_weight" {
                                              for_each = font_configuration.value.font_weight
                                                content {
                                                  name = font_weight.value["name"]
                                                }
                                            }
                                          }
                                      }
                                      dynamic "data_label_types" {
                                        for_each = data_labels.value.data_label_types
                                          content {
                                            dynamic "data_path_label_type" {
                                              for_each = data_label_types.value.data_path_label_type
                                                content {
                                                  field_id    = data_path_label_type.value["field_id"]
                                                  field_value = data_path_label_type.value["field_value"]
                                                  visibility  = data_path_label_type.value["visibility"]
                                                }
                                            }
                                            dynamic "field_label_type" {
                                              for_each = data_label_types.value.field_label_type
                                                content {
                                                  field_id   = field_label_type.value["field_id"]
                                                  visibility = field_label_type.value["visibility"]
                                                }
                                            }
                                            dynamic "maximum_label_type" {
                                              for_each = data_label_types.value.maximum_label_type
                                                content {
                                                  visibility = maximum_label_type.value["visibility"]
                                                }
                                            }
                                            dynamic "minimum_label_type" {
                                              for_each = data_label_types.value.minimum_label_type
                                                content {
                                                  visibility = minimum_label_type.value["visibility"]
                                                }
                                            }
                                            dynamic "range_ends_label_type" {
                                              for_each = data_label_types.value.range_ends_label_type
                                                content {
                                                  visibility = range_ends_label_type.value["visibility"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "field_wells" {
                                  for_each = chart_configuration.value.field_wells
                                    content {
                                      dynamic "bar_chart_aggregated_field_wells" {
                                        for_each = field_wells.value.bar_chart_aggregated_field_wells
                                          content {
                                            dynamic "category" {
                                              for_each = bar_chart_aggregated_field_wells.value.category
                                                content {
                                                  dynamic "categorical_dimension_field" {
                                                    for_each = category.value.categorical_dimension_field
                                                      content {
                                                        field_id     = categorical_dimension_field.value["field_id"]
                                                        hierarchy_id = categorical_dimension_field.value["hierarchy_id"]
                                                        dynamic "column" {
                                                          for_each = categorical_dimension_field.value.column
                                                            content {
                                                              column_name         = column.value["column_name"]
                                                              data_set_identifier = column.value["data_set_identifier"]
                                                            }
                                                        }
                                                        dynamic "format_configuration" {
                                                          for_each = categorical_dimension_field.value.format_configuration
                                                            content {
                                                              dynamic "null_value_format_configuration" {
                                                                for_each = format_configuration.value.null_value_format_configuration
                                                                  content {
                                                                    null_string = null_value_format_configuration.value["null_string"]
                                                                  }
                                                              } 
                                                              dynamic "numeric_format_configuration" {
                                                                for_each = format_configuration.value.numeric_format_configuration
                                                                  content {
                                                                    number_scale = numeric_format_configuration.value["number_scale"]
                                                                    prefix       = numeric_format_configuration.value["prefix"]
                                                                    suffix       = numeric_format_configuration.value["suffix"]
                                                                    symbol       = numeric_format_configuration.value["symbol"]
                                                                    dynamic "decimal_places_configuration" {
                                                                      for_each = numeric_format_configuration.value.decimal_places_configuration
                                                                        content {
                                                                          decimal_places = decimal_places_configuration.value["decimal_places"]
                                                                        }
                                                                    } 
                                                                    dynamic "negative_value_configuration" {
                                                                      for_each = numeric_format_configuration.value.negative_value_configuration
                                                                        content {
                                                                          display_mode = negative_value_configuration.value["display_mode"]
                                                                        }
                                                                    }
                                                                    dynamic "null_value_format_configuration" {
                                                                      for_each = numeric_format_configuration.value.null_value_format_configuration
                                                                        content {
                                                                          null_string = null_value_format_configuration.value["null_string"]
                                                                        }
                                                                    }
                                                                    dynamic "separator_configuration" {
                                                                      for_each = numeric_format_configuration.value.separator_configuration
                                                                        content {
                                                                          decimal_separator = separator_configuration.value["decimal_separator"]
                                                                          dynamic "thousands_separator" {
                                                                            for_each = separator_configuration.value.thousands_separator
                                                                              content {
                                                                                symbol     = thousands_separator.value["symbol"]
                                                                                visibility = thousands_separator.value["visibility"]
                                                                              }
                                                                          }
                                                                        }
                                                                    }
                                                                  }
                                                              } 
                                                              dynamic "number_display_format_configuration" {
                                                                for_each = numeric_format_configuration.value.number_display_format_configuration
                                                                  content {
                                                                    number_scale = number_display_format_configuration.value["number_scale"]
                                                                    prefix       = number_display_format_configuration.value["prefix"]
                                                                    suffix       = number_display_format_configuration.value["suffix"]
                                                                    dynamic "decimal_places_configuration" {
                                                                      for_each = number_display_format_configuration.value.decimal_places_configuration
                                                                        content {
                                                                          decimal_places = decimal_places_configuration.value["decimal_places"]
                                                                        }
                                                                    }
                                                                    dynamic "negative_value_configuration" {
                                                                      for_each = number_display_format_configuration.value.negative_value_configuration
                                                                        content {
                                                                          display_mode = negative_value_configuration.value["display_mode"]
                                                                        }
                                                                    }
                                                                    dynamic "null_value_format_configuration" {
                                                                      for_each = number_display_format_configuration.value.null_value_format_configuration
                                                                        content {
                                                                          null_string = null_value_format_configuration.value["null_string"]
                                                                        }
                                                                    }
                                                                    dynamic "separator_configuration" {
                                                                      for_each = number_display_format_configuration.value.separator_configuration
                                                                        content {
                                                                          decimal_separator = separator_configuration.value["decimal_separator"]
                                                                          dynamic "thousands_separator" {
                                                                            for_each = separator_configuration.value.thousands_separator
                                                                              content {
                                                                                symbol     = thousands_separator.value["symbol"]
                                                                                visibility = thousands_separator.value["visibility"]
                                                                              }
                                                                          }
                                                                        }
                                                                    }
                                                                  }
                                                              }
                                                              dynamic "percentage_display_format_configuration" {
                                                                for_each = numeric_format_configuration.value.percentage_display_format_configuration
                                                                  content {
                                                                    prefix = percentage_display_format_configuration.value["prefix"]
                                                                    suffix = percentage_display_format_configuration.value["suffix"]
                                                                    dynamic "decimal_places_configuration" {
                                                                      for_each = percentage_display_format_configuration.value.decimal_places_configuration
                                                                        content {
                                                                          decimal_places = decimal_places_configuration.value["decimal_places"]
                                                                        }
                                                                    }
                                                                    dynamic "negative_value_configuration" {
                                                                      for_each = percentage_display_format_configuration.value.negative_value_configuration
                                                                        content {
                                                                          display_mode = negative_value_configuration.value["display_mode"]
                                                                        }
                                                                    }
                                                                    dynamic "null_value_format_configuration" {
                                                                      for_each = percentage_display_format_configuration.value.null_value_format_configuration
                                                                        content {
                                                                          null_string = null_value_format_configuration.value["null_string"]
                                                                        }
                                                                    }
                                                                    dynamic "separator_configuration" {
                                                                      for_each = percentage_display_format_configuration.value.separator_configuration
                                                                        content {
                                                                          decimal_separator = separator_configuration.value["decimal_separator"]
                                                                          dynamic "thousands_separator" {
                                                                            for_each = separator_configuration.value.thousands_separator
                                                                              content {
                                                                                symbol     = thousands_separator.value["symbol"]
                                                                                visibility = thousands_separator.value["visibility"]
                                                                              }
                                                                          }
                                                                        }
                                                                     }
                                                                  }
                                                               }
                                                             }
                                                           }
                                                         }
                                                       }
                                                     }
                                                  } 
                                                }
                                            }
                                            dynamic "colors" {
                                              for_each = bar_chart_aggregated_field_wells.value.colors
                                                content {
                                                  dynamic "categorical_dimension_field" {
                                                    for_each = colors.value.categorical_dimension_field
                                                      content {
                                                        field_id     = categorical_dimension_field.value["field_id"]
                                                        hierarchy_id = categorical_dimension_field.value["hierarchy_id"]
                                                        dynamic "column" {
                                                          for_each = categorical_dimension_field.value.column
                                                            content {
                                                              column_name         = column.value["column_name"]
                                                              data_set_identifier = column.value["data_set_identifier"]
                                                            }
                                                        }
                                                        dynamic "format_configuration" {
                                                          for_each = categorical_dimension_field.value.format_configuration
                                                            content {
                                                              dynamic "null_value_format_configuration" {
                                                                for_each = format_configuration.value.null_value_format_configuration
                                                                  content {
                                                                    null_string = null_value_format_configuration.value["null_string"]
                                                                  }
                                                              } 
                                                              dynamic "numeric_format_configuration" {
                                                                for_each = format_configuration.value.numeric_format_configuration
                                                                  content {
                                                                    number_scale = numeric_format_configuration.value["number_scale"]
                                                                    prefix       = numeric_format_configuration.value["prefix"]
                                                                    suffix       = numeric_format_configuration.value["suffix"]
                                                                    symbol       = numeric_format_configuration.value["symbol"]
                                                                    dynamic "decimal_places_configuration" {
                                                                      for_each = numeric_format_configuration.value.decimal_places_configuration
                                                                        content {
                                                                          decimal_places = decimal_places_configuration.value["decimal_places"]
                                                                        }
                                                                    } 
                                                                    dynamic "negative_value_configuration" {
                                                                      for_each = numeric_format_configuration.value.negative_value_configuration
                                                                        content {
                                                                          display_mode = negative_value_configuration.value["display_mode"]
                                                                        }
                                                                    }
                                                                    dynamic "null_value_format_configuration" {
                                                                      for_each = numeric_format_configuration.value.null_value_format_configuration
                                                                        content {
                                                                          null_string = null_value_format_configuration.value["null_string"]
                                                                        }
                                                                    }
                                                                    dynamic "separator_configuration" {
                                                                      for_each = numeric_format_configuration.value.separator_configuration
                                                                        content {
                                                                          decimal_separator = separator_configuration.value["decimal_separator"]
                                                                          dynamic "thousands_separator" {
                                                                            for_each = separator_configuration.value.thousands_separator
                                                                              content {
                                                                                symbol     = thousands_separator.value["symbol"]
                                                                                visibility = thousands_separator.value["visibility"]
                                                                              }
                                                                          }
                                                                        }
                                                                    }
                                                                  }
                                                              } 
                                                              dynamic "number_display_format_configuration" {
                                                                for_each = numeric_format_configuration.value.number_display_format_configuration
                                                                  content {
                                                                    number_scale = number_display_format_configuration.value["number_scale"]
                                                                    prefix       = number_display_format_configuration.value["prefix"]
                                                                    suffix       = number_display_format_configuration.value["suffix"]
                                                                    dynamic "decimal_places_configuration" {
                                                                      for_each = number_display_format_configuration.value.decimal_places_configuration
                                                                        content {
                                                                          decimal_places = decimal_places_configuration.value["decimal_places"]
                                                                        }
                                                                    }
                                                                    dynamic "negative_value_configuration" {
                                                                      for_each = number_display_format_configuration.value.negative_value_configuration
                                                                        content {
                                                                          display_mode = negative_value_configuration.value["display_mode"]
                                                                        }
                                                                    }
                                                                    dynamic "null_value_format_configuration" {
                                                                      for_each = number_display_format_configuration.value.null_value_format_configuration
                                                                        content {
                                                                          null_string = null_value_format_configuration.value["null_string"]
                                                                        }
                                                                    }
                                                                    dynamic "separator_configuration" {
                                                                      for_each = number_display_format_configuration.value.separator_configuration
                                                                        content {
                                                                          decimal_separator = separator_configuration.value["decimal_separator"]
                                                                          dynamic "thousands_separator" {
                                                                            for_each = separator_configuration.value.thousands_separator
                                                                              content {
                                                                                symbol     = thousands_separator.value["symbol"]
                                                                                visibility = thousands_separator.value["visibility"]
                                                                              }
                                                                          }
                                                                        }
                                                                    }
                                                                  }
                                                              }
                                                              dynamic "percentage_display_format_configuration" {
                                                                for_each = numeric_format_configuration.value.percentage_display_format_configuration
                                                                  content {
                                                                    prefix = percentage_display_format_configuration.value["prefix"]
                                                                    suffix = percentage_display_format_configuration.value["suffix"]
                                                                    dynamic "decimal_places_configuration" {
                                                                      for_each = percentage_display_format_configuration.value.decimal_places_configuration
                                                                        content {
                                                                          decimal_places = decimal_places_configuration.value["decimal_places"]
                                                                        }
                                                                    }
                                                                    dynamic "negative_value_configuration" {
                                                                      for_each = percentage_display_format_configuration.value.negative_value_configuration
                                                                        content {
                                                                          display_mode = negative_value_configuration.value["display_mode"]
                                                                        }
                                                                    }
                                                                    dynamic "null_value_format_configuration" {
                                                                      for_each = percentage_display_format_configuration.value.null_value_format_configuration
                                                                        content {
                                                                          null_string = null_value_format_configuration.value["null_string"]
                                                                        }
                                                                    }
                                                                    dynamic "separator_configuration" {
                                                                      for_each = percentage_display_format_configuration.value.separator_configuration
                                                                        content {
                                                                          decimal_separator = separator_configuration.value["decimal_separator"]
                                                                          dynamic "thousands_separator" {
                                                                            for_each = separator_configuration.value.thousands_separator
                                                                              content {
                                                                                symbol     = thousands_separator.value["symbol"]
                                                                                visibility = thousands_separator.value["visibility"]
                                                                              }
                                                                          }
                                                                        }
                                                                     }
                                                                  }
                                                               }
                                                             }
                                                           }
                                                         }
                                                      }
                                                   }

                                            }
                                            dynamic "small_multiples" {
                                              for_each = bar_chart_aggregated_field_wells.value.small_multiples
                                                content {
                                                  dynamic "categorical_dimension_field" {
                                                    for_each = small_multiples.value.categorical_dimension_field
                                                      content {
                                                        field_id     = categorical_dimension_field.value["field_id"]
                                                        hierarchy_id = categorical_dimension_field.value["hierarchy_id"]
                                                        dynamic "column" {
                                                          for_each = categorical_dimension_field.value.column
                                                            content {
                                                              column_name         = column.value["column_name"]
                                                              data_set_identifier = column.value["data_set_identifier"]
                                                            }
                                                        }
                                                        dynamic "format_configuration" {
                                                          for_each = categorical_dimension_field.value.format_configuration
                                                            content {
                                                              dynamic "null_value_format_configuration" {
                                                                for_each = format_configuration.value.null_value_format_configuration
                                                                  content {
                                                                    null_string = null_value_format_configuration.value["null_string"]
                                                                  }
                                                              } 
                                                              dynamic "numeric_format_configuration" {
                                                                for_each = format_configuration.value.numeric_format_configuration
                                                                  content {
                                                                    number_scale = numeric_format_configuration.value["number_scale"]
                                                                    prefix       = numeric_format_configuration.value["prefix"]
                                                                    suffix       = numeric_format_configuration.value["suffix"]
                                                                    symbol       = numeric_format_configuration.value["symbol"]
                                                                    dynamic "decimal_places_configuration" {
                                                                      for_each = numeric_format_configuration.value.decimal_places_configuration
                                                                        content {
                                                                          decimal_places = decimal_places_configuration.value["decimal_places"]
                                                                        }
                                                                    } 
                                                                    dynamic "negative_value_configuration" {
                                                                      for_each = numeric_format_configuration.value.negative_value_configuration
                                                                        content {
                                                                          display_mode = negative_value_configuration.value["display_mode"]
                                                                        }
                                                                    }
                                                                    dynamic "null_value_format_configuration" {
                                                                      for_each = numeric_format_configuration.value.null_value_format_configuration
                                                                        content {
                                                                          null_string = null_value_format_configuration.value["null_string"]
                                                                        }
                                                                    }
                                                                    dynamic "separator_configuration" {
                                                                      for_each = numeric_format_configuration.value.separator_configuration
                                                                        content {
                                                                          decimal_separator = separator_configuration.value["decimal_separator"]
                                                                          dynamic "thousands_separator" {
                                                                            for_each = separator_configuration.value.thousands_separator
                                                                              content {
                                                                                symbol     = thousands_separator.value["symbol"]
                                                                                visibility = thousands_separator.value["visibility"]
                                                                              }
                                                                          }
                                                                        }
                                                                    }
                                                                  }
                                                              } 
                                                              dynamic "number_display_format_configuration" {
                                                                for_each = numeric_format_configuration.value.number_display_format_configuration
                                                                  content {
                                                                    number_scale = number_display_format_configuration.value["number_scale"]
                                                                    prefix       = number_display_format_configuration.value["prefix"]
                                                                    suffix       = number_display_format_configuration.value["suffix"]
                                                                    dynamic "decimal_places_configuration" {
                                                                      for_each = number_display_format_configuration.value.decimal_places_configuration
                                                                        content {
                                                                          decimal_places = decimal_places_configuration.value["decimal_places"]
                                                                        }
                                                                    }
                                                                    dynamic "negative_value_configuration" {
                                                                      for_each = number_display_format_configuration.value.negative_value_configuration
                                                                        content {
                                                                          display_mode = negative_value_configuration.value["display_mode"]
                                                                        }
                                                                    }
                                                                    dynamic "null_value_format_configuration" {
                                                                      for_each = number_display_format_configuration.value.null_value_format_configuration
                                                                        content {
                                                                          null_string = null_value_format_configuration.value["null_string"]
                                                                        }
                                                                    }
                                                                    dynamic "separator_configuration" {
                                                                      for_each = number_display_format_configuration.value.separator_configuration
                                                                        content {
                                                                          decimal_separator = separator_configuration.value["decimal_separator"]
                                                                          dynamic "thousands_separator" {
                                                                            for_each = separator_configuration.value.thousands_separator
                                                                              content {
                                                                                symbol     = thousands_separator.value["symbol"]
                                                                                visibility = thousands_separator.value["visibility"]
                                                                              }
                                                                          }
                                                                        }
                                                                    }
                                                                  }
                                                              }
                                                              dynamic "percentage_display_format_configuration" {
                                                                for_each = numeric_format_configuration.value.percentage_display_format_configuration
                                                                  content {
                                                                    prefix = percentage_display_format_configuration.value["prefix"]
                                                                    suffix = percentage_display_format_configuration.value["suffix"]
                                                                    dynamic "decimal_places_configuration" {
                                                                      for_each = percentage_display_format_configuration.value.decimal_places_configuration
                                                                        content {
                                                                          decimal_places = decimal_places_configuration.value["decimal_places"]
                                                                        }
                                                                    }
                                                                    dynamic "negative_value_configuration" {
                                                                      for_each = percentage_display_format_configuration.value.negative_value_configuration
                                                                        content {
                                                                          display_mode = negative_value_configuration.value["display_mode"]
                                                                        }
                                                                    }
                                                                    dynamic "null_value_format_configuration" {
                                                                      for_each = percentage_display_format_configuration.value.null_value_format_configuration
                                                                        content {
                                                                          null_string = null_value_format_configuration.value["null_string"]
                                                                        }
                                                                    }
                                                                    dynamic "separator_configuration" {
                                                                      for_each = percentage_display_format_configuration.value.separator_configuration
                                                                        content {
                                                                          decimal_separator = separator_configuration.value["decimal_separator"]
                                                                          dynamic "thousands_separator" {
                                                                            for_each = separator_configuration.value.thousands_separator
                                                                              content {
                                                                                symbol     = thousands_separator.value["symbol"]
                                                                                visibility = thousands_separator.value["visibility"]
                                                                              }
                                                                          }
                                                                        }
                                                                     }
                                                                  }
                                                               }
                                                             }
                                                           }
                                                         }
                                                      }
                                                  }
                                            }
                                            dynamic "values" {
                                              for_each = bar_chart_aggregated_field_wells.value.values
                                                content {
                                                  dynamic "calculated_measure_field" {
                                                    for_each = values.value.calculated_measure_field
                                                      content {
                                                        expression = calculated_measure_field.value["expression"]
                                                        field_id   = calculated_measure_field.value["field_id"]
                                                      }
                                                  }
                                                  dynamic "categorical_measure_field" {
                                                    for_each =  values.value.categorical_measure_field
                                                      content {
                                                        field_id             = categorical_measure_field.value["field_id"]
                                                        aggregation_function = categorical_measure_field.value["aggregation_function"]
                                                        dynamic "column" {
                                                          for_each = categorical_measure_field.value.column_name
                                                            content {
                                                              column_name         = column_name.value["column_name"]
                                                              data_set_identifier = column_name.value["data_set_identifier"]
                                                            }
                                                        }
                                                        dynamic "format_configuration" {
                                                          for_each = categorical_measure_field.value.format_configuration
                                                            content {
                                                              dynamic "null_value_format_configuration" {
                                                                for_each = format_configuration.value.null_value_format_configuration
                                                                  content {
                                                                    null_string = null_value_format_configuration.value["null_string"]
                                                                  }
                                                              }
                                                              dynamic "numeric_format_configuration" {
                                                                for_each = format_configuration.value.numeric_format_configuration
                                                                  content {
                                                                    number_scale = numeric_format_configuration.value["number_scale"]
                                                                    prefix       = numeric_format_configuration.value["prefix"]
                                                                    suffix       = numeric_format_configuration.value["suffix"]
                                                                    symbol       = numeric_format_configuration.value["symbol"]
                                                                    dynamic "decimal_places_configuration" {
                                                                      for_each = numeric_format_configuration.value.decimal_places_configuration
                                                                        content {
                                                                          decimal_places = numeric_format_configuration.value["decimal_places"]
                                                                        }
                                                                    } 
                                                                    dynamic "negative_value_configuration" {
                                                                      for_each = numeric_format_configuration.value.negative_value_configuration
                                                                        content {
                                                                          display_mode = negative_value_configuration.value["display_mode"]
                                                                        }
                                                                    }
                                                                    dynamic "null_value_format_configuration" {
                                                                      for_each = numeric_format_configuration.value.null_value_format_configuration
                                                                        content {
                                                                          null_string = null_value_format_configuration.value["null_string"]
                                                                        }
                                                                    }
                                                                    dynamic "separator_configuration" {
                                                                      for_each = numeric_format_configuration.value.separator_configuration
                                                                        content {
                                                                          decimal_separator = separator_configuration.value["decimal_separator"]
                                                                          dynamic "thousands_separator" {
                                                                            for_each = separator_configuration.value.thousands_separator
                                                                              content {
                                                                                symbol     = thousands_separator.value["symbol"]
                                                                                visibility = thousands_separator.value["visibility"]
                                                                              }
                                                                          }
                                                                        }
                                                                    }
                                                                  }
                                                              }
                                                            }
                                                        }
                                                      }
                                                  }
                                                  dynamic "date_measure_field" {
                                                    for_each = values.value.date_measure_field
                                                      content {
                                                        field_id             = date_measure_field.value["field_id"]
                                                        aggregation_function = date_measure_field.value["aggregation_function"]
                                                        dynamic "column" {
                                                          for_each = date_measure_field.value.column_name
                                                            content {
                                                              column_name         = column_name.value["column_name"]
                                                              data_set_identifier = column_name.value["data_set_identifier"]
                                                            }
                                                        }
                                                        dynamic "format_configuration" {
                                                          for_each = date_measure_field.value.format_configuration
                                                            content {
                                                              date_time_format = format_configuration.value["date_time_format"]
                                                              dynamic "null_value_format_configuration" {
                                                                for_each = format_configuration.value.null_value_format_configuration
                                                                  content {
                                                                    null_string = null_value_format_configuration.value["null_string"]
                                                                  }
                                                              } 
                                                              dynamic "numeric_format_configuration" {
                                                                for_each = format_configuration.value.numeric_format_configuration
                                                                  content {
                                                                    number_scale = numeric_format_configuration.value["number_scale"]
                                                                    prefix       = numeric_format_configuration.value["prefix"]
                                                                    suffix       = numeric_format_configuration.value["suffix"]
                                                                    symbol       = numeric_format_configuration.value["symbol"]
                                                                    dynamic "decimal_places_configuration" {
                                                                      for_each = numeric_format_configuration.value.decimal_places_configuration
                                                                        content {
                                                                          decimal_places = numeric_format_configuration.value["decimal_places"]
                                                                        }
                                                                    } 
                                                                    dynamic "negative_value_configuration" {
                                                                      for_each = numeric_format_configuration.value.negative_value_configuration
                                                                        content {
                                                                          display_mode = negative_value_configuration.value["display_mode"]
                                                                        }
                                                                    }
                                                                    dynamic "null_value_format_configuration" {
                                                                      for_each = numeric_format_configuration.value.null_value_format_configuration
                                                                        content {
                                                                          null_string = null_value_format_configuration.value["null_string"]
                                                                        }
                                                                    }
                                                                    dynamic "separator_configuration" {
                                                                      for_each = numeric_format_configuration.value.separator_configuration
                                                                        content {
                                                                          decimal_separator = separator_configuration.value["decimal_separator"]
                                                                          dynamic "thousands_separator" {
                                                                            for_each = separator_configuration.value.thousands_separator
                                                                              content {
                                                                                symbol     = thousands_separator.value["symbol"]
                                                                                visibility = thousands_separator.value["visibility"]
                                                                              }
                                                                          }
                                                                        }
                                                                    }
                                                                     
                                                                  }
                                                              }
                                                            }
                                                        }
                                                      }
                                                  }
                                                  dynamic "numerical_measure_field" {
                                                    for_each = values.value.numerical_measure_field
                                                      content {
                                                        field_id = numerical_measure_field.value["field_id"]
                                                        dynamic "column" {
                                                          for_each = numerical_measure_field.value.column
                                                            content {
                                                              column_name         = column_name.value["column_name"]
                                                              data_set_identifier = column_name.value["data_set_identifier"]
                                                            }
                                                        }
                                                        dynamic "aggregation_function" {
                                                          for_each = numerical_measure_field.value.aggregation_function
                                                            content {
                                                              simple_numerical_aggregation =  aggregation_function.value["simple_numerical_aggregation"]
                                                              dynamic "percentile_aggregation" {
                                                                for_each = aggregation_function.value.percentile_aggregation
                                                                  content {
                                                                    percentile_value = percentile_aggregation.value["percentile_value"]
                                                                  }
                                                              }
                                                            }
                                                        }
                                                        dynamic "format_configuration" {
                                                          for_each = numerical_measure_field.value.format_configuration
                                                            content {
                                                              dynamic "numeric_format_configuration" {
                                                                for_each = format_configuration.value.numeric_format_configuration
                                                                  content {
                                                                    dynamic "currency_display_format_configuration" {
                                                                      for_each = numeric_format_configuration.value.currency_display_format_configuration
                                                                        content {
                                                                          number_scale = currency_display_format_configuration.value["number_scale"]
                                                                          prefix       = currency_display_format_configuration.value["prefix"]
                                                                          suffix       = currency_display_format_configuration.value["suffix"]
                                                                          symbol       = currency_display_format_configuration.value["symbol"]
                                                                          dynamic "decimal_places_configuration" {
                                                                            for_each = currency_display_format_configuration.value.decimal_places_configuration
                                                                              content {
                                                                                decimal_places = decimal_places_configuration.value["decimal_places"]
                                                                              }
                                                                          } 
                                                                          dynamic "negative_value_configuration" {
                                                                            for_each = currency_display_format_configuration.value.negative_value_configuration
                                                                              content {
                                                                                display_mode = negative_value_configuration.value["display_mode"]
                                                                              }
                                                                          }
                                                                          dynamic "null_value_format_configuration" {
                                                                            for_each = currency_display_format_configuration.value.null_value_format_configuration
                                                                              content {
                                                                                null_string = null_value_format_configuration.value["null_string"]
                                                                              }
                                                                          }
                                                                          dynamic "separator_configuration" {
                                                                            for_each = currency_display_format_configuration.value.separator_configuration
                                                                              content {
                                                                                decimal_separator = separator_configuration.value["decimal_separator"]
                                                                                dynamic "thousands_separator" {
                                                                                  for_each = separator_configuration.value.thousands_separator
                                                                                    content {
                                                                                      symbol     = thousands_separator.value["symbol"]
                                                                                      visibility = thousands_separator.value["visibility"]
                                                                                    }
                                                                                }
                                                                              }
                                                                          }
                                                                        }
                                                                    }
                                                                    dynamic "number_display_format_configuration" {
                                                                      for_each = numeric_format_configuration.value.number_display_format_configuration
                                                                        content {
                                                                          number_scale = number_display_format_configuration.value["number_scale"]
                                                                          prefix       = number_display_format_configuration.value["prefix"]
                                                                          suffix       = number_display_format_configuration.value["suffix"]
                                                                          dynamic "decimal_places_configuration" {
                                                                            for_each = number_display_format_configuration.value.decimal_places_configuration
                                                                              content {
                                                                                decimal_places = decimal_places_configuration.value["decimal_places"]
                                                                              }
                                                                          }
                                                                          dynamic "negative_value_configuration" {
                                                                            for_each = number_display_format_configuration.value.negative_value_configuration
                                                                              content {
                                                                                display_mode = negative_value_configuration.value["display_mode"]
                                                                              }
                                                                          }
                                                                          dynamic "null_value_format_configuration" {
                                                                            for_each = number_display_format_configuration.value.null_value_format_configuration
                                                                              content {
                                                                                null_string = null_value_format_configuration.value["null_string"]
                                                                              }
                                                                          }
                                                                          dynamic "separator_configuration" {
                                                                            for_each = number_display_format_configuration.value.separator_configuration
                                                                              content {
                                                                                decimal_separator = separator_configuration.value["decimal_separator"]
                                                                                dynamic "thousands_separator" {
                                                                                  for_each = separator_configuration.value.thousands_separator
                                                                                    content {
                                                                                      symbol     = thousands_separator.value["symbol"]
                                                                                      visibility = thousands_separator.value["visibility"]
                                                                                    }
                                                                                }
                                                                              }
                                                                          }
                                                                        }
                                                                    }
                                                                    dynamic "percentage_display_format_configuration" {
                                                                      for_each = numeric_format_configuration.value.percentage_display_format_configuration
                                                                        content {
                                                                          prefix = percentage_display_format_configuration.value["prefix"]
                                                                          suffix = percentage_display_format_configuration.value["suffix"]
                                                                          dynamic "decimal_places_configuration" {
                                                                            for_each = percentage_display_format_configuration.value.decimal_places_configuration
                                                                              content {
                                                                                decimal_places = decimal_places_configuration.value["decimal_places"]
                                                                              }
                                                                          }
                                                                          dynamic "negative_value_configuration" {
                                                                            for_each = percentage_display_format_configuration.value.negative_value_configuration
                                                                              content {
                                                                                display_mode = negative_value_configuration.value["display_mode"]
                                                                              }
                                                                          }
                                                                          dynamic "null_value_format_configuration" {
                                                                            for_each = percentage_display_format_configuration.value.null_value_format_configuration
                                                                              content {
                                                                                null_string = null_value_format_configuration.value["null_string"]
                                                                              }
                                                                          }
                                                                          dynamic "separator_configuration" {
                                                                            for_each = percentage_display_format_configuration.value.separator_configuration
                                                                              content {
                                                                                decimal_separator = separator_configuration.value["decimal_separator"]
                                                                                dynamic "thousands_separator" {
                                                                                  for_each = separator_configuration.value.thousands_separator
                                                                                    content {
                                                                                      symbol     = thousands_separator.value["symbol"]
                                                                                      visibility = thousands_separator.value["visibility"]
                                                                                    }
                                                                                }
                                                                              }
                                                                          }
                                                                        }
                                                                    }
                                                                  }
                                                              }
                                                            }
                                                        }
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "legend" {
                                  for_each = chart_configuration.value.legend
                                    content {
                                      height     = legend.value["height"]
                                      position   = legend.value["position"]
                                      visibility = legend.value["visibility"]
                                      width      = legend.value["width"]
                                      dynamic "title" {
                                        for_each = legend.value.title
                                          content {
                                            custom_label = title.value["custom_label"]
                                            visibility   = title.value["visibility"]
                                            dynamic "font_configuration" {
                                              for_each =  title.value.font_configuration
                                                content {
                                                  font_color      = font_configuration.value["font_color"]
                                                  font_decoration = font_configuration.value["font_decoration"]
                                                  font_style      = font_configuration.value["font_style"]
                                                  dynamic "font_size" {
                                                    for_each = font_configuration.value.font_size
                                                      content {
                                                        relative = font_size.value["relative"]
                                                      }
                                                  }
                                                  dynamic "font_weight" {
                                                    for_each = font_configuration.value.font_weight
                                                      content {
                                                        name = font_weight.value["name"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "reference_lines" {
                                  for_each = chart_configuration.value.reference_lines
                                    content {
                                      dynamic "data_configuration" {
                                        for_each = reference_lines.value.data_configuration
                                          content {
                                            axis_binding = data_configuration.value["axis_binding"]
                                            dynamic "dynamic_configuration" {
                                              for_each = data_configuration.value.dynamic_configuration
                                                content {
                                                  dynamic "calculation" {
                                                    for_each = dynamic_configuration.value.calculation
                                                      content {
                                                        simple_numerical_aggregation = calculation.value["simple_numerical_aggregation"]
                                                        dynamic "percentile_aggregation" {
                                                          for_each = calculation.value.percentile_aggregation
                                                            content {
                                                              percentile_value = percentile_aggregation.value["percentile_value"]
                                                            }
                                                        }
                                                      }
                                                  }
                                                  dynamic "column" {
                                                    for_each = dynamic_configuration.value.column
                                                      content {
                                                        column_name         = column.value["column_name"]
                                                        data_set_identifier = column.value["data_set_identifier"]
                                                      }
                                                  }
                                                  dynamic "measure_aggregation_function" {
                                                    for_each = dynamic_configuration.value.measure_aggregation_function
                                                      content {
                                                        categorical_aggregation_function = measure_aggregation_function.value["categorical_aggregation_function"]
                                                        date_aggregation_function        = measure_aggregation_function.value["date_aggregation_function"]
                                                        dynamic "numerical_aggregation_function" {
                                                          for_each = measure_aggregation_function.value.numerical_aggregation_function
                                                            content {
                                                              simple_numerical_aggregation = numerical_aggregation_function.value["simple_numerical_aggregation"]
                                                              dynamic "percentile_aggregation" {
                                                                for_each = numerical_aggregation_function.value.percentile_aggregation
                                                                  content {
                                                                    percentile_value = percentile_aggregation.value["percentile_value"]
                                                                  }
                                                              }
                                                            }
                                                        }
                                                      }
                                                  }
                                                }
                                            }
                                            dynamic "static_configuration" {
                                              for_each = data_configuration.value.static_configuration
                                                content {
                                                  value = static_configuration.value["value"]
                                                }
                                            }
                                          }
                                      }
                                      dynamic "label_configuration" {
                                        for_each = reference_lines.value.label_configuration
                                          content {
                                            font_color          = label_configuration.value["font_color"]
                                            horizontal_position = label_configuration.value["horizontal_position"]
                                            dynamic "custom_label_configuration" {
                                              for_each = label_configuration.value.custom_label_configuration
                                                content {
                                                  custom_label = custom_label_configuration.value["custom_label"]
                                                }
                                            }
                                            dynamic "value_label_configuration" {
                                              for_each = label_configuration.value.value_label_configuration
                                                content {
                                                  relative_position = value_label_configuration.value["relative_position"]
                                                  dynamic "format_configuration" {
                                                    for_each = value_label_configuration.value.format_configuration
                                                      content {
                                                        dynamic "currency_display_format_configuration" {
                                                          for_each = format_configuration.value.currency_display_format_configuration
                                                            content {
                                                              number_scale = currency_display_format_configuration.value["number_scale"]
                                                              prefix       = currency_display_format_configuration.value["prefix"]
                                                              suffix       = currency_display_format_configuration.value["suffix"]
                                                              symbol       = currency_display_format_configuration.value["symbol"]
                                                              dynamic "decimal_places_configuration" {
                                                                for_each = currency_display_format_configuration.value.decimal_places_configuration
                                                                  content {
                                                                    decimal_places = decimal_places_configuration.value["decimal_places"]
                                                                  }
                                                              } 
                                                              dynamic "negative_value_configuration" {
                                                                for_each = currency_display_format_configuration.value.negative_value_configuration
                                                                  content {
                                                                    display_mode = negative_value_configuration.value["display_mode"]
                                                                  }
                                                              }
                                                              dynamic "null_value_format_configuration" {
                                                                for_each = currency_display_format_configuration.value.null_value_format_configuration
                                                                  content {
                                                                    null_string = null_value_format_configuration.value["null_string"]
                                                                  }
                                                              }
                                                              dynamic "separator_configuration" {
                                                                for_each = currency_display_format_configuration.value.separator_configuration
                                                                  content {
                                                                    decimal_separator = separator_configuration.value["decimal_separator"]
                                                                    dynamic "thousands_separator" {
                                                                      for_each = separator_configuration.value.thousands_separator
                                                                        content {
                                                                          symbol     = thousands_separator.value["symbol"]
                                                                          visibility = thousands_separator.value["visibility"]
                                                                        }
                                                                    }
                                                                  }
                                                              }
                                                            }
                                                        }
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "small_multiples_options" {
                                  for_each = chart_configuration.value.small_multiples_options
                                    content {

                                    }
                                }
                                dynamic "sort_configuration" {
                                  for_each = chart_configuration.value.sort_configuration
                                    content {

                                    }
                                }
                                dynamic "tooltip" {
                                  for_each = chart_configuration.value.tooltip
                                    content {

                                    }
                                }
                                dynamic "value_axis" {
                                  for_each = chart_configuration.value.value_axis
                                    content {

                                    }
                                }
                                dynamic "value_label_options" {
                                  for_each = chart_configuration.value.value_label_options
                                    content {

                                    }
                                }
                                dynamic "visual_palette" {
                                  for_each = chart_configuration.value.visual_palette
                                    content {

                                    }
                                }
                              }
                          }
                          dynamic "column_hierarchies" {
                            for_each = bar_chart_visual.value.column_hierarchies
                              content {
                                
                              }
                          }
                          dynamic "subtitle" {
                            for_each = bar_chart_visual.value.subtitle
                              content {

                              }
                          }
                          dynamic "title" {
                            for_each = bar_chart_visual.value.title
                              content {

                              }
                          }
                        }
                    }
                    dynamic "box_plot_visual" {
                      for_each = visuals.value.box_plot_visual
                        content {
                          
                        }
                    }
                    dynamic "combo_chart_visual" {
                      for_each = visuals.value.combo_chart_visual
                        content {
                          
                        }
                    }
                    dynamic "custom_content_visual" {
                      for_each = visuals.value.custom_content_visual
                        content {
                          
                        }
                    }
                    dynamic "empty_visual" {
                      for_each = visuals.value.empty_visual
                        content {
                          
                        }
                    }
                    dynamic "filled_map_visual" {
                      for_each = visuals.value.filled_map_visual
                        content {
                          
                        }
                    }
                    dynamic "funnel_chart_visual" {
                      for_each = visuals.value.funnel_chart_visual
                        content {
                          
                        }
                    }
                    dynamic "gauge_chart_visual" {
                      for_each = visuals.value.gauge_chart_visual
                        content {
                          
                        }
                    }
                    dynamic "geospatial_map_visual" {
                      for_each = visuals.value.geospatial_map_visual
                        content {
                          
                        }
                    }
                    dynamic "heat_map_visual" {
                      for_each = visuals.value.heat_map_visual
                        content {
                          
                        }
                    }
                    dynamic "histogram_visual" {
                      for_each = visuals.value.histogram_visual
                        content {
                          
                        }
                    }
                    dynamic "insight_visual" {
                      for_each = visuals.value.insight_visual
                        content {
                          
                        }
                    }
                    dynamic "kpi_visual" {
                      for_each = visuals.value.kpi_visual
                        content {
                          
                        }
                    }
                    dynamic "line_chart_visual" {
                      for_each = visuals.value.line_chart_visual
                        content {
                          
                        }
                    }
                    dynamic "pie_chart_visual" {
                      for_each = visuals.value.pie_chart_visual
                        content {
                          
                        }
                    }
                    dynamic "pivot_table_visual" {
                      for_each = visuals.value.pivot_table_visual
                        content {
                          
                        }
                    }
                    dynamic "radar_chart_visual" {
                      for_each = visuals.value.radar_chart_visual
                        content {
                          
                        }
                    }
                    dynamic "sankey_diagram_visual" {
                      for_each = visuals.value.sankey_diagram_visual
                        content {
                          
                        }
                    }
                    dynamic "scatter_plot_visual" {
                      for_each = visuals.value.scatter_plot_visual
                        content {
                          
                        }
                    }
                    dynamic "table_visual" {
                      for_each = visuals.value.table_visual
                        content {
                          
                        }
                    }
                    dynamic "tree_map_visual" {
                      for_each = visuals.value.tree_map_visual
                        content {
                          
                        }
                    }
                    dynamic "waterfall_visual" {
                      for_each = visuals.value.waterfall_visual
                        content {
                          
                        }
                    }
                    dynamic "word_cloud_visual" {
                      for_each = visuals.value.word_cloud_visual
                        content {
                          
                        }
                    }
                  }
              }
            }
         }
      }
      dynamic "permissions" {
        for_each = var.quicksight_template_permissions
          content {
            actions   = permissions.value["actions"]
            principal = permissions.value["principal"]
          }
      }
      dynamic "source_entity" {
        for_each = var.quicksight_template_source_entity
          content {
            dynamic "source_analysis" {
              for_each = source_entity.value.source_analysis
                content {
                  arn = source_analysis.value["arn"] 
                  dynamic "data_set_references" {
                    for_each = source_analysis.value.data_set_references
                      content {
                        data_set_arn         = data_set_references.value["data_set_arn"]
                        data_set_placeholder = data_set_references.value["data_set_placeholder"]
                      }
                  }
                }
            }
            dynamic "source_template" {
              for_each = source_entity.value.source_template
                content {
                  arn = source_template.value["arn"]
                }
            }
          }
      }

}
