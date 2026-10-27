output "vpc_route_server_arn" {
  description = "ARN of the route server"
  value       = element(concat(aws_vpc_route_server.vpc_route_server.*.arn, [""]), 0)
}
output "vpc_route_server_route_server_id" {
  description = "Unique identifier of the route server"
  value       = element(concat(aws_vpc_route_server.vpc_route_server.*.route_server_id, [""]), 0)
}
output "vpc_route_server_sns_topic_arn" {
  description = "ARN of the SNS topic where notifications are published"
  value       = element(concat(aws_vpc_route_server.vpc_route_server.*.sns_topic_arn, [""]), 0)
}
