resource "aws_athena_database" "athena_database" {
  bucket                = var.athena_database_bucket
  comment               = var.athena_database_comment
  expected_bucket_owner = var.athena_database_expected_bucket_owner
  force_destroy         = var.athena_database_force_destroy
  name                  = var.athena_database_name
  properties            = var.athena_database_properties

  dynamic "acl" {
    for_each = var.athena_database_acl
      content {
        s3_acl_option = acl.value["s3_acl_option"] 
      }
  }
  dynamic "encryption_configuration" {
    for_each = var.athena_database_encryption_configuration
      content {
        encryption_option = encryption_configuration.value["encryption_option"]
        kms_key           = encryption_configuration.value["kms_key"]
      }
  }
}
