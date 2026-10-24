resource "aws_flow_log" "flow_log" {
  deliver_cross_account_role    = var.flow_log_deliver_cross_account_role
  eni_id                        = var.flow_log_eni_id
  iam_role_arn                  = var.flow_log_iam_role_arn
  log_destination               = var.flow_log_log_destination
  log_destination_type          = var.flow_log_log_destination_type
  log_format                    = var.flow_log_log_format
  max_aggregation_interval      = var.flow_log_max_aggregation_interval
  regional_nat_gateway_id       = var.flow_log_regional_nat_gateway_id
  subnet_id                     = var.flow_log_subnet_id
  tags                          = var.flow_log_tags
  traffic_type                  = var.flow_log_traffic_type
  transit_gateway_attachment_id = var.flow_log_transit_gateway_attachment_id
  transit_gateway_id            = var.flow_log_transit_gateway_id
  vpc_id                        = var.flow_log_vpc_id
  

  dynamic "destination_options" {
    for_each = var.flow_log_destination_options
      content {
        file_format                = destination_options.value["file_format"]
        hive_compatible_partitions = destination_options.value["hive_compatible_partitions"]
        per_hour_partition         = destination_options.value["per_hour_partition"]
      }
  }
  dynamic "tag_field_specification" {
    for_each = var.flow_log_tag_field_specification
      content {
        resource_type = tag_field_specification.value["resource_type"]
        tag_keys      = tag_field_specification.value["tag_keys"]
      }
  }
}
