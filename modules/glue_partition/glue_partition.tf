resource "aws_glue_partition" "glue_partition" {
  catalog_id       = var.glue_partition_catalog_id
  database_name    = var.glue_partition_database_name
  table_name       = var.glue_partition_table_name
  partition_values = var.glue_partition_partition_values
  parameters       = var.glue_partition_parameters

  dynamic "storage_descriptor" {
    for_each = var.glue_partition_storage_descriptor
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
              comment = columns.value["comment"]
              name    = columns.value["name"]
              type    = columns.value["type"]
            }
        }
        dynamic "ser_de_info" {
          for_each = storage_descriptor.value.ser_de_info
            content {
              name                  = ser_de_info.value["name"]
              parameters            = ser_de_info.value["parameters"]
              serialization_library = ser_de_info.value["serialization_library"]
            }
        }
        dynamic "skewed_info" {
          for_each = storage_descriptor.value.skewed_info
            content {
              skewed_column_names               = skewed_info.value["skewed_column_names"]
              skewed_column_values              = skewed_info.value["skewed_column_values"]
              skewed_column_value_location_maps = skewed_info.value["skewed_column_value_location_maps"]
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
}
