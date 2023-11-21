variable "sagemaker_workteam_description" {
  description = "A description of the work team"
  type        = string
}
variable "sagemaker_workteam_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_workteam_workforce_name" {
  description = "Workforce name"
  type        = string
}
variable "sagemaker_workteam_workteam_name" {
  description = "Workteam name"
  type        = string
}
variable "sagemaker_workteam_member_definition" {
  description = "A list of Member Definitions that contains objects that identify the workers that make up the work team. Workforces can be created using Amazon Cognito or your own OIDC Identity Provider (IdP). For private workforces created using Amazon Cognito use cognito_member_definition. For workforces created using your own OIDC identity provider (IdP) use oidc_member_definition. Do not provide input for both of these parameters in a single request"
  type        = list(object({
    cognito_member_definition = optional(list(object({
      client_id  = string
      user_group = string
      user_pool  = string
    })), [])
    oidc_member_definition    = optional(list(object({
      groups = list(string)
    })), [])
  }))
}
variable "sagemaker_workteam_notification_configuration" {
  description = "Configures notification of workers regarding available or expiring work items"
  type        = list(object({
    notification_topic_arn = optional(string)
  }))
  default     = []
}
