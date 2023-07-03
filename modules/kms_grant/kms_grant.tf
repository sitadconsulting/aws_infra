resource "aws_kms_grant" "kms_grant" {
  grant_creation_tokens = var.kms_grant_grant_creation_tokens
  grantee_principal     = var.kms_grant_grantee_principal
  key_id                = var.kms_grant_key_id
  name                  = var.kms_grant_name
  operations            = var.kms_grant_operations
  retire_on_delete      = var.kms_grant_retire_on_delete
  retiring_principal    = var.kms_grant_retiring_principal

  dynamic "constraints" {
    for_each = var.kms_grant_constraints
      content {
        encryption_context_equals = constraints.value["encryption_context_equals"]
        encryption_context_subset = constraints.value["encryption_context_subset"]
      }
  }
}
