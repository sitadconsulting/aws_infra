resource "aws_dynamodb_table_replica" "dynamodb_table_replica" {
  deletion_protection_enabled = var.dynamodb_table_replica_deletion_protection_enabled
  global_table_arn            = var.dynamodb_table_replica_global_table_arn
  kms_key_arn                 = var.dynamodb_table_replica_kms_key_arn
  point_in_time_recovery      = var.dynamodb_table_replica_point_in_time_recovery 
  table_class_override        = var.dynamodb_table_replica_table_class_override
  tags                        = var.dynamodb_table_replica_tags 
}
