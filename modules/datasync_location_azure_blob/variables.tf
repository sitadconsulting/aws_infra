variable "datasync_location_azure_blob_access_tier" {
  description = "(Optional) The access tier that you want your objects or files transferred into. Valid values: HOT, COOL and ARCHIVE. Default: HOT"
  type        = string
  default     = null
}
variable "datasync_location_azure_blob_agent_arns" {
  description = "(Required) A list of DataSync Agent ARNs with which this location will be associated"
  type        = list(string)
}
variable "datasync_location_azure_blob_authentication_type" {
  description = "(Required) The authentication method DataSync uses to access your Azure Blob Storage. Valid values: SAS"
  type        = string
}
variable "datasync_location_azure_blob_blob_type" {
  description = "(Optional) The type of blob that you want your objects or files to be when transferring them into Azure Blob Storage. Valid values: BLOCK. Default: BLOCK "
  type        = string
  default     = "BLOCK"
}
variable "datasync_location_azure_blob_container_url" {
  description = "(Required) The URL of the Azure Blob Storage container involved in your transfer"
  type        = string
}
variable "datasync_location_azure_blob_subdirectory" {
  description = "(Optional) Path segments if you want to limit your transfer to a virtual directory in the container"
  type        = string
  default     = null
}
variable "datasync_location_azure_blob_tags" {
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Location"
  type        = map(string)
  default     = {}
}
variable "datasync_location_azure_blob_sas_configuration" {
  description = "(Optional) The SAS configuration that allows DataSync to access your Azure Blob Storage"
  type        = list(object({
    token = string
  }))
  default     = []
}
