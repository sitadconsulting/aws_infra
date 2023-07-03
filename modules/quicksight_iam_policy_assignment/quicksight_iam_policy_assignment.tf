resource "aws_quicksight_iam_policy_assignment" "quicksight_iam_policy_assignment" {
  assignment_name   = var.quicksight_iam_policy_assignment_assignment_name
  assignment_status = var.quicksight_iam_policy_assignment_assignment_status
  aws_account_id    = var.quicksight_iam_policy_assignment_aws_account_id
  namespace         = var.quicksight_iam_policy_assignment_namespace
  policy_arn        = var.quicksight_iam_policy_assignment_policy_arn


  dynamic "identities" {
    for_each = var.quicksight_iam_policy_assignment_identities
      content {
        user  = identities.value["user"]
        group = identities.value["group"]
      }
  }
}
