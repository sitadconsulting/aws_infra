resource "aws_backup_restore_testing_selection" "backup_restore_testing_selection" {
  iam_role_arn               = var.backup_restore_testing_selection_iam_role_arn
  name                       = var.backup_restore_testing_selection_name
  protected_resource_arns    = var.backup_restore_testing_selection_protected_resource_arns
  protected_resource_type    = var.backup_restore_testing_selection_protected_resource_type
  restore_metadata_overrides = var.backup_restore_testing_selection_restore_metadata_overrides
  restore_testing_plan_name  = var.backup_restore_testing_selection_restore_testing_plan_name
  validation_window_hours    = var.backup_restore_testing_selection_validation_window_hours 


  dynamic "protected_resource_conditions" {
    for_each = var.backup_restore_testing_selection_protected_resource_conditions
      content {
        dynamic "string_equals" {
          for_each = protected_resource_conditions.value.string_equals
            content {
              key   = string_equals.value["key"]
              value = string_equals.value["value"]
            }
        }
        dynamic "string_not_equals" {
          for_each = protected_resource_conditions.value.string_not_equals
            content {
              key   = string_not_equals.value["key"]
              value = string_not_equals.value["value"]
            }
        }
      }
  }
}
