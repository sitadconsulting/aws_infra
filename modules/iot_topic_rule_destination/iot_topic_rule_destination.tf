resource "aws_iot_topic_rule_destination" "iot_topic_rule_destination" {
  enabled = var.iot_topic_rule_destination_enabled

  dynamic "vpc_configuration" {
    for_each = var.iot_topic_rule_destination_vpc_configuration
      content {
        role_arn        = vpc_configuration.value["role_arn"]
        security_groups = vpc_configuration.value["security_groups"]
        subnet_ids      = vpc_configuration.value["subnet_ids"]
        vpc_id          = vpc_configuration.value["vpc_id"] 
      }
  }
}
