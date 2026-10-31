resource "aws_cloudwatch_metric_alarm" "cloudwatch_metric_alarm" {
  actions_enabled                       = var.cloudwatch_metric_alarm_actions_enabled
  alarm_actions                         = var.cloudwatch_metric_alarm_alarm_actions
  alarm_description                     = var.cloudwatch_metric_alarm_alarm_description
  alarm_name                            = var.cloudwatch_metric_alarm_alarm_name
  comparison_operator                   = var.cloudwatch_metric_alarm_comparison_operator
  datapoints_to_alarm                   = var.cloudwatch_metric_alarm_datapoints_to_alarm
  dimensions                            = var.cloudwatch_metric_alarm_dimensions
  evaluate_low_sample_count_percentiles = var.cloudwatch_metric_alarm_evaluate_low_sample_count_percentiles
  evaluation_interval                   = var.cloudwatch_metric_alarm_evaluation_interval
  evaluation_periods                    = var.cloudwatch_metric_alarm_evaluation_periods
  extended_statistic                    = var.cloudwatch_metric_alarm_extended_statistic
  insufficient_data_actions             = var.cloudwatch_metric_alarm_insufficient_data_actions
  metric_name                           = var.cloudwatch_metric_alarm_metric_name
  namespace                             = var.cloudwatch_metric_alarm_namespace
  ok_actions                            = var.cloudwatch_metric_alarm_ok_actions
  period                                = var.cloudwatch_metric_alarm_period
  statistic                             = var.cloudwatch_metric_alarm_statistic
  tags                                  = var.cloudwatch_metric_alarm_tags
  threshold                             = var.cloudwatch_metric_alarm_threshold
  threshold_metric_id                   = var.cloudwatch_metric_alarm_threshold_metric_id
  treat_missing_data                    = var.cloudwatch_metric_alarm_treat_missing_data
  unit                                  = var.cloudwatch_metric_alarm_unit 

  dynamic "evaluation_criteria" {
    for_each = var.cloudwatch_metric_alarm_evaluation_criteria
      content {
        dynamic "promql_criteria" {
          for_each = evaluation_criteria.value.promql_criteria
            content {
              pending_period  = promql_criteria.value["pending_period"]
              query           = promql_criteria.value["query"]
              recovery_period = promql_criteria.value["recovery_period"]
            }
        }
      }
  } 
  dynamic "evaluation_window" {
    for_each = var.cloudwatch_metric_alarm_evaluation_window
      content {
        dynamic "wall_clock_window" {
          for_each = evaluation_window.value.wall_clock_window
            content {
              timezone = wall_clock_window.value["timezone"]
            }
        } 
      }
  }
  dynamic "metric_query" {
    for_each = var.cloudwatch_metric_alarm_metric_query
      content {
        account_id  = metric_query.value["account_id"]
        expression  = metric_query.value["expression"]
        id          = metric_query.value["id"]
        label       = metric_query.value["label"]
        period      = metric_query.value["period"]
        return_data = metric_query.value["return_data"]
        dynamic "metric" {
          for_each = metric_query.value.metric
            content {
              dimensions  = metric.value["dimensions"]
              metric_name = metric.value["metric_name"]
              namespace   = metric.value["namespace"]
              period      = metric.value["period"]
              stat        = metric.value["stat"]
              unit        = metric.value["unit"]
            }
        }     
      }
  }
  dynamic "warm_up_configuration" {
    for_each = var.cloudwatch_metric_alarm_warm_up_configuration
      content {
        only_start_evaluating_after_warm_up_period_ends = warm_up_configuration.value["only_start_evaluating_after_warm_up_period_ends"]
        warm_up_period_duration_in_minutes              = warm_up_configuration.value["warm_up_period_duration_in_minutes"]
      }
  }
}
