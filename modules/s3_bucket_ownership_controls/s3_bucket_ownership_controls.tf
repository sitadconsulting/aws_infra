resource "aws_s3_bucket_ownership_controls" "s3_bucket_ownership_controls" {
  bucket = var.s3_bucket_ownership_controls_bucket

  dynamic "rule" {
    for_each = var.s3_bucket_ownership_controls_rule
      content {
        object_ownership = rule.value["object_ownership"]
      }
  }
}
