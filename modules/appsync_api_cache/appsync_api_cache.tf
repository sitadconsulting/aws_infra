resource "aws_appsync_api_cache" "appsync_api_cache" {
  api_caching_behavior        = var.appsync_api_cache_api_caching_behavior
  api_id                      = var.appsync_api_cache_api_id
  at_rest_encryption_enabled  = var.appsync_api_cache_at_rest_encryption_enabled
  transit_encryption_enabled  = var.appsync_api_cache_transit_encryption_enabled
  ttl                         = var.appsync_api_cache_ttl
  type                        = var.appsync_api_cache_type
}
