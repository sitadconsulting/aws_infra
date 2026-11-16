variable "datazone_project_description" {
  description = "(Optional) Description of project"
  type        = string
  default     = null
}
variable "datazone_project_domain_identifier" {
  description = "(Required) Identifier of domain which the project is part of. Must follow the regex of ^dzd[-_][a-zA-Z0-9_-]{1,36}$"
  type        = string
}
variable "datazone_project_glossary_terms" {
  description = "(Optional) List of glossary terms that can be used in the project. The list cannot be empty or include over 20 values. Each value must follow the regex of [a-zA-Z0-9_-]{1,36}$"
  type        = list(string)
  default     = null
}
variable "datazone_project_name" {
  description = "(Required) Name of the project. Must follow the regex of ^[\w -]+$. and have a length of at most 64"
  type        = string
}
variable "datazone_project_skip_deletion_check" {
  description = "(Optional) Optional flag to delete all child entities within the project"
  type        = bool
  default     = null
}
