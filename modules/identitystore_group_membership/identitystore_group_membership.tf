resource "aws_identitystore_group_membership" "identitystore_group_membership" {
  group_id          = var.identitystore_group_membership_group_id
  identity_store_id = var.identitystore_group_membership_identity_store_id
  member_id         = var.identitystore_group_membership_member_id
}
