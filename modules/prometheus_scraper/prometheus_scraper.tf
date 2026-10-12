resource "aws_prometheus_scraper" "prometheus_scraper" {
  alias                = var.prometheus_scraper_alias
  scrape_configuration = var.prometheus_scraper_scrape_configuration

  dynamic "destination" {
    for_each = var.prometheus_scraper_destination
      content {
        dynamic "amp" {
          for_each = destination.value.amp
            content {
              workspace_arn = amp.value["workspace_arn"]
            }
        }
      }
  }
  dynamic "role_configuration" {
    for_each = var.prometheus_scraper_role_configuration
      content {
        source_role_arn = role_configuration.value["source_role_arn"]
        target_role_arn = role_configuration.value["target_role_arn"]
      }
  }
  dynamic "source" {
    for_each = var.prometheus_scraper_source
      content {
        dynamic "eks" {
          for_each = source.value.eks
            content {
              cluster_arn        = eks.value["cluster_arn"]
              subnet_ids         = eks.value["subnet_ids"]
              security_group_ids = eks.value["security_group_ids"]
            }
        }
        dynamic "vpc" {
          for_each = source.value.vpc
            content {
              security_group_ids = vpc.value["security_group_ids"]
              subnet_ids         = vpc.value["subnet_ids"]
            }
        }
      }
  }
}
