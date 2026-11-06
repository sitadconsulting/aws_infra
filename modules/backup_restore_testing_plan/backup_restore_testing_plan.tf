resource "aws_backup_restore_testing_plan" "backup_restore_testing_plan" {
  name                         = var.backup_restore_testing_plan_name
  schedule_expression          = var.backup_restore_testing_plan_schedule_expression
  schedule_expression_timezone = var.backup_restore_testing_plan_schedule_expression_timezone
  start_window_hours           = var.backup_restore_testing_plan_start_window_hours
  tags                         = var.backup_restore_testing_plan_tags

  dynamic "recovery_point_selection" {
    for_each = var.backup_restore_testing_plan_recovery_point_selection
      content {
        algorithm             = recovery_point_selection.value["algorithm"]
        exclude_vaults        = recovery_point_selection.value["exclude_vaults"]
        include_vaults        = recovery_point_selection.value["include_vaults"]
        recovery_point_types  = recovery_point_selection.value["recovery_point_types"]
        selection_window_days = recovery_point_selection.value["selection_window_days"]
      }
  }
}
