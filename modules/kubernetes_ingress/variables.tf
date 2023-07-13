variable "ingress_metadata_annotations" {
  description = "An unstructured key value map stored with the ingress resource that may be used to store arbitrary metadata"
  type        = map(string)
  default     = {}
}
variable "ingress_metadata_labels" {
  description = "Map of string keys and values that can be used to organize and categorize (scope and select) the ingress resource"
  type        = map(string)
  default     = {}
}
variable "ingress_metadata_name" {
  description = "Name of the ingress resource, must be unique. Cannot be updated"
  type        = string
  default     = ""
}
variable "ingress_metadata_namespace" {
  description = "Namespace defines the space within which name of the ingress resource must be unique"
  type        = string
  default     = ""
}
variable "ingress_spec_default_backend" {
  description = "A default backend capable of servicing requests that don't match any rule"
  type        = list(object({
    resource  = optional(list(object({
      api_group = string
      kind      = string
      name      = string
    })), [])
    service   = optional(list(object({
      name    = string
      port    = list(object({
        name   = optional(string)
        number = optional(number)
      }))
    })), [])
  }))
  default  = []
}
variable "ingress_spec_ingress_class_name" {
  description = "The ingress class name references an IngressClass resource that contains additional configuration including the name of the controller that should implement the class"
  type        = string
  default     = ""
}
variable "ingress_spec_rule" {
  description = "A list of host rules used to configure the Ingress. If unspecified, or no rule matches, all traffic is sent to the default backend"
  type        = list(object({
    host      = optional(string)
    http      = optional(list(object({
      path    = list(object({
        path      = optional(string)
        path_type = optional(string)
        backend   = optional(list(object({
          resource = optional(list(object({
            api_group = string
            kind      = string
            name      = string
          })), [])
          service  = optional(list(object({
            name   = string
            port   = list(object({
              name   = optional(string)
              number = optional(number)
            }))
          })),[])
        })), [])
      }))
    })), [])
  }))
  default = []
}
variable "ingress_spec_tls" {
  description = "TLS configuration. Currently the Ingress only supports a single TLS port, 443"
  type        = list(object({
    hosts       = optional(list(string))   
    secret_name = optional(string)
  }))
  default  = [] 
}
