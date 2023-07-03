resource "aws_s3_bucket_logging" "s3_bucket_logging" {
  bucket                = var.s3_bucket_logging_bucket
  expected_bucket_owner = var.s3_bucket_logging_expected_bucket_owner
  target_bucket         = var.s3_bucket_logging_target_bucket
  target_prefix         = var.s3_bucket_logging_target_prefix


  dynamic "target_grant" {
    for_each = var.s3_bucket_logging_target_grant
      content {
        permission = target_grant.value["permission"]
        dynamic "grantee" {
          for_each = target_grant.value.grantee
            content {
              email_address = grantee.value["email_address"]
              id            = grantee.value["id"]
              type          = grantee.value["type"]
              uri           = grantee.value["uri"]
            }
        }
      }
  }
}
