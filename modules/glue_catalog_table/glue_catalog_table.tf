resource "aws_glue_catalog_table" "glue_catalog_table" {
  catalog_id         = var.glue_catalog_table_catalog_id
  description        = var.glue_catalog_table_description
  database_name      = var.glue_catalog_table_database_name
  name               = var.glue_catalog_table_name
  owner              = var.glue_catalog_table_owner
  parameters         = var.glue_catalog_table_parameters
  retention          = var.glue_catalog_table_retention
  table_type         = var.glue_catalog_table_table_type
  target_table       = var.glue_catalog_table_target_table
  view_expanded_text = var.glue_catalog_table_view_expanded_text
  view_original_text = var.glue_catalog_table_view_original_text

  dynamic "partition_index" {
    for_each = var.glue_catalog_table_partition_index
      content {
        index_name = partition_index.value["index_name"]
        keys       = partition_index.value["keys"]
      }
  }
  dynamic "partition_keys" {
    for_each = var.glue_catalog_table_partition_keys
      content {
        comment = partition_keys.value["comment"]
        name    = partition_keys.value["name"]
        type    = partition_keys.value["type"]
      }
  }
  dynamic  "storage_descriptor" {
    for_each = var.glue_catalog_table_storage_descriptor
      content {
        bucket_columns            = storage_descriptor.value["bucket_columns"]
        compressed                = storage_descriptor.value["compressed"]
        input_format              = storage_descriptor.value["input_format"]
        location                  = storage_descriptor.value["location"]
        number_of_buckets         = storage_descriptor.value["number_of_buckets"]
        output_format             = storage_descriptor.value["output_format"]
        parameters                = storage_descriptor.value["parameters"]
        stored_as_sub_directories = storage_descriptor.value["stored_as_sub_directories"]
        dynamic "columns" {
          for_each = storage_descriptor.value.columns
            content {
              comment    = columns.value["comment"]
              name       = columns.value["name"]
              parameters = columns.value["parameters"]
              type       = columns.value["type"]
            }
        }
        dynamic "schema_reference" {
          for_each = storage_descriptor.value.schema_reference
            content {
              schema_version_id     = schema_reference.value["schema_version_id"]
              schema_version_number = schema_reference.value["schema_version_number"]
              dynamic "schema_id" {
                for_each = schema_reference.value.schema_id
                  content {
                    registry_name = schema_id.value["registry_name"] 
                    schema_arn    = schema_id.value["schema_arn"]
                    schema_name   = schema_id.value["schema_name"]
                  }
              } 
            }
        }
        dynamic "ser_de_info" {
          for_each = storage_descriptor.value.ser_de_info
            contemt {
              name                  = ser_de_info.value["name"]
              parameters            = ser_de_info.value["parameters"]
              serialization_library = ser_de_info.value["serialization_library"]
            }
        }
        dynamic "skewed_info" {
          for_each = storage_descriptor.value.skewed_info
            content {
              skewed_column_names               = skewed_info.value["skewed_column_names"]
              skewed_column_value_location_maps = skewed_info.value["skewed_column_value_location_maps"]
              skewed_column_values              = skewed_info.value["skewed_column_values"]
            }
        }
        dynamic "sort_columns" {
          for_each = storage_descriptor.value.sort_columns
            content {
              column     = sort_columns.value["column"]
              sort_order = sort_columns.value["sort_order"]
            }
        }
      }
  }
  dynamic "target_table" {
    for_each = var.glue_catalog_table_target_table
      content {
        catalog_id    = target_table.value["catalog_id"]
        database_name = target_table.value["database_name"]
        name          = target_table.value["name"]
      }
  }
}
