resource "aws_ecr_pull_time_update_exclusion" "ecr_pull_time_update_exclusion" {
  principal_arn = var.ecr_pull_time_update_exclusion_principal_arn
}
