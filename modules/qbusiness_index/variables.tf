variable "qbusiness_index_application_id" {
  description = "The identifier of the Amazon Q Business application using the index"
  type        = string
}
variable "qbusiness_index_description" {
  description = "A description for the Amazon Q Business index"
  type        = string
  default     = null
}
variable "qbusiness_index_display_name" {
  description = "The name of the index"
  type        = string
}
variable "qbusiness_index_tags" {
  description = "A list of key-value pairs that identify or categorize the index"
  type        = list(object({
    key   = string
    value = string
  }))
  default     = []
}
variable "qbusiness_index_type" {
  description = "The index type that's suitable for your needs, allowed_values: ENTERPRISE | STARTER"
  type        = string
  default     = null
}
variable "qbusiness_index_capacity_configuration_units" {
  description = "The capacity units you want to provision for your index. You can add and remove capacity to fit your usage needs"
  type        = number
  default     = null
}
variable "qbusiness_index_document_attribute_configurations" {
  description = "Configuration information for document attributes. Document attributes are metadata or fields associated with your documents. For example, the company department name associated with each document"
  type        = list(object({
    name   = optional(string)
    search = optional(string)
    type   = optional(string)
  }))
  default     = []
}
