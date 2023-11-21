variable "sagemaker_project_project_name" {
  description = "The name of the Project"
  type        = string
}
variable "sagemaker_project_project_description" {
  description = "A description for the project"
  type        = string
  default     = ""
}
variable "sagemaker_project_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_project_service_catalog_provisioning_details" {
  description = "The product ID and provisioning artifact ID to provision a service catalog"
  type        = list(object({
    path_id                  = optional(string)
    product_id               = string
    provisioning_artifact_id = optional(string)
    provisioning_parameter   = optional(list(object({
      key   = string
      value = optional(string)
    })), [])
  }))
}
