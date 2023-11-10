variable "api_gateway_documentation_part_properties" {
  description = "Content map of API-specific key-value pairs describing the targeted API entity. The map must be encoded as a JSON string, e.g., \"{ \"description\": \"The API does …\" }\". Only Swagger-compliant key-value pairs can be exported and, hence, published"
  type        = string
}
variable "api_gateway_documentation_part_rest_api_id" {
  description = "ID of the associated Rest API"
  type        = string
}
variable "api_gateway_documentation_part_location" {
  description = "Location of the targeted API entity of the to-be-created documentation part"
  type        = list(object({
    method      = optional(string)
    name        = optional(string)
    path        = optional(string)
    status_code = optional(string)  
    type        = string
  }))
}
