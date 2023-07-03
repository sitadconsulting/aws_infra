resource "aws_glue_trigger" "glue_trigger" {
  description              = var.glue_trigger_description
  enabled                  = var.glue_trigger_enabled
  name                     = var.glue_trigger_name
  schedule                 = var.glue_trigger_schedule
  start_on_creation        = var.glue_trigger_start_on_creation
  tags                     = var.glue_trigger_tags
  type                     = var.glue_trigger_type
  workflow_name            = var.glue_trigger_workflow_name

  dynamic "actions" {
    for_each = var.glue_trigger_actions
      content {
        arguments              = actions.value["arguments"]
        crawler_name           = actions.value["crawler_name"]
        job_name               = actions.value["job_name"]
        timeout                = actions.value["timeout"]
        security_configuration = actions.value["security_configuration"]
        dynamic "notification_property" {
          for_each = actions.value.notification_property
            content {
              notify_delay_after = notification_property.value["notify_delay_after"]
            }
        }
      }
  }
  dynamic "event_batching_condition" {
    for_each = var.glue_trigger_event_batching_condition
      content {
        batch_size   = event_batching_condition.value["batch_size"]
        batch_window = event_batching_condition.value["batch_window"]
      }
  }
  dynamic "predicate" {
    for_each = var.glue_trigger_predicate
      content {
        logical = predicate.value["logical"]
        dynamic "condition" {
          for_each = predicate.value.condition
            content {
              crawler_name     = condition.value["crawler_name"]
              crawler_state    = condition.value["crawler_state"]
              job_name         = condition.value["job_name"]
              logical_operator = condition.value["logical_operator"]
              state            = condition.value["state"]
            }
        } 
      }
  }
}
