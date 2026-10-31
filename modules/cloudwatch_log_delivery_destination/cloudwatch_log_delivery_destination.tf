resource "aws_cloudwatch_log_delivery_destination" "cloudwatch_log_delivery_destination" {
  delivery_destination_type = var.cloudwatch_log_delivery_destination_delivery_destination_type
  name                      = var.cloudwatch_log_delivery_destination_name  
  output_format             = var.cloudwatch_log_delivery_destination_output_format
  tags                      = var.cloudwatch_log_delivery_destination_tags

  dynamic "delivery_destination_configuration" {
    for_each = var.cloudwatch_log_delivery_destination_delivery_destination_configuration
      content {
        destination_resource_arn = delivery_destination_configuration.value["destination_resource_arn"]
      }
  }
}
