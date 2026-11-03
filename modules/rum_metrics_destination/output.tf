output "rum_metrics_destination_id" {
  description = "The name of the CloudWatch RUM app monitor that will send the metrics"
  value       = element(concat(aws_rum_metrics_destination.rum_metrics_destination.*.id, [""]), 0)
}
