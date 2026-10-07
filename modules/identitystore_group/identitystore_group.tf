resource "aws_identitystore_group" "identitystore_group" {
  description       = var.identitystore_group_description
  display_name      = var.identitystore_group_display_name
  identity_store_id = var.identitystore_group_identity_store_id
}
