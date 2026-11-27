resource "aws_lexv2models_slot_type" "lexv2models_slot_type" {
  bot_id                     = var.lexv2models_slot_type_bot_id
  bot_version                = var.lexv2models_slot_type_bot_version
  description                = var.lexv2models_slot_type_description
  locale_id                  = var.lexv2models_slot_type_locale_id
  name                       = var.lexv2models_slot_type_name
  parent_slot_type_signature = var.lexv2models_slot_type_parent_slot_type_signature
  

  dynamic "composite_slot_type_setting" {
    for_each = var.lexv2models_slot_type_composite_slot_type_setting
      content {
        dynamic "sub_slots" {
          for_each = composite_slot_type_setting.value.sub_slots
            content {
              name         = sub_slots.value["name"]
              slot_type_id = sub_slots.value["slot_type_id"]
            }
        }
      }
  }
  dynamic "external_source_setting" {
    for_each = var.lexv2models_slot_type_external_source_setting
      content {
        dynamic "grammar_slot_type_setting" {
          for_each = external_source_setting.value.grammar_slot_type_setting
            content {
              dynamic "source" {
                for_each = grammar_slot_type_setting.value.source
                  content {
                    s3_bucket_name = source.value["s3_bucket_name"]
                    s3_object_key  = source.value["s3_object_key"]
                    kms_key_arn    = source.value["kms_key_arn"]
                  }
              }
            }
        }
      }
  }
  dynamic "slot_type_values" {
    for_each = var.lexv2models_slot_type_slot_type_values
      content {
        dynamic "sample_value" {
          for_each = slot_type_values.value.sample_value
            content {
              value = sample_value.value["value"]
            }
        }
        dynamic "synonyms" {
          for_each = slot_type_values.value.synonyms
            content {
              value = synonyms.value["value"]
            }
        }
      }
  }
  dynamic "value_selection_setting" {
    for_each = var.lexv2models_slot_type_value_selection_setting
      content {
        resolution_strategy = value_selection_setting.value["resolution_strategy"]
        dynamic "advanced_recognition_setting" {
          for_each = value_selection_setting.value.advanced_recognition_setting
            content {
              audio_recognition_strategy = advanced_recognition_setting.value["audio_recognition_strategy"]
            }
        }
        dynamic "regex_filter" {
          for_each = value_selection_setting.value.regex_filter
            content {
              pattern = regex_filter.value["pattern"]
            }
        }
      }
  }
}
