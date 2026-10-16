resource "aws_glue_catalog_table" "glue_catalog_table" {
  catalog_id         = var.glue_catalog_table_catalog_id
  description        = var.glue_catalog_table_description
  database_name      = var.glue_catalog_table_database_name
  name               = var.glue_catalog_table_name
  owner              = var.glue_catalog_table_owner
  parameters         = var.glue_catalog_table_parameters
  retention          = var.glue_catalog_table_retention
  table_type         = var.glue_catalog_table_table_type
  view_expanded_text = var.glue_catalog_table_view_expanded_text
  view_original_text = var.glue_catalog_table_view_original_text

  dynamic "open_table_format_input" {
    for_each = var.glue_catalog_table_open_table_format_input
      content {
        dynamic "iceberg_input" {
          for_each = open_table_format_input.value.iceberg_input
            content {
              metadata_operation = iceberg_input.value["metadata_operation"]
              version            = iceberg_input.value["version"]
              dynamic "iceberg_table_input" {
                for_each = iceberg_input.value.iceberg_table_input
                  content {
                    location   = iceberg_table_input.value["location"]
                    properties = iceberg_table_input.value["properties"]
                    dynamic "partition_spec" {
                      for_each = iceberg_table_input.value.partition_spec
                        content {
                          spec_id = partition_spec.value["spec_id"]
                          dynamic "fields" {
                            for_each = partition_spec.value.fields
                              content {
                                field_id  = fields.value["field_id"]
                                name      = fields.value["name"]
                                source_id = fields.value["source_id"]
                                transform = fields.value["transform"]
                              }
                          }
                        }
                    }
                    dynamic "schema" {
                      for_each = iceberg_table_input.value.schema
                        content {
                          identifier_field_ids = schema.value["identifier_field_ids"]
                          schema_id            = schema.value["schema_id"]
                          type                 = schema.value["type"]
                          dynamic "fields" {
                            for_each = schema.value.fields
                              content {
                                doc             = fields.value["doc"]
                                id              = fields.value["id"]
                                initial_default = fields.value["initial_default"]
                                name            = fields.value["name"]
                                required        = fields.value["required"]
                                type            = fields.value["type"]
                                write_default   = fields.value["write_default"]
                              }
                          }
                        }
                    }
                    dynamic "sort_order" {
                      for_each = iceberg_table_input.value.sort_order
                        content {
                          order_id = sort_order.value["order_id"]
                          dynamic "fields" {
                            for_each = sort_order.value.fields
                              content {
                                direction  = fields.value["direction"]
                                null_order = fields.value["null_order"]
                                source_id  = fields.value["source_id"]
                                transform  = fields.value["transform"]
                              }
                          }
                        }
                    }
                  }
              }
            }
        } 
      }
  }
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
        comment    = partition_keys.value["comment"]
        name       = partition_keys.value["name"]
        parameters = partition_keys.value["parameters"]
        type       = partition_keys.value["type"]
      }
  }
  dynamic  "storage_descriptor" {
    for_each = var.glue_catalog_table_storage_descriptor
      content {
        additional_locations      = storage_descriptor.value["additional_locations"]
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
        region        = target_table.value["region"]
      }
  }
  dynamic "view_definition" {
    for_each = var.glue_catalog_table_view_definition
      content {
        definer                = view_definition.value["definer"]
        is_protected           = view_definition.value["is_protected"]
        last_refresh_type      = view_definition.value["last_refresh_type"]
        refresh_seconds        = view_definition.value["refresh_seconds"]
        sub_object_version_ids = view_definition.value["sub_object_version_ids"]
        sub_objects            = view_definition.value["sub_objects"]
        view_version_id        = view_definition.value["view_version_id"]
        view_version_token     = view_definition.value["view_version_token"]
        dynamic "representations" {
          for_each = view_definition.value.representations
            content {
              dialect               = representations.value["dialect"]
              dialect_version       = representations.value["dialect_version"]
              validation_connection = representations.value["validation_connection"]
              view_expanded_text    = representations.value["view_expanded_text"]
              view_original_text    = representations.value["view_original_text"]
            }
        }
      }
  }
}
