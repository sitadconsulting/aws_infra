output "vpc_network_performance_metric_subscription_period" {
  description = "Data aggregation time for the subscription"
  value       = element(concat(aws_vpc_network_performance_metric_subscription.vpc_network_performance_metric_subscription.*.period, [""]), 0)
}
