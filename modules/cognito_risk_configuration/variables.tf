variable "cognito_risk_configuration_user_pool_id" {
  description = "The user pool ID"
  type        = string
}
variable "cognito_risk_configuration_client_id" {
  description = "The app client ID. When the client ID is not provided, the same risk configuration is applied to all the clients in the User Pool"
  type        = string
  default     = null
}
variable "cognito_risk_configuration_account_takeover_risk_configuration" {
  description = "The account takeover risk configuration"
  type        = list(object({
    actions   = list(object({
      high_action = optional(list(object({
        event_action = string
        notify       = bool
      })), [])
      low_action = optional(list(object({
        event_action = string
        notify       = bool
      })), [])
      medium_action = optional(list(object({
        event_action = string
        notify       = bool
      })), [])
    }))
    notify_configuration = list(object({
      from       = optional(string)
      reply_to   = optional(string)
      source_arn = string 
      block_email = optional(list(object({
        html_body = string
        subject   = string
        text_body = string
      })), [])
      mfa_email   = optional(list(object({
        html_body = string
        subject   = string
        text_body = string
      })), [])
      no_action_email = optional(list(object({
        html_body = string
        subject   = string
        text_body = string
      })), [])
    }))
  }))
  default     = []
}
variable "cognito_risk_configuration_compromised_credentials_risk_configuration" {
  description = " "
  type        = list(object({
    event_filter = optional(list(string))
    actions      = list(object({
      event_action = string
    }))
  }))
  default     = []
}
variable "cognito_risk_configuration_risk_exception_configuration" {
  description = "The configuration to override the risk decision"
  type        = list(object({
    blocked_ip_range_list = optional(list(string))
    skipped_ip_range_list = optional(list(string))
  }))
  default     = []
}
