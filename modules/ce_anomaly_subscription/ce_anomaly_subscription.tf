resource "aws_ce_anomaly_subscription" "ce_anomaly_subscription" {
  account_id       = var.ce_anomaly_subscription_account_id
  frequency        = var.ce_anomaly_subscription_frequency
  monitor_arn_list = var.ce_anomaly_subscription_monitor_arn_list
  name             = var.ce_anomaly_subscription_name
  tags             = var.ce_anomaly_subscription_tags

  dynamic "subscriber" {
    for_each = var.ce_anomaly_subscription_subscriber
      content {
        type    = subscriber.value["type"]
        address = subscriber.value["address"]
      }
  }
  dynamic "threshold_expression" {
    for_each = var.ce_anomaly_subscription_threshold_expression
      content {
        and     = threshold_expression.value["and"]
        not     = threshold_expression.value["not"]
        or      = threshold_expression.value["or"]
        dynamic "cost_category" {
          for_each = threshold_expression.value.cost_category
            content {
              key           = cost_category.value["key"]
              match_options = cost_category.value["match_options"]
              values        = cost_category.value["values"]
            }
        }
        dynamic "dimension" {
          for_each = threshold_expression.value.dimension
            content {
              key           = dimension.value["key"]
              match_options = dimension.value["match_options"]
              values        = dimension.value["values"]
            }
        }
        dynamic "tags" {
          for_each = threshold_expression.value.tags
            content {
              key           = tags.value["key"]
              match_options = tags.value["match_options"]
              values        = tags.value["values"]
            }
        }
      }
  }
}
