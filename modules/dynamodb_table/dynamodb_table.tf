resource "aws_dynamodb_table" "dynamodb_table" {
  billing_mode                = var.dynamodb_table_billing_mode
  deletion_protection_enabled = var.dynamodb_table_deletion_protection_enabled
  hash_key                    = var.dynamodb_table_hash_key
  name                        = var.dynamodb_table_name
  range_key                   = var.dynamodb_table_range_key
  read_capacity               = var.dynamodb_table_read_capacity
  restore_date_time           = var.dynamodb_table_restore_date_time
  restore_source_name         = var.dynamodb_table_restore_source_name
  restore_to_latest_time      = var.dynamodb_table_restore_to_latest_time
  stream_enabled              = var.dynamodb_table_stream_enabled
  stream_view_type            = var.dynamodb_table_stream_view_type 
  table_class                 = var.dynamodb_table_table_class
  tags                        = var.dynamodb_table_tags
  write_capacity              = var.dynamodb_table_write_capacity

  dynamic "attribute" {
    for_each = var.dynamodb_table_attribute
      content {
        name = attribute.value["name"]
        type = attribute.value["type"]
      }
  }
  dynamic "global_secondary_index" {
    for_each = var.dynamodb_table_global_secondary_index
      content {
        hash_key           = global_secondary_index.value["hash_key"]
        name               = global_secondary_index.value["name"]
        non_key_attributes = global_secondary_index.value["non_key_attributes"]
        projection_type    = global_secondary_index.value["projection_type"]
        range_key          = global_secondary_index.value["range_key"]
        read_capacity      = global_secondary_index.value["read_capacity"]
        write_capacity     = global_secondary_index.value["write_capacity"]
      }
  }
  dynamic "local_secondary_index" {
    for_each = var.dynamodb_table_local_secondary_index
      content {
        name               = local_secondary_index.value["name"]
        non_key_attributes = local_secondary_index.value["non_key_attributes"]
        projection_type    = local_secondary_index.value["projection_type"]
        range_key          = local_secondary_index.value["range_key"]
      }
  }
  dynamic "point_in_time_recovery" {
    for_each = var.dynamodb_table_point_in_time_recovery
      content {
        enabled = point_in_time_recovery.value["enabled"]
      }
  }
  dynamic "replica" {
    for_each = var.dynamodb_table_replica
      content {
        kms_key_arn            = replica.value["kms_key_arn"]
        point_in_time_recovery = replica.value["point_in_time_recovery"]
        propagation_tags       = replica.value["propagation_tags"]
        region_name            = replicat.value["region_name"] 
      }
  }
  dynamic "server_side_encryption" {
    for_each = var.dynamodb_table_server_side_encryption
      content {
        enabled     = server_side_encryption.value["enabled"]
        kms_key_arn = server_side_encryption.value["kms_key_arn"] 
      }
  }
  dynamic "ttl" {
    for_each = var.dynamodb_table_ttl 
      content {
        attribute_name = ttl.value["attribute_name"]
        enabled        = ttl.value["enabled"]
      }
  }
  lifecycle {
    ignore_changes = [replica]
  }
}
