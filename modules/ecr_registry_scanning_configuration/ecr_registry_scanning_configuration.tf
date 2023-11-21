resource "aws_ecr_registry_scanning_configuration" "ecr_registry_scanning_configuration" {
  scan_type = var.ecr_registry_scanning_configuration_scan_type 

  dynamic "rule" {
    for_each = var.ecr_registry_scanning_configuration_rule
      content {
        scan_frequency = rule.value["scan_frequency"]
        dynamic "repository_filter" {
          for_each = rule.value.repository_filter
            content {
              filter      = repository_filter.value["filter"] 
              filter_type = repository_filter.value["filter_type"]
            }
        }
      }
  }
}
