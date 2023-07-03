resource "aws_redshift_usage_limit" "redshift_usage_limit" {
  amount             = var.redshift_usage_limit_amount
  breach_action      = var.redshift_usage_limit_breach_action
  cluster_identifier = var.redshift_usage_limit_cluster_identifier
  feature_type       = var.redshift_usage_limit_feature_type
  limit_type         = var.redshift_usage_limit_limit_type
  period             = var.redshift_usage_limit_period
  tags               = var.redshift_usage_limit_tags
}
