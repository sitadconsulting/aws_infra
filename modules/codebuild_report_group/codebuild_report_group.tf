resource "aws_codebuild_report_group" "codebuild_report_group" {
  delete_reports = var.codebuild_report_group_delete_reports
  name           = var.codebuild_report_group_name
  type           = var.codebuild_report_group_type
  tags           = var.codebuild_report_group_tags


  dynamic "export_config" {
    for_each = var.codebuild_report_group_export_config
      content {
        type    = export_config.value["type"]
        dynamic "s3_destination" {
          for_each = export_config.value.s3_destination
            content {
              bucket              = s3_destination.value["bucket"]
              encryption_key      = s3_destination.value["encryption_key"]
              encryption_disabled = s3_destination.value["encryption_disabled"]
              packaging           = s3_destination.value["packaging"]
              path                = s3_destination.value["path"]
            }
        }
      }
  }
}
