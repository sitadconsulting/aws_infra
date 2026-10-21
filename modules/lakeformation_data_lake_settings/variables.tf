variable "lakeformation_data_lake_settings_admins" {
  description = "(Optional) Set of ARNs of AWS Lake Formation principals (IAM users or roles)"
  type        = list(string)
  default     = []
}
variable "lakeformation_data_lake_settings_allow_external_data_filtering" {
  description = "(Optional) Whether to allow Amazon EMR clusters to access data managed by Lake Formation"
  type        = bool
  default     = null
}
variable "lakeformation_data_lake_settings_allow_full_table_external_data_access" {
  description = "(Optional) Whether to allow a third-party query engine to get data access credentials without session tags when a caller has full data access permissions "
  type        = bool
  default     = null
}
variable "lakeformation_data_lake_settings_authorized_session_tag_value_list" {
  description = "(Optional) Lake Formation relies on a privileged process secured by Amazon EMR or the third party integrator to tag the user's role while assuming it"
  type        = list(string)
  default     = []
}
variable "lakeformation_data_lake_settings_catalog_id" {
  description = "(Optional) Identifier for the Data Catalog. By default, the account ID"
  type        = string
  default     = null
}
variable "lakeformation_data_lake_settings_external_data_filtering_allow_list" {
  description = "(Optional) A list of the account IDs of Amazon Web Services accounts with Amazon EMR clusters that are to perform data filtering"
  type        = list(string)
  default     = []
}
variable "lakeformation_data_lake_settings_parameters" {
  description = "Key-value map of additional configuration. Valid values for the CROSS_ACCOUNT_VERSION key are \"1\", \"2\", \"3\", or \"4\". SET_CONTEXT is also returned with a value of TRUE. In a fresh account, prior to configuring, CROSS_ACCOUNT_VERSION is \"1\". Destroying this resource sets the CROSS_ACCOUNT_VERSION to \"1\""
  type        = map(string)
  default     = {}
}
variable "lakeformation_data_lake_settings_read_only_admins" {
  description = "(Optional) Set of ARNs of AWS Lake Formation principals (IAM users or roles) with only view access to the resources"
  type        = list(string)
  default     = []
}
variable "lakeformation_data_lake_settings_trusted_resource_owners" {
  description = "(Optional) List of the resource-owning account IDs that the caller's account can use to share their user access details (user ARNs)"
  type        = list(string)
  default     = []
}
variable "lakeformation_data_lake_settings_create_database_default_permissions" {
  description = "(Optional) Up to three configuration blocks of principal permissions for default create database permissions"
  type        = list(object({
    permissions = optional(list(string))
    principal   = optional(string)
  }))
  default     = []
}
variable "lakeformation_data_lake_settings_create_table_default_permissions" {
  description = "(Optional) Up to three configuration blocks of principal permissions for default create table permissions"
  type        = list(object({
    permissions = optional(list(string))
    principal   = optional(string)
  }))
  default     = []
}
