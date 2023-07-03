variable "quicksight_account_subscription_account_name" {
  description = "Name of your Amazon QuickSight account. This name is unique over all of AWS, and it appears only when users sign in"
  type        = string
}
variable "quicksight_account_subscription_active_directory_name" {
  description = "Name of your Active Directory. This field is required if ACTIVE_DIRECTORY is the selected authentication method of the new Amazon QuickSight account "
  type        = string
  default     = ""
}
variable "quicksight_account_subscription_admin_group" {
  description = "Admin group associated with your Active Directory. This field is required if ACTIVE_DIRECTORY is the selected authentication method of the new Amazon QuickSight account"
  type        = string
  default     = ""
}
variable "quicksight_account_subscription_authentication_method" {
  description = "Method that you want to use to authenticate your Amazon QuickSight account. Currently, the valid values for this parameter are IAM_AND_QUICKSIGHT, IAM_ONLY, and ACTIVE_DIRECTORY"
  type        = string
}
variable "quicksight_account_subscription_author_group" {
  description = "Author group associated with your Active Directory"
  type        = string
  default     = ""
}
variable "quicksight_account_subscription_aws_account_id" {
  description = "AWS account ID hosting the QuickSight account. Default to provider account"
  type        = string
  default     = ""
}
variable "quicksight_account_subscription_contact_number" {
  description = "A 10-digit phone number for the author of the Amazon QuickSight account to use for future communications. This field is required if ENTERPPRISE_AND_Q is the selected edition of the new Amazon QuickSight account"
  type        = number
  default     = null
}
variable "quicksight_account_subscription_directory_id" {
  description = "Active Directory ID that is associated with your Amazon QuickSight account"
  type        = string
  default     = ""
}
variable "quicksight_account_subscription_edition" {
  description = "Edition of Amazon QuickSight that you want your account to have. Currently, you can choose from STANDARD, ENTERPRISE or ENTERPRISE_AND_Q"
  type        = string
}
variable "quicksight_account_subscription_email_address" {
  description = "Email address of the author of the Amazon QuickSight account to use for future communications. This field is required if ENTERPPRISE_AND_Q is the selected edition of the new Amazon QuickSight account"
  type        = string
  default     = ""
}
variable "quicksight_account_subscription_first_name" {
  description = "First name of the author of the Amazon QuickSight account to use for future communications. This field is required if ENTERPPRISE_AND_Q is the selected edition of the new Amazon QuickSight account"
  type        = string
  default     = ""
}
variable "quicksight_account_subscription_last_name" {
  description = "Last name of the author of the Amazon QuickSight account to use for future communications. This field is required if ENTERPPRISE_AND_Q is the selected edition of the new Amazon QuickSight account "
  type        = string
  default     = ""
}
variable "quicksight_account_subscription_notification_email" {
  description = "Email address that you want Amazon QuickSight to send notifications to regarding your Amazon QuickSight account or Amazon QuickSight subscription"
  type        = string
}
variable "quicksight_account_subscription_reader_group" {
  description = "Reader group associated with your Active Direcrtory"
  type        = string
  default     = ""
}
variable "quicksight_account_subscription_realm" {
  description = "Realm of the Active Directory that is associated with your Amazon QuickSight account"
  type        = string
  default     = ""
}
