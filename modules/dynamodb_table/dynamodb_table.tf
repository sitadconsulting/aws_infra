resource "aws_dynamodb_table" "dynamodb_table" {
  billing_mode                = var.dynamodb_table_billing_mode
  deletion_protection_enabled = var.dynamodb_table_deletion_protection_enabled
  hash_key                    = var.dynamodb_table_hash_key
  name                        = var.dynamodb_table_name
  range_key                   = var.dynamodb_table_range_key
  read_capacity               = var.dynamodb_table_read_capacity
  restore_backup_arn          = var.dynamodb_table_restore_backup_arn
  restore_date_time           = var.dynamodb_table_restore_date_time
  restore_source_name         = var.dynamodb_table_restore_source_name
  restore_source_table_arn    = var.dynamodb_table_restore_source_table_arn
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
  dynamic "import_table" {
    for_each = var.dynamodb_table_import_table
      content {
        input_compression_type = import_table.value["input_compression_type"]
        input_format           = import_table.value["input_format"]
        dynamic "input_format_options" {
          for_each = import_table.value.input_format_options
            content {
              dynamic "csv" {
                for_each = input_format_options.value.csv
                  content {
                    delimiter   = csv.value["delimiter"]
                    header_list = csv.value["header_list"]
                  }
              }
            }
        }
        dynamic "s3_bucket_source" {
          for_each = import_table.value.s3_bucket_source
            content {
              bucket       = s3_bucket_source.value["bucket"]
              bucket_owner = s3_bucket_source.value["bucket_owner"]
              key_prefix   = s3_bucket_source.value["key_prefix"]
            }
        }
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
        dynamic "key_schema" {
          for_each = global_secondary_index.value.key_schema
            content {
              attribute_name = key_schema.value["attribute_name"]
              key_type       = key_schema.value["key_type"]
            }
        }
        dynamic "on_demand_throughput" {
          for_each = global_secondary_index.value.on_demand_throughput
            content {
              max_read_request_units  = on_demand_throughput.value["max_read_request_units"]
              max_write_request_units = on_demand_throughput.value["max_write_request_units"]
            }
        }
        dynamic "warm_throughput" {
          for_each = global_secondary_index.value.warm_throughput
            content {
              read_units_per_second  = warm_throughput.value["read_units_per_second"]
              write_units_per_second = warm_throughput.value["write_units_per_second"]
            }
        }
      }
  }
  dynamic "global_table_witness" {
    for_each = var.dynamodb_table_global_table_witness
      content {
        region_name = global_table_witness.value["region_name"]
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
  dynamic "on_demand_throughput" {
    for_each = var.dynamodb_table_on_demand_throughput
      content {
        max_read_request_units  = on_demand_throughput.value["max_read_request_units"]
        max_write_request_units = on_demand_throughput.value["max_write_request_units"]
      }
  }
  dynamic "point_in_time_recovery" {
    for_each = var.dynamodb_table_point_in_time_recovery
      content {
        enabled                 = point_in_time_recovery.value["enabled"]
        recovery_period_in_days = point_in_time_recovery.value["recovery_period_in_days"]
      }
  }
  dynamic "replica" {
    for_each = var.dynamodb_table_replica
      content {
        consistency_mode            = replica.value["consistency_mode"]
        kms_key_arn                 = replica.value["kms_key_arn"]
        point_in_time_recovery      = replica.value["point_in_time_recovery"]
        deletion_protection_enabled = replica.value["deletion_protection_enabled"]
        propagation_tags            = replica.value["propagation_tags"]
        region_name                 = replicat.value["region_name"] 
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
  dynamic "warm_throughput" {
    for_each = var.dynamodb_table_warm_throughput
      content {
        read_units_per_second  = warm_throughput.value["read_units_per_second"] 
        write_units_per_second = warm_throughput.value["write_units_per_second"]
      }
  }
}
