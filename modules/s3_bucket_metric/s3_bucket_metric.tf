resource "aws_s3_bucket_metric" "s3_bucket_metric" {
  bucket = var.s3_bucket_metric_bucket
  name   = var.s3_bucket_metric_name

 dynamic "filter" {
   for_each = var.s3_bucket_metric_filter
     content {
       prefix = filter.value["prefix"]
       tags   = filter.value["tags"]
     }
  }
}
