resource "aws_ecr_pull_through_cache_rule" "ecr_pull_through_cache_rule" {
  ecr_repository_prefix = var.ecr_pull_through_cache_rule_ecr_repository_prefix
  upstream_registry_url = var.ecr_pull_through_cache_rule_upstream_registry_url
}
