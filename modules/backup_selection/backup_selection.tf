resource "aws_backup_selection" "backup_selection" {
  iam_role_arn  = var.backup_selection_iam_role_arn
  name          = var.backup_selection_name
  not_resources = var.backup_selection_not_resources
  plan_id       = var.backup_selection_plan_id
  resources     = var.backup_selection_resources
  
  dynamic "condition" {
    for_each = var.backup_selection_condition
      content {
        dynamic "string_equals" {
          for_each = condition.value.string_equals
            content {
              key   = string_equals.value["key"]
              value = string_equals.value["value"]
            }
        }
        dynamic "string_like" {
          for_each = condition.value.string_like
            content {
              key   = string_like.value["key"]
              value = string_like.value["value"]
            }
        }
        dynamic "string_not_equals" {
          for_each = condition.value.string_not_equals
            content {
              key   = string_not_equals.value["key"]
              value = string_not_equals.value["value"]
            }
        }
        dynamic "string_not_like" {
          for_each = condition.value.string_not_like
            content {
              key   = string_not_like.value["key"]
              value = string_not_like.value["value"]
            }
        }
      }
  }
  dynamic "selection_tag" {
    for_each = var.backup_selection_selection_tag
      content {
        key   = selection_tag.value["key"] 
        type  = selection_tag.value["type"]
        value = selection_tag.value["value"]
      }
  }
}
