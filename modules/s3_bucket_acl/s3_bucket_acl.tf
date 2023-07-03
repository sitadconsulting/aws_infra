resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  acl                   = var.s3_bucket_acl_acl
  bucket                = var.s3_bucket_acl_bucket
  expected_bucket_owner = var.s3_bucket_acl_expected_bucket_owner

  dynamic "access_control_policy" {
    for_each = var.s3_bucket_acl_access_control_policy
      content {
        dynamic "grant" {
          for_each = access_control_policy.value.grant
            content {
              permission = grant.value["permission"] 
              dynamic "grantee" {
                for_each = grant.value.grantee
                  content {
                    email_address = grantee.value["email_address"]
                    id            = grantee.value["id"]
                    type          = grantee.value["type"]
                    uri           = grantee.value["uri"]
                  }
              }
            }
        }
        dynamic "owner" {
          for_each = access_control_policy.value.owner
            content {
              display_name = owner.value["display_name"]
              id           = owner.value["id"]
            }
        }
      }
  }
}
