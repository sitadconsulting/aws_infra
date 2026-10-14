resource "aws_bedrockagent_agent" "bedrockagent_agent" {
  agent_name                  = var.bedrockagent_agent_agent_name
  agent_collaboration         = var.bedrockagent_agent_agent_collaboration
  agent_resource_role_arn     = var.bedrockagent_agent_agent_resource_role_arn
  customer_encryption_key_arn = var.bedrockagent_agent_customer_encryption_key_arn
  description                 = var.bedrockagent_agent_description
  foundation_model            = var.bedrockagent_agent_foundation_model
  idle_session_ttl_in_seconds = var.bedrockagent_agent_idle_session_ttl_in_seconds
  instruction                 = var.bedrockagent_agent_instruction
  prepare_agent               = var.bedrockagent_agent_prepare_agent
  skip_resource_in_use_check  = var.bedrockagent_agent_skip_resource_in_use_check
  tags                        = var.bedrockagent_agent_tags

  dynamic "guardrail_configuration" {
    for_each = var.bedrockagent_agent_guardrail_configuration
      content {
        guardrail_identifier = guardrail_configuration.value["guardrail_identifier"]
        guardrail_version    = guardrail_configuration.value["guardrail_version"]
      }
  }
  dynamic "memory_configuration" {
    for_each = var.bedrockagent_agent_memory_configuration
      content {
        enabled_memory_types = memory_configuration.value["enabled_memory_types"]
        storage_days         = memory_configuration.value["storage_days"]
        dynamic "session_summary_configuration " {
          for_each = memory_configuration.value.session_summary_configuration
            content {
              max_recent_sessions = session_summary_configuration.value["max_recent_sessions"]
            }
        }
      }
  }
  dynamic "prompt_override_configuration" {
    for_each = var.bedrockagent_agent_prompt_override_configuration
      content {
        override_lambda = prompt_override_configuration.value["override_lambda"]
        dynamic "prompt_configurations" {
          for_each = prompt_override_configuration.value.prompt_configurations
            content {
              base_prompt_template = prompt_configurations.value["base_prompt_template"]
              parser_mode          = prompt_configurations.value["parser_mode"]
              prompt_creation_mode = prompt_configurations.value["prompt_creation_mode"]
              prompt_state         = prompt_configurations.value["prompt_state"]
              prompt_type          = prompt_configurations.value["prompt_type"]
              dynamic "inference_configuration" {
                for_each = prompt_configurations.value.inference_configuration
                  content {
                    max_length     = inference_configuration.value["max_length"]
                    stop_sequences = inference_configuration.value["stop_sequences"]
                    temperature    = inference_configuration.value["temperature"]
                    top_k          = inference_configuration.value["top_k"]
                    top_p          = inference_configuration.value["top_p"]
                  }
              }
            }
        }
      }
  }
}
