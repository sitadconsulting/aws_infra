output "appsync_api_cache_id" {
  description = "AppSync API ID"
  value       = element(concat(aws_appsync_api_cache.appsync_api_cache.*.id, [""]), 0)
}
