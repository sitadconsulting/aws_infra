resource "aws_bedrock_guardrail" "bedrock_guardrail" {
  blocked_input_messaging   = var.bedrock_guardrail_blocked_input_messaging
  blocked_outputs_messaging = var.bedrock_guardrail_blocked_outputs_messaging
  description               = var.bedrock_guardrail_description
  name                      = var.bedrock_guardrail_name
  kms_key_arn               = var.bedrock_guardrail_kms_key_arn
  tags                      = var.bedrock_guardrail_tags

  dynamic "content_policy_config" {
    for_each = var.bedrock_guardrail_content_policy_config
      content {
        dynamic "filters_config" {
          for_each = content_policy_config.value.filters_config
            content {
              input_action      = filters_config.value["input_action"]
              input_enabled     = filters_config.value["input_enabled"]
              input_modalities  = filters_config.value["input_modalities"]
              input_strength    = filters_config.value["input_strength"]
              output_action     = filters_config.value["output_action"]
              output_enabled    = filters_config.value["output_enabled"]
              output_modalities = filters_config.value["output_modalities"]
              output_strength   = filters_config.value["output_strength"]
              type              = filters_config.value["type"]
            }
        }
        dynamic "tier_config" {
          for_each = var.bedrock_guardrail_tier_config
            content {
              tier_name = tier_config.value["tier_name"]
            }
        }
      }
  }
  dynamic "contextual_grounding_policy_config" {
    for_each = var.bedrock_guardrail_contextual_grounding_policy_config
      content {
        dynamic "filters_config" {
          for_each = contextual_grounding_policy_config.value.filters_config
            content {
              threshold = filters_config.value["threshold"]
              type      = filters_config.value["type"]
            }
        }
      }
  }
  dynamic "cross_region_config" {
    for_each = var.bedrock_guardrail_cross_region_config
      content {
        guardrail_profile_identifier = cross_region_config.value["guardrail_profile_identifier"]
      }
  }
  dynamic "sensitive_information_policy_config" {
    for_each = var.bedrock_guardrail_sensitive_information_policy_config
      content {
        dynamic "pii_entities_config" {
          for_each = sensitive_information_policy_config.value.pii_entities_config
            content {
              action         = pii_entities_config.value["action"]
              input_action   = pii_entities_config.value["input_action"]
              input_enabled  = pii_entities_config.value["input_enabled"]
              output_action  = pii_entities_config.value["output_action"]
              output_enabled = pii_entities_config.value["output_enabled"]
              type           = pii_entities_config.value["type"]
            }
        }
        dynamic "regexes_config" {
          for_each = sensitive_information_policy_config.value.regexes_config
            content {
              action         = regexes_config.value["action"]
              description    = regexes_config.value["description"]
              input_action   = regexes_config.value["input_action"]
              input_enabled  = regexes_config.value["input_enabled"]
              name           = regexes_config.value["name"]
              output_action  = regexes_config.value["output_action"]
              output_enabled = regexes_config.value["output_enabled"]
              pattern        = regexes_config.value["pattern"]
            }
        }
      }
  }
  dynamic "topic_policy_config" {
    for_each = var.bedrock_guardrail_topic_policy_config
      content {
        dynamic "tier_config" {
          for_each = topic_policy_config.value.tier_config
            content {
              tier_name = tier_config.value["tier_name"]
            }
        }
        dynamic "topics_config" {
          for_each = topic_policy_config.value.topics_config
            content {
              definition = topics_config.value["definition"]
              examples   = topics_config.value["examples"]
              name       = topics_config.value["name"]
              type       = topics_config.value["type"]
            }
        }
      }
  }
  dynamic "word_policy_config" {
    for_each = var.bedrock_guardrail_word_policy_config
      content {
        dynamic "managed_word_lists_config" {
          for_each = word_policy_config.value.managed_word_lists_config
            content {
              input_action   = managed_word_lists_config.value["input_action"]
              input_enabled  = managed_word_lists_config.value["input_enabled"]
              output_action  = managed_word_lists_config.value["output_action"]
              output_enabled = managed_word_lists_config.value["output_enabled"]
              type           = managed_word_lists_config.value["type"]
            }
        }
        dynamic "words_config" {
          for_each = word_policy_config.value.words_config
            content {
              input_action   = words_config.value["input_action"]
              input_enabled  = words_config.value["input_enabled"]
              output_action  = words_config.value["output_action"]
              output_enabled = words_config.value["output_enabled"]
              text           = words_config.value["text"]
            }
        }
      }
  }
}
