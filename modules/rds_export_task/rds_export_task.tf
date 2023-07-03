resource "aws_rds_export_task" "rds_export_task" {
  export_only            = var.rds_export_task_export_only
  export_task_identifier = var.rds_export_task_export_task_identifier
  iam_role_arn           = var.rds_export_task_iam_role_arn
  kms_key_id             = var.rds_export_task_kms_key_id
  s3_bucket_name         = var.rds_export_task_s3_bucket_name
  s3_prefix              = var.rds_export_task_s3_prefix
  source_arn             = var.rds_export_task_source_arn
}
