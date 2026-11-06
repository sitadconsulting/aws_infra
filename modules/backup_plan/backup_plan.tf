resource "aws_backup_plan" "backup_plan" {
  name = var.backup_plan_name  
  tags = var.backup_plan_tags  

  dynamic "advanced_backup_setting" {
    for_each = var.backup_plan_advanced_backup_setting
      content {
        backup_options = advanced_backup_setting.value["backup_options"]
        resource_type  = advanced_backup_setting.value["resource_type"]
      }
  }
  dynamic "rule" {
    for_each = var.backup_plan_rule
      content {
        completion_window                            = rule.value["completion_window"]
        enable_continuous_backup                     = rule.value["enable_continuous_backup"]
        recovery_point_tags                          = rule.value["recovery_point_tags"]
        rule_name                                    = rule.value["rule_name"]
        schedule                                     = rule.value["schedule"] 
        schedule_expression_timezone                 = rule.value["schedule_expression_timezone"]
        start_window                                 = rule.value["start_window"]
        target_logically_air_gapped_backup_vault_arn = rule.value["target_logically_air_gapped_backup_vault_arn"]
        target_vault_name                            = rule.value["target_vault_name"]
        dynamic "copy_action" {
          for_each = rule.value.copy_action
            content {
              destination_vault_arn = copy_action.value["destination_vault_arn"]
              dynamic "lifecycle" {
                for_each = copy_action.value.lifecycle
                  content {
                    cold_storage_after                        = lifecycle.value["cold_storage_after"]
                    delete_after                              = lifecycle.value["delete_after"]
                    opt_in_to_archive_for_supported_resources = lifecycle.value["opt_in_to_archive_for_supported_resources"]
                  }
              }
            }
        }
        dynamic "lifecycle" {
          for_each = rule.value.lifecycle
            content {
              cold_storage_after                        = lifecycle.value["cold_storage_after"]
              delete_after                              = lifecycle.value["delete_after"]
              opt_in_to_archive_for_supported_resources = lifecycle.value["opt_in_to_archive_for_supported_resources"]
            }
        }
        dynamic "scan_action" {
          for_each = rule.value.scan_action
            content {
              malware_scanner = scan_action.value["malware_scanner"]
              scan_mode       = scan_action.value["scan_mode"]
            }
        }
      }
  }
  dynamic "scan_setting" {
    for_each = var.backup_plan_scan_setting
      content {
        malware_scanner  = scan_setting.value["malware_scanner"]
        resource_types   = scan_setting.value["resource_types"]
        scanner_role_arn = scan_setting.value["scanner_role_arn"]
      }
  }
}
