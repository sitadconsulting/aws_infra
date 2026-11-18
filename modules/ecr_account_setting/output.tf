output "ecr_account_setting_id" {
  description = "Name of the account setting"
  value       = element(concat(aws_ecr_account_setting.ecr_account_setting.*.id, [""]), 0)
}
