resource "aws_quicksight_account_subscription" "quicksight_account_subscription" {
  account_name                = var.quicksight_account_subscription_account_name
  account_subscription_status = var.quicksight_account_subscription_account_subscription_status
  active_directory_name       = var.quicksight_account_subscription_active_directory_name
  admin_group                 = var.quicksight_account_subscription_admin_group
  authentication_method       = var.quicksight_account_subscription_authentication_method
  author_group                = var.quicksight_account_subscription_author_group
  aws_account_id              = var.quicksight_account_subscription_aws_account_id
  contact_number              = var.quicksight_account_subscription_contact_number
  directory_id                = var.quicksight_account_subscription_directory_id
  edition                     = var.quicksight_account_subscription_edition
  email_address               = var.quicksight_account_subscription_email_address
  first_name                  = var.quicksight_account_subscription_first_name
  last_name                   = var.quicksight_account_subscription_last_name
  notification_email          = var.quicksight_account_subscription_notification_email
  reader_group                = var.quicksight_account_subscription_reader_group
  realm                       = var.quicksight_account_subscription_realm
}
