variable "opensearchserverless_access_policy_description" {
  description = "Description of the policy. Typically used to store information about the permissions defined in the policy"
  type        = string
  default     = ""
}
variable "opensearchserverless_access_policy_name" {
  description = "Name of the policy"
  type        = string
}
variable "opensearchserverless_access_policy_policy" {
  description = "JSON policy document to use as the content for the new policy"
  type        = string
}
variable "opensearchserverless_access_policy_type" {
  description = "Type of access policy. Must be data"
  type        = string
}
