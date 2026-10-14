variable "bedrockagent_agent_action_group_action_group_name" {
  description = "(Required) Name of the action group"
  type        = string
}
variable "bedrockagent_agent_action_group_action_group_state" {
  description = "(Optional) Whether the action group is available for the agent to invoke or not when sending an InvokeAgent request. Valid values: ENABLED, DISABLED"
  type        = string
  default     = null
}
variable "bedrockagent_agent_action_group_agent_id" {
  description = "(Required) The unique identifier of the agent for which to create the action group"
  type        = string
}
variable "bedrockagent_agent_action_group_agent_version" {
  description = "(Required) Version of the agent for which to create the action group. Valid values: DRAFT"
  type        = string
}
variable "bedrockagent_agent_action_group_description" {
  description = "(Optional) Description of the action group"
  type        = string 
  default     = null
}
variable "bedrockagent_agent_action_group_parent_action_group_signature" {
  description = "(Optional) To allow your agent to request the user for additional information when trying to complete a task, set this argument to AMAZON.UserInput. You must leave the description, api_schema, and action_group_executor arguments blank for this action group. Valid values: AMAZON.UserInput"
  type        = string
  default     = null
}
variable "bedrockagent_agent_action_group_prepare_agent" {
  description = "(Optional) Whether or not to prepare the agent after creation or modification. Defaults to true"
  type        = bool
  default     = true
}
variable "bedrockagent_agent_action_group_skip_resource_in_use_check" {
  description = "(Optional) Whether the in-use check is skipped when deleting the action group"
  type        = bool
  default     = false
}
variable "bedrockagent_agent_action_group_action_group_executor" {
  description = "(Required) ARN of the Lambda function containing the business logic that is carried out upon invoking the action or custom control method for handling the information elicited from the user. See action_group_executor Block for details"
  type        = list(object({
    custom_control = optional(string)
    lambda         = optional(string)
  }))
}
variable "bedrockagent_agent_action_group_api_schema" {
  description = "(Optional) Either details about the S3 object containing the OpenAPI schema for the action group or the JSON or YAML-formatted payload defining the schema"
  type        = list(object({
    payload = optinal(string)
    s3      = optional(list(object({
      s3_bucket_name = optional(string)
      s3_object_key  = optional(string)
    })), [])
  }))
  default     = []
}
variable "bedrockagent_agent_action_group_function_schema" {
  description = "(Optional) Describes the function schema for the action group. Each function represents an action in an action group"
  type        = list(object({
    member_functions = optional(list(object({
      functions = optional(list(object({
        description = optional(string)
        name        = string
        parameters  = optional(list(object({
          description   = optional(string)
          map_block_key = string
          required      = optional(bool)
          type          = string
        })), [])
      })))
    })), [])
  }))
  default     = []
}
