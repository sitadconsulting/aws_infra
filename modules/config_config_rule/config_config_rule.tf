resource "aws_config_config_rule" "config_config_rule" {
  description                 = var.config_config_rule_description
  input_parameters            = var.config_config_rule_input_parameters
  maximum_execution_frequency = var.config_config_rule_maximum_execution_frequency 
  name                        = var.config_config_rule_name
  tags                        = var.config_config_rule_tags


  dynamic "evaluation_mode" {
    for_each = var.config_config_rule_evaluation_mode
      content {
        mode = evaluation_mode.value["mode"]
      }
  }
  dynamic "scope" {
    for_each = var.config_config_rule_scope
      content {
        compliance_resource_id    = scope.value["compliance_resource_id"]
        compliance_resource_types = scope.value["compliance_resource_types"]
        tag_key                   = scope.value["tag_key"]
        tag_value                 = scope.value["tag_value"]
      }
  }
  dynamic "source" {
    for_each = var.config_config_rule_source
      content {
        owner             = source.value["owner"]
        source_identifier = source.value["source_identifier"]
         dynamic "custom_policy_details" {
          for_each = source.value.custom_policy_details
            content {
              enable_debug_log_delivery = custom_policy_details.value["enable_debug_log_delivery"]
              policy_runtime            = custom_policy_details.value["policy_runtime"]
              policy_text               = custom_policy_details.value["policy_text"]
            }
        }
        dynamic "source_detail" {
          for_each = source.value.source_detail
            content {
              event_source                = source_detail.value["event_source"]
              maximum_execution_frequency = source_detail.value["maximum_execution_frequency"]
              message_type                = source_detail.value["message_type"]
            }
        }
      }
  }
}
