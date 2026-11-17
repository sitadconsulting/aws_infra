resource "aws_dynamodb_global_secondary_index" "dynamodb_global_secondary_index" {
  index_name = var.dynamodb_global_secondary_index_index_name
  table_name = var.dynamodb_global_secondary_index_table_name

  dynamic "key_schema" {
    for_each = var.dynamodb_global_secondary_index_key_schema
      content {
        attribute_name = key_schema.value["attribute_name"]
        attribute_type = key_schema.value["attribute_type"]
        key_type       = key_schema.value["key_type"]  
      }
  }
  dynamic "on_demand_throughput" {
    for_each = var.dynamodb_global_secondary_index_on_demand_throughput
      content {
        max_read_request_units  = on_demand_throughput.value["max_read_request_units"]
        max_write_request_units = on_demand_throughput.value["max_write_request_units"]
      }
  }
  dynamic "projection" {
    for_each = var.dynamodb_global_secondary_index_projection
      content {
        non_key_attributes = projection.value["non_key_attributes"]
        projection_type    = projection.value["projection_type"]
      }
  }
  dynamic "provisioned_throughput" {
    for_each = var.dynamodb_global_secondary_index_provisioned_throughput
      content {
        read_capacity_units  = provisioned_throughput.value["read_capacity_units"]
        write_capacity_units = provisioned_throughput.value["write_capacity_units"]
      }
  }
  dynamic "warm_throughput" {
    for_each = var.dynamodb_global_secondary_index_warm_throughput
      content {
        read_units_per_second  = warm_throughput.value["read_units_per_second"]
        write_units_per_second = warm_throughput.value["write_units_per_second"]
      }
  }
}
