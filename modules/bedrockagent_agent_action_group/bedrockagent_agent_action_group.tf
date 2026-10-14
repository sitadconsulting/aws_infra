resource "aws_bedrockagent_agent_action_group" "bedrockagent_agent_action_group" {
  action_group_name             = var.bedrockagent_agent_action_group_action_group_name
  action_group_state            = var.bedrockagent_agent_action_group_action_group_state
  agent_id                      = var.bedrockagent_agent_action_group_agent_id
  agent_version                 = var.bedrockagent_agent_action_group_agent_version
  description                   = var.bedrockagent_agent_action_group_description
  parent_action_group_signature = var.bedrockagent_agent_action_group_parent_action_group_signature
  prepare_agent                 = var.bedrockagent_agent_action_group_prepare_agent
  skip_resource_in_use_check    = var.bedrockagent_agent_action_group_skip_resource_in_use_check

  dynamic "action_group_executor" {
    for_each = var.bedrockagent_agent_action_group_action_group_executor
      content {
        custom_control = action_group_executor.value["custom_control"]
        lambda         = action_group_executor.value["lambda"]
      }
  }
  dynamic "api_schema" {
    for_each = var.bedrockagent_agent_action_group_api_schema
      content {
        payload = api_schema.value["payload"]
        dynamic "s3" {
          for_each = api_schema.value.s3
            content {
              s3_bucket_name = s3.value["s3_bucket_name"]
              s3_object_key  = s3.value["s3_object_key"]
            }
        }
      }
  }
  dynamic "function_schema" {
    for_each = var.bedrockagent_agent_action_group_function_schema
      content {
        dynamic "member_functions" {
          for_each = function_schema.value.member_functions
            content {
              dynamic "functions" {
                for_each = member_functions.value.functions
                  content {
                    description = functions.value["description"]
                    name        = functions.value["name"]
                    dynamic "parameters" {
                      for_each = functions.value.parameters
                        content {
                          description   = parameters.value["description"]
                          map_block_key = parameters.value["map_block_key"]
                          required      = parameters.value["required"]
                          type          = parameters.value["type"]
                        }
                    } 
                  }
              }
            }
        }
      }
  }
}
