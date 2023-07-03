resource "aws_rds_cluster_activity_stream" "rds_cluster_activity_stream" {
  resource_arn                        = var.rds_cluster_activity_stream_resource_arn
  mode                                = var.rds_cluster_activity_stream_mode
  kms_key_id                          = var.rds_cluster_activity_stream_kms_key_id
  engine_native_audit_fields_included = var.rds_cluster_activity_stream_engine_native_audit_fields_included
}
