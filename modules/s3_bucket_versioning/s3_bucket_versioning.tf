resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket                = var.s3_bucket_versioning_bucket
  expected_bucket_owner = var.s3_bucket_versioning_expected_bucket_owner
  mfa                   = var.s3_bucket_versioning_mfa


  dynamic "versioning_configuration" {
    for_each = var.s3_bucket_versioning_versioning_configuration
      content {
        mfa_delete = versioning_configuration.value["mfa_delete"]
        status     = versioning_configuration.value["status"]
      }
  }
}
