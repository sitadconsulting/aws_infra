variable "quicksight_folder_membership_aws_account_id" {
  description = "AWS account ID"
  type        = string
  default     = ""
}
variable "quicksight_folder_membership_folder_id" {
  description = "Identifier for the folder"
  type        = string
}
variable "quicksight_folder_membership_member_id" {
  description = "ID of the asset (the dashboard, analysis, or dataset)"
  type        = string
}
variable "quicksight_folder_membership_member_type" {
  description = "Type of the member. Valid values are ANALYSIS, DASHBOARD, and DATASET"
  type        = string
}
