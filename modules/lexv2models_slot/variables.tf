variable "lexv2models_slot_bot_id" {
  description = "(Required) Identifier of the bot associated with the slot"
  type        = string
}
variable "lexv2models_slot_bot_version" {
  description = "(Required) Version of the bot associated with the slot"
  type        = string
}
variable "lexv2models_slot_description" {
  description = "(Optional) Description of the slot"
  type        = string
  default     = null
}
variable "lexv2models_slot_intent_id" {
  description = "(Required) Identifier of the intent that contains the slot"
  type        = string
}
variable "lexv2models_slot_locale_id" {
  description = "(Required) Identifier of the language and locale that the slot will be used in"
  type        = string
}
variable "lexv2models_slot_name" {
  description = "(Required) Name of the slot"
  type        = string
}
variable "lexv2models_slot_slot_type_id" {
  description = "(Optional) Unique identifier for the slot type associated with this slot"
  type        = string
  default     = null
}
variable "lexv2models_slot_value_elicitation_setting" {
  description = "(Required) Prompts that Amazon Lex sends to the user to elicit a response that provides the value for the slot. If you configure this block without prompt_specification.*.prompt_attempts_specification, AWS will provide default prompt_attempts_specification blocks for the initial prompt (map key Initial) and each retry attempt (map keys Retry1, Retry2, etc.)"
  type        = list(object({
    slot_constraint                 = string
    default_value_specification     = optional(list(object({
      default_value_list = list(object({
        default_value = string
      }))
    })), [])
    prompt_specification            = optional(list(object({
      allow_interrupt            = optional(bool)
      max_retries                = number
      message_selection_strategy = optional(string)
      message_group   = list(object({
        message   = list(object({
          custom_payload      = optional(list(object({
            value = string
          })), [])
          image_response_card = optional(list(object({
            image_url = optional(string)
            subtitle  = optional(string)
            title     = string
            button    = optional(list(object({
              text  = string
              value = string
            })), [])
          })), [])
          plain_text_message  = optional(list(object({
            value = string
          })), [])
          ssml_message        = optional(list(object({
            value = string
          })), [])
        }))
        variation = optional(list(object({
          custom_payload      = optional(list(object({
            value = string
          })), [])
          image_response_card = optional(list(object({
            image_url = optional(string)
            subtitle  = optional(string)
            title     = string
            button    = optional(list(object({
              text  = string
              value = string
            })), [])
          })), [])
          plain_text_message  = optional(list(object({
            value = string
          })), [])
          ssml_message        = optional(list(object({
            value = string
          })), [])
        })), [])
      }))
      prompt_attempts_specification = optional(list(object({
        map_block_key                      = string
        allow_interrupt                    = optional(bool)
        allowed_input_types                = list(object({
          allow_audio_input = bool
          allow_dtmf_input  = bool
        }))
        audio_and_dtmf_input_specification = optional(list(object({
          start_timeout_ms    = number
          audio_specification = optional(list(object({
            end_timeout_ms = number
            max_length_ms  = number
          })), [])
          dtmf_specification  = optional(list(object({
            deletion_character = string
            end_character      = string
            end_timeout_ms     = number
            max_length         = number
          })), [])
        })), [])
        text_input_specification           = optional(list(object({
          start_timeout_ms = number
        })), [])
      })), [])
    })), [])
    sample_utterances               = optional(list(object({
      utterance = string
    })), [])
    slot_resolution_setting         = optional(list(object({
      slot_resolution_strategy = string
    })), [])
    wait_and_continue_specification = optional(list(object({
      active                 = optional(bool)
      continue_response      = list(object({
        allow_interrupt = optional(bool)
        message_group   = list(object({
          message   = list(object({
            custom_payload      = optional(list(object({
              value = string
            })), [])
            image_response_card = optional(list(object({
              image_url = optional(string)
              subtitle  = optional(string)
              title     = string
              button    = optional(list(object({
                text  = string
                value = string
              })), [])
            })), [])
            plain_text_message  = optional(list(object({
              value = string
            })), [])
            ssml_message        = optional(list(object({
              value = string
            })), [])
          }))
          variation = optional(list(object({
            custom_payload      = optional(list(object({
              value = string
            })), [])
            image_response_card = optional(list(object({
              image_url = optional(string)
              subtitle  = optional(string)
              title     = string
              button    = optional(list(object({
                text  = string
                value = string
              })), [])
            })), [])
            plain_text_message  = optional(list(object({
              value = string
            })), [])
            ssml_message        = optional(list(object({
              value = string
            })), [])
          
          })), [])
        }))
      })) 
      waiting_response       = list(object({
        allow_interrupt = optional(bool)
        message_group   = list(object({
          message   = list(object({
            custom_payload      = optional(list(object({
              value = string
            })), [])
            image_response_card = optional(list(object({
              image_url = optional(string)
              subtitle  = optional(string)
              title     = string
              button    = optional(list(object({
                text  = string
                value = string
              })), [])
            })), [])
            plain_text_message  = optional(list(object({
              value = string
            })), [])
            ssml_message        = optional(list(object({
              value = string
            })), [])
          }))
          variation = optional(list(object({
            custom_payload      = optional(list(object({
              value = string
            })), [])
            image_response_card = optional(list(object({
              image_url = optional(string)
              subtitle  = optional(string)
              title     = string
              button    = optional(list(object({
                text  = string
                value = string
              })), [])
            })), [])
            plain_text_message  = optional(list(object({
              value = string
            })), [])
            ssml_message        = optional(list(object({
              value = string
            })), [])
          })), [])
        }))
      }))
      still_waiting_response = optional(list(object({
        allow_interrupt      = optional(bool)
        frequency_in_seconds = number
        timeout_in_seconds   = number
        message_groups       = list(object({
          message   = list(object({
            custom_payload      = optional(list(object({
              value = string
            })), [])
            image_response_card = optional(list(object({
              image_url = optional(string)
              subtitle  = optional(string)
              title     = string
              button    = optional(list(object({
                text  = string
                value = string
              })), [])
            })), [])
            plain_text_message  = optional(list(object({
              value = string
            })), [])
            ssml_message        = optional(list(object({
              value = string
            })), [])
          }))
          variation = optional(list(object({
            custom_payload      = optional(list(object({
              value = string
            })), [])
            image_response_card = optional(list(object({
              image_url = optional(string)
              subtitle  = optional(string)
              title     = string
              button    = optional(list(object({
                text  = string
                value = string
              })), [])
            })), [])
            plain_text_message  = optional(list(object({
              value = string
            })), [])
            ssml_message        = optional(list(object({
              value = string
            })), [])
          })), [])
        }))
      })), [])
    })), [])
  }))
}
variable "lexv2models_slot_multiple_values_setting" {
  description = "(Optional) Whether the slot returns multiple values in one response"
  type        = list(object({
    allow_multiple_values = optional(bool)
  }))
  default     = []
}
variable "lexv2models_slot_obfuscation_setting" {
  description = "(Optional) Determines how slot values are used in Amazon CloudWatch logs"
  type        = list(object({
    obfuscation_setting_type = string
  }))
  default     = []
}
variable "lexv2models_slot_sub_slot_setting" {
  description = "(Optional) Specifications for the constituent sub slots and the expression for the composite slot"
  type        = list(object({
    expression         = optional(string)
    slot_specification = optional(list(object({
      slot_type_id              = string
      value_elicitation_setting = list(object({
        slot_constraint                 = string
        default_value_specification     = optional(list(object({
          default_value_list = list(object({
            default_value = string
          }))
        })), [])
        prompt_specification            = optional(list(object({
           allow_interrupt            = optional(bool)
           max_retries                = number
           message_selection_strategy = optional(string)
           message_group   = list(object({
             message   = list(object({
               custom_payload      = optional(list(object({
                 value = string
               })), [])
               image_response_card = optional(list(object({
                 image_url = optional(string)
                 subtitle  = optional(string)
                 title     = string
                 button    = optional(list(object({
                   text  = string
                   value = string
                 })), [])
               })), [])
               plain_text_message  = optional(list(object({
                 value = string
               })), [])
               ssml_message        = optional(list(object({
                 value = string
               })), [])
             }))
             variation = optional(list(object({
               custom_payload      = optional(list(object({
                 value = string
               })), [])
               image_response_card = optional(list(object({
                 image_url = optional(string)
                 subtitle  = optional(string)
                 title     = string
                 button    = optional(list(object({
                   text  = string
                   value = string
                 })), [])
               })), [])
               plain_text_message  = optional(list(object({
                 value = string
               })), [])
               ssml_message        = optional(list(object({
                 value = string
               })), [])
             })), [])
           }))
           prompt_attempts_specification = optional(list(object({
             map_block_key                      = string
             allow_interrupt                    = optional(bool)
             allowed_input_types                = list(object({
               allow_audio_input = bool
               allow_dtmf_input  = bool
             }))
             audio_and_dtmf_input_specification = optional(list(object({
               start_timeout_ms    = number
               audio_specification = optional(list(object({
                 end_timeout_ms = number
                 max_length_ms  = number
               })), [])
               dtmf_specification  = optional(list(object({
                 deletion_character = string
                 end_character      = string
                 end_timeout_ms     = number
                 max_length         = number
               })), [])
             })), [])
             text_input_specification           = optional(list(object({
               start_timeout_ms = number
             })), [])
           })), [])
        })), [])
        sample_utterances               = optional(list(object({
          utterance = string
        })), [])
        slot_resolution_setting         = optional(list(object({
          slot_resolution_strategy = string
        })), [])
        wait_and_continue_specification = optional(list(object({
          active                 = optional(bool)
          continue_response      = list(object({
            allow_interrupt = optional(bool)
            message_group   = list(object({
              message   = list(object({
                custom_payload      = optional(list(object({
                  value = string
                })), [])
                image_response_card = optional(list(object({
                  image_url = optional(string)
                  subtitle  = optional(string)
                  title     = string
                  button    = optional(list(object({
                    text  = string
                    value = string
                  })), [])
                })), [])
                plain_text_message  = optional(list(object({
                  value = string
                })), [])
                ssml_message        = optional(list(object({
                  value = string
                })), [])
              }))
              variation = optional(list(object({
                custom_payload      = optional(list(object({
                  value = string
                })), [])
                image_response_card = optional(list(object({
                  image_url = optional(string)
                  subtitle  = optional(string)
                  title     = string
                  button    = optional(list(object({
                    text  = string
                    value = string
                  })), [])
                })), [])
                plain_text_message  = optional(list(object({
                  value = string
                })), [])
                ssml_message        = optional(list(object({
                  value = string
                })), [])
              
              })), [])
            }))
          })) 
          waiting_response       = list(object({
            allow_interrupt = optional(bool)
            message_group   = list(object({
              message   = list(object({
                custom_payload      = optional(list(object({
                  value = string
                })), [])
                image_response_card = optional(list(object({
                  image_url = optional(string)
                  subtitle  = optional(string)
                  title     = string
                  button    = optional(list(object({
                    text  = string
                    value = string
                  })), [])
                })), [])
                plain_text_message  = optional(list(object({
                  value = string
                })), [])
                ssml_message        = optional(list(object({
                  value = string
                })), [])
              }))
              variation = optional(list(object({
                custom_payload      = optional(list(object({
                  value = string
                })), [])
                image_response_card = optional(list(object({
                  image_url = optional(string)
                  subtitle  = optional(string)
                  title     = string
                  button    = optional(list(object({
                    text  = string
                    value = string
                  })), [])
                })), [])
                plain_text_message  = optional(list(object({
                  value = string
                })), [])
                ssml_message        = optional(list(object({
                  value = string
                })), [])
              })), [])
            }))
          }))
          still_waiting_response = optional(list(object({
            allow_interrupt      = optional(bool)
            frequency_in_seconds = number
            timeout_in_seconds   = number
            message_groups       = list(object({
              message   = list(object({
                custom_payload      = optional(list(object({
                  value = string
                })), [])
                image_response_card = optional(list(object({
                  image_url = optional(string)
                  subtitle  = optional(string)
                  title     = string
                  button    = optional(list(object({
                    text  = string
                    value = string
                  })), [])
                })), [])
                plain_text_message  = optional(list(object({
                  value = string
                })), [])
                ssml_message        = optional(list(object({
                  value = string
                })), [])
              }))
              variation = optional(list(object({
                custom_payload      = optional(list(object({
                  value = string
                })), [])
                image_response_card = optional(list(object({
                  image_url = optional(string)
                  subtitle  = optional(string)
                  title     = string
                  button    = optional(list(object({
                    text  = string
                    value = string
                  })), [])
                })), [])
                plain_text_message  = optional(list(object({
                  value = string
                })), [])
                ssml_message        = optional(list(object({
                  value = string
                })), [])
              })), [])
            }))
          })), [])
        })), [])
      }))
    })), [])
  }))
  default     = []
}
