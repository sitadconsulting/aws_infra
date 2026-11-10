resource "aws_config_configuration_aggregator" "config_configuration_aggregator" {
  name = var.config_configuration_aggregator_name
  tags = var.config_configuration_aggregator_tags


  dynamic "account_aggregation_source" {
    for_each = var.config_configuration_aggregator_account_aggregation_source
      content {
        account_ids = account_aggregation_source.value["account_ids"]
        all_regions = account_aggregation_source.value["all_regions"]
        regions     = account_aggregation_source.value["regions"]
      }
  }
  dynamic "organization_aggregation_source" {
    for_each = var.config_configuration_aggregator_organization_aggregation_source
      content {
        all_regions = organization_aggregation_source.value["all_regions"]
        regions     = organization_aggregation_source.value["regions"]
        role_arn    = organization_aggregation_source.value["role_arn"]
      }
  }
}
