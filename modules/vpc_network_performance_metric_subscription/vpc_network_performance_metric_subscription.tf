resource "aws_vpc_network_performance_metric_subscription" "vpc_network_performance_metric_subscription" {
  destination = var.vpc_network_performance_metric_subscription_destination
  metric      = var.vpc_network_performance_metric_subscription_metric
  source      = var.vpc_network_performance_metric_subscription_source
  statistic   = var.vpc_network_performance_metric_subscription_statistic
}
