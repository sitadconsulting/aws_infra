resource "aws_s3_bucket_accelerate_configuration" "s3_bucket_accelerate_configuration" {
  bucket                = var.s3_bucket_accelerate_configuration_bucket
  expected_bucket_owner = var.s3_bucket_accelerate_configuration_expected_bucket_owner
  status                = var.s3_bucket_accelerate_configuration_status
}
