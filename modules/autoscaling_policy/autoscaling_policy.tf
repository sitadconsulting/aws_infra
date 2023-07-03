resource "aws_autoscaling_policy" "autoscaling_policy" {
  autoscaling_group_name    = var.autoscaling_policy_autoscaling_group_name
  cooldown                  = var.autoscaling_policy_cooldown
  enabled                   = var.autoscaling_policy_enabled
  estimated_instance_warmup = var.autoscaling_policy_estimated_instance_warmup
  metric_aggregation_type   = var.autoscaling_policy_metric_aggregation_type
  min_adjustment_magnitude  = var.autoscaling_policy_min_adjustment_magnitude
  name                      = var.autoscaling_policy_name
  policy_type               = var.autoscaling_policy_policy_type
  scaling_adjustment        = var.autoscaling_policy_scaling_adjustment

  dynamic "predictive_scaling_configuration" {
    for_each = var.autoscaling_policy_predictive_scaling_configuration
      content {
        max_capacity_breach_behavior = predictive_scaling_configuration.value["max_capacity_breach_behavior"]
        max_capacity_buffer          = predictive_scaling_configuration.value["max_capacity_buffer"]
        mode                         = predictive_scaling_configuration.value["mode"]
        scheduling_buffer_time       = predictive_scaling_configuration.value["scheduling_buffer_time"]
        dynamic "metric_specification" {
          for_each = predictive_scaling_configuration.value.metric_specification
            content {
              target_value = metric_specification.value["target_value"]
              dynamic "customized_capacity_metric_specification" {
                for_each = metric_specification.value.customized_capacity_metric_specification
                  content {
                    dynamic "metric_data_queries" {
                      for_each = customized_capacity_metric_specification.value.metric_data_queries
                        content {
                          expression  = metric_data_queries.value["expression"]
                          id          = metric_data_queries.value["id"]
                          label       = metric_data_queries.value["label"]
                          return_data = metric_data_queries.value["return_data"]
                          dynamic "metric_stat" {
                            for_each = metric_data_queries.value.metric_stat
                              content {
                                stat = metric_stat.value["stat"]
                                unit = metric_stat.value["unit"]
                                dynamic "metric" {
                                  for_each = metric_stat.value.metric
                                    content {
                                      metric_name = metric.value["metric_name"]
                                      namespace   = metric.value["namespace"]
                                      dynamic "dimensions" {
                                        for_each = metric.value.dimensions
                                          content {
                                            name  = dimensions.value["name"]
                                            value = dimensions.value["value"]
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
              dynamic "customized_load_metric_specification" {
                for_each = metric_specification.value.customized_load_metric_specification
                  content {
                    dynamic "metric_data_queries" {
                      for_each = customized_capacity_metric_specification.value.metric_data_queries
                        content {
                          expression  = metric_data_queries.value["expression"]
                          id          = metric_data_queries.value["id"]
                          label       = metric_data_queries.value["label"]
                          return_data = metric_data_queries.value["return_data"]
                          dynamic "metric_stat" {
                            for_each = metric_data_queries.value.metric_stat
                              content {
                                stat = metric_stat.value["stat"]
                                unit = metric_stat.value["unit"]
                                dynamic "metric" {
                                  for_each = metric_stat.value.metric
                                    content {
                                      metric_name = metric.value["metric_name"]
                                      namespace   = metric.value["namespace"]
                                      dynamic "dimensions" {
                                        for_each = metric.value.dimensions
                                          content {
                                            name  = dimensions.value["name"]
                                            value = dimensions.value["value"]
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
              dynamic "customized_scaling_metric_specification" {
                for_each = metric_specification.value.customized_scaling_metric_specification
                  content {
                    dynamic "metric_data_queries" {
                      for_each = customized_capacity_metric_specification.value.metric_data_queries
                        content {
                          expression  = metric_data_queries.value["expression"]
                          id          = metric_data_queries.value["id"]
                          label       = metric_data_queries.value["label"]
                          return_data = metric_data_queries.value["return_data"]
                          dynamic "metric_stat" {
                            for_each = metric_data_queries.value.metric_stat
                              content {
                                stat = metric_stat.value["stat"]
                                unit = metric_stat.value["unit"]
                                dynamic "metric" {
                                  for_each = metric_stat.value.metric
                                    content {
                                      metric_name = metric.value["metric_name"]
                                      namespace   = metric.value["namespace"]
                                      dynamic "dimensions" {
                                        for_each = metric.value.dimensions
                                          content {
                                            name  = dimensions.value["name"]
                                            value = dimensions.value["value"]
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
              dynamic "predefined_load_metric_specification" {
                for_each = metric_specification.value.predefined_load_metric_specification
                  content {
                    predefined_metric_type = predefined_load_metric_specification.value["predefined_metric_type"]
                    resource_label         = predefined_load_metric_specification.value["resource_label"]
                  }
              }
              dynamic "predefined_metric_pair_specification" {
                for_each = metric_specification.value.predefined_metric_pair_specification
                  content {
                    predefined_metric_type = predefined_metric_pair_specification.value["predefined_metric_type"]
                    resource_label         = predefined_metric_pair_specification.value["resource_label"]
                  }
              }
              dynamic "predefined_scaling_metric_specification" {
                for_each = metric_specification.value.predefined_scaling_metric_specification
                  content {
                    predefined_metric_type = predefined_scaling_metric_specification.value["predefined_metric_type"]
                    resource_label         = predefined_scaling_metric_specification.value["resource_label"]
                  }
              }
           }
        }
      }
  }
  dynamic "step_adjustment" {
    for_each = var.autoscaling_policy_step_adjustment
      content {
        metric_interval_lower_bound = step_adjustment.value["metric_interval_lower_bound"]
        metric_interval_upper_bound = step_adjustment.value["metric_interval_upper_bound"]
        scaling_adjustment          = step_adjustment.value["scaling_adjustment"]
      }
  }
  dynamic "target_tracking_configuration" {
    for_each = var.autoscaling_policy_target_tracking_configuration
      content {
        disable_scale_in = target_tracking_configuration.value["disable_scale_in"]
        target_value     = target_tracking_configuration.value["target_value"]
        dynamic "customized_metric_specification" {
          for_each = target_tracking_configuration.value.customized_metric_specification
            content {
              metric_name = customized_metric_specification.value["metric_name"]
              namespace   = customized_metric_specification.value["namespace"]
              statistic   = customized_metric_specification.value["statistic"]
              unit        = customized_metric_specification.value["unit"]
              dynamic "metric_dimension" {
                for_each = customized_metric_specification.value.metric_dimension
                  content {
                    name  = metric_dimension.value["name"]
                    value = metric_dimension.value["value"]
                  }
              }
              dynamic "metrics" {
                for_each = customized_metric_specification.value.metrics
                  content {
                    expression  = metrics.value["expression"]
                    id          = metrics.value["id"]
                    label       = metrics.value["label"]
                    return_data = metrics.value["return_data"]
                    dynamic "metric_stat" {
                      for_each = metrics.value.metric_stat
                        content {
                          stat = metric_stat.value["stat"]
                          unit = metric_stat.value["unit"]
                          dynamic "metric" {
                            for_each = metric_stat.value.metric
                              content {
                                metric_name = metric.value["metric_name"]
                                namespace   = metric.value["namespace"]
                                dynamic "dimensions" {
                                  for_each = metric.value.dimensions 
                                    content {
                                      name  = dimensions.value["name"]
                                      value = dimensions.value["value"]
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
        dynamic "predefined_metric_specification" {
          for_each = target_tracking_configuration.value.predefined_metric_specification           
            content {
              predefined_metric_type = predefined_metric_specification.value["predefined_metric_type"]
              resource_label         = predefined_metric_specification.value["resource_label"]
            }
        }
      }
  }
}


