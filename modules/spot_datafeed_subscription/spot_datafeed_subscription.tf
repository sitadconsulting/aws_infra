resource "aws_spot_datafeed_subscription" "spot_datafeed_subscription" {
  bucket = var.spot_datafeed_subscription_bucket
  prefix = var.spot_datafeed_subscription_prefix
}
