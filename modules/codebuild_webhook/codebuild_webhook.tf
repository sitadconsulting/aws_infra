resource "aws_codebuild_webhook" "codebuild_webhook" {
  branch_filter             = var.codebuild_webhook_branch_filter
  build_type                = var.codebuild_webhook_build_type
  manual_creation           = var.codebuild_webhook_manual_creation
  project_name              = var.codebuild_webhook_project_name

  dynamic "filter_group" {
    for_each = var.codebuild_webhook_codebuild_webhook
      content {
        dynamic "filter" {
          for_each = filter_group.value.filter
            content {
              type                    = filter.value["type"]
              pattern                 = filter.value["pattern"]
              exclude_matched_pattern = filter.value["exclude_matched_pattern"]
            }
        }
      }
  }
  dynamic "scope_configuration" {
    for_each = var.codebuild_webhook_scope_configuration
      content {
        name   = scope_configuration.value["name"]
        scope  = scope_configuration.value["scope"]
        domain = scope_configuration.value["domain"]
      }
  }
  dynamic "pull_request_build_policy" {
    for_each = var.codebuild_webhook_pull_request_build_policy
      content {
        requires_comment_approval = pull_request_build_policy.value["requires_comment_approval"]
        approver_roles            = pull_request_build_policy.value["approver_roles"]
      }
  }
}
