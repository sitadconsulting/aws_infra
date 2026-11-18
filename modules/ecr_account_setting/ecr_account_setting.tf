resource "aws_ecr_account_setting" "ecr_account_setting" {
  name  = var.ecr_account_setting_name
  value = var.ecr_account_setting_value
}
