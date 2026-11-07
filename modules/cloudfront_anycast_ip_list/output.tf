output "cloudfront_anycast_ip_list_anycast_ips" {
  description = "The static IP addresses that are allocated to the Anycast IP list"
  value       = element(concat(aws_cloudfront_anycast_ip_list.cloudfront_anycast_ip_list.*.anycast_ips, [""]), 0)
}
output "cloudfront_anycast_ip_list_arn" {
  description = "The Anycast IP list ARN"
  value       = element(concat(aws_cloudfront_anycast_ip_list.cloudfront_anycast_ip_list.*.arn, [""]), 0)
}
output "cloudfront_anycast_ip_list_etag" {
  description = "The current version of the Anycast IP list" 
  value       = element(concat(aws_cloudfront_anycast_ip_list.cloudfront_anycast_ip_list.*.etag, [""]), 0)
}
output "cloudfront_anycast_ip_list_id" {
  description = "The Anycast IP list ID"
  value       = element(concat(aws_cloudfront_anycast_ip_list.cloudfront_anycast_ip_list.*.id, [""]), 0)
}
