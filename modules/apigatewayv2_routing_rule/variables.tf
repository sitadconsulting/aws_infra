variable "apigatewayv2_routing_rule_domain_name" {
  description = "(Required) Domain name. Must be between 1 and 512 characters in length"
  type        = string
}
variable "apigatewayv2_routing_rule_priority" {
  description = "(Required) Order of rule evaluation. Priority is evaluated from the lowest value to the highest value. Rules can't have the same priority. Value must be between 1 and 1,000,000"
  type        = number
}
variable "apigatewayv2_routing_rule_action" {
  description = "(Required) Configuration of resulting action based on matching routing rules condition"
  type        = list(object({
    invoke_api = list(object({
      api_id          = string
      stage           = string
      strip_base_path = optional(bool)
    }))
  }))
}
variable "apigatewayv2_routing_rule_condition" {
  description = "(Required) Conditions configuration"
  type        = list(object({
    match_base_paths = optional(list(object({
      any_of = list(object({
        header     = string
        value_glob = string
      }))
    })), [])
    match_headers    = optional(list(object({
      any_of = list(object({
        header     = string
        value_glob = string
      }))
    })), [])
  }))
}
