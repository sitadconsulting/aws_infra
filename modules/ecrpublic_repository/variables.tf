variable "ecrpublic_repository_repository_name" {
  description = "Repository name"
  type        = string
}
variable "ecrpublic_repository_tags" {
  description = "Key-value mapping of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "ecrpublic_repository_catalog_data" {
  description = "Catalog data configuration for the repository"
  type        = list(object({
    about_text        = optional(string)
    architectures     = optional(list(string))
    description       = optional(string)
    logo_image_blob   = optional(string)
    operating_systems = optional(list(string))
    usage_text        = optional(string)
  }))
  default     = []
}
