resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  bucket                  = var.s3_bucket_public_access_block_bucket
  block_public_acls       = var.s3_bucket_public_access_block_block_public_acls
  block_public_policy     = var.s3_bucket_public_access_block_block_public_policy
  ignore_public_acls      = var.s3_bucket_public_access_block_ignore_public_acls
  restrict_public_buckets = var.s3_bucket_public_access_block_restrict_public_buckets
}
