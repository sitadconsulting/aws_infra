resource "aws_backup_report_plan" "backup_report_plan" {
  description = var.backup_report_plan_description
  name        = var.backup_report_plan_name
  tags        = var.backup_report_plan_tags  

  dynamic "report_delivery_channel" {
    for_each = var.backup_report_plan_report_delivery_channel
      content {
        formats        = report_delivery_channel.value["formats"]
        s3_bucket_name = report_delivery_channel.value["s3_bucket_name"]
        s3_key_prefix  = report_delivery_channel.value["s3_key_prefix"]
      }
  }
  dynamic "report_setting" {
    for_each = var.backup_report_plan_report_setting
      content {
        accounts             = report_setting.value["accounts"]
        framework_arns       = report_setting.value["framework_arns"]
        number_of_frameworks = report_setting.value["number_of_frameworks"]
        organization_units   = report_setting.value["organization_units"]
        regions              = report_setting.value["regions"]
        report_template      = report_setting.value["report_template"]
      }
  }
}
