variable "inspector2_enabler_account_ids" {
  description = "(Required) Set of account IDs. Can contain one of: the Organization's Administrator Account, or one or more Member Accounts"
  type        = list(string)
}
variable "inspector2_enabler_resource_types" {
  description = "(Required) Type of resources to scan. Valid values are EC2, ECR, LAMBDA, LAMBDA_CODE and CODE_REPOSITORY. At least one item is required"
  type        = string
}
