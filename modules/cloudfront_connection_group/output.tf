output "cloudfront_connection_group_arn" {
  description = "ARN of the connection group"
  value       = element(concat(aws_cloudfront_connection_group.cloudfront_connection_group.*.arn, [""]), 0)
}
output "cloudfront_connection_group_id" {
  description = "ID of the connection group"
  value       = element(concat(aws_cloudfront_connection_group.cloudfront_connection_group.*.id, [""]), 0)
}
output "cloudfront_connection_group_status" {
  description = "Current status of the connection group"
  value       = element(concat(aws_cloudfront_connection_group.cloudfront_connection_group.*.status, [""]), 0)
}
output "cloudfront_connection_group_is_default" {
  description = "Whether the connection group is the default connection group for the distribution tenants"
  value       = element(concat(aws_cloudfront_connection_group.cloudfront_connection_group.*.is_default, [""]), 0)
}
output "cloudfront_connection_group_routing_endpoint" {
  description = "The routing endpoint (also known as the DNS name) that is assigned to the connection group, such as d111111abcdef8.cloudfront.net"
  value       = element(concat(aws_cloudfront_connection_group.cloudfront_connection_group.*.routing_endpoint, [""]), 0)
}
output "cloudfront_connection_group_last_modified_time" {
  description = "Date and time when the connection group was last modified"
  value       = element(concat(aws_cloudfront_connection_group.cloudfront_connection_group.*.last_modified_time, [""]), 0)
}
output "cloudfront_connection_group_etag" {
  description = "Current version of the connection group"
  value       = element(concat(aws_cloudfront_connection_group.cloudfront_connection_group.*.etag, [""]), 0)
}
