resource "aws_ecr_replication_configuration" "ecr_replication_configuration" {
  
  dynamic "replication_configuration" {
    for_each = var.ecr_replication_configuration_replication_configuration
      content {
        dynamic "rule" {
          for_each = replication_configuration.value.rule 
            content {
              dynamic "destination" {
                for_each = rule.value.destination
                  content {
                    region      = destination.value["region"]
                    registry_id = destination.value["registry_id"]
                  }
              }
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
  }
}
