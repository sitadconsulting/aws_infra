variable "lexv2models_intent_bot_id" {
  description = "(Required) Identifier of the bot associated with this intent"
  type        = string
}
variable "lexv2models_intent_bot_version" {
  description = "(Required) Version of the bot associated with this intent"
  type        = string
}
variable "lexv2models_intent_description" {
  description = "(Optional) Description of the intent. Use the description to help identify the intent in lists"
  type        = string
  default     = null
}
variable "lexv2models_intent_locale_id" {
  description = "(Required) Identifier of the language and locale where this intent is used. All of the bots, slot types, and slots used by the intent must have the same locale"
  type        = string
}
variable "lexv2models_intent_name" {
  description = "(Required) Name of the intent. Intent names must be unique in the locale that contains the intent and cannot match the name of any built-in intent"
  type        = string
}
variable "lexv2models_intent_parent_intent_signature" {
  description = "(Optional) Identifier for the built-in intent to base this intent on"
  type        = string
  default     = null 
}
variable "lexv2models_intent_closing_setting" {
  description = "(Optional) Configuration block for the response that Amazon Lex sends to the user when the intent is closed"
  type        = list(object({
    active           = optional(bool)
    closing_response = optional(list(object({
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
    })), [])
    conditional      = optional(list(object({
      active             = bool
      conditional_branch = list(object({
        name      = string
        condition = list(object({
          expression_string = string
        }))
        next_step = list(object({
          session_attributes = optional(map(string))
          dialog_action      = optional(list(object({
            type                  = string
            slot_to_elicit        = optional(string) 
            suppress_next_message = optional(bool)
          })), [])
          intent             = optional(list(object({
            name = optional(string)
            slot = optional(list(object({
              shape = optional(string)
              value = optional(list(object({
                interpreted_value = optional(string)
              })), [])
            })), [])
          })), [])
        }))
        response = optional(list(object({
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
        })), [])
      })) 
      default_branch     = list(object({
        next_step = list(object({
          session_attributes = optional(map(string))
          dialog_action      = optional(list(object({
            type                  = string
            slot_to_elicit        = optional(string) 
            suppress_next_message = optional(bool)
          })), [])
          intent             = optional(list(object({
            name = optional(string)
            slot = optional(list(object({
              shape = optional(string)
              value = optional(list(object({
                interpreted_value = optional(string)
              })), [])
            })), [])
          })), [])
        }))
        response = optional(list(object({
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
        })), [])
      }))
    })), [])
    next_step        = optional(list(object({
      next_step = list(object({
        session_attributes = optional(map(string))
        dialog_action      = optional(list(object({
          type                  = string
          slot_to_elicit        = optional(string) 
          suppress_next_message = optional(bool)
        })), [])
        intent             = optional(list(object({
          name = optional(string)
          slot = optional(list(object({
            shape = optional(string)
            value = optional(list(object({
              interpreted_value = optional(string)
            })), [])
          })), [])
        })), [])
      }))
    })), [])
  }))
  default     = []
}
variable "lexv2models_intent_confirmation_setting" {
  description = "(Optional) Configuration block for prompts that Amazon Lex sends to the user to confirm the completion of an intent. If the user answers "no," the settings contain a statement that is sent to the user to end the intent. If you configure this block without prompt_specification.*.prompt_attempts_specification, AWS will provide default configurations for Initial and Retry1 prompt_attempts_specifications. This will cause Terraform to report differences"
  type        = list(object({
    active    = optional(bool)
    code_hook                = optional(list(object({
      active                       = bool
      enable_code_hook_invocation  = bool
      invocation_label             = optional(string)
      post_code_hook_specification = list(object({
        failure_conditional = optional(list(object({
          active = bool
          conditional_branch = list(object({
            name      = string
            condition = list(object({
              expression_string = string
            }))
            next_step = list(object({
              session_attributes = optional(map(string))
              dialog_action      = optional(list(object({
                type                  = string
                slot_to_elicit        = optional(string) 
                suppress_next_message = optional(bool)
              })), [])
              intent             = optional(list(object({
                name = optional(string)
                slot = optional(list(object({
                  shape = optional(string)
                  value = optional(list(object({
                    interpreted_value = optional(string)
                  })), [])
                })), [])
              })), [])
            }))
            response = optional(list(object({
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
            })), [])
          })) 
          default_branch     = list(object({
            next_step = list(object({
              session_attributes = optional(map(string))
              dialog_action      = optional(list(object({
                type                  = string
                slot_to_elicit        = optional(string) 
                suppress_next_message = optional(bool)
              })), [])
              intent             = optional(list(object({
                name = optional(string)
                slot = optional(list(object({
                  shape = optional(string)
                  value = optional(list(object({
                    interpreted_value = optional(string)
                  })), [])
                })), [])
              })), [])
            }))
            response = optional(list(object({
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
            })), [])
          }))
        })),[])
        failure_next_step   = optional(list(object({
          session_attributes = optional(map(string))
          dialog_action      = optional(list(object({
            type                  = string
            slot_to_elicit        = optional(string)
            suppress_next_message = optional(bool)
          })), [])
          intent             = optional(list(object({
            name = optional(string)
            slot = optional(list(object({
              shape = optional(string)
              value = optional(list(object({
                interpreted_value = optional(string)
              })), [])
            })), [])
          })), [])          
        })),[])
        failure_response    = optional(list(object({
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
        })),[])
        success_conditional = optional(list(object({
          active = bool
          conditional_branch = list(object({
            name      = string
            condition = list(object({
              expression_string = string
            }))
            next_step = list(object({
              session_attributes = optional(map(string))
              dialog_action      = optional(list(object({
                type                  = string
                slot_to_elicit        = optional(string) 
                suppress_next_message = optional(bool)
              })), [])
              intent             = optional(list(object({
                name = optional(string)
                slot = optional(list(object({
                  shape = optional(string)
                  value = optional(list(object({
                    interpreted_value = optional(string)
                  })), [])
                })), [])
              })), [])
            }))
            response = optional(list(object({
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
            })), [])
          })) 
          default_branch     = list(object({
            next_step = list(object({
              session_attributes = optional(map(string))
              dialog_action      = optional(list(object({
                type                  = string
                slot_to_elicit        = optional(string) 
                suppress_next_message = optional(bool)
              })), [])
              intent             = optional(list(object({
                name = optional(string)
                slot = optional(list(object({
                  shape = optional(string)
                  value = optional(list(object({
                    interpreted_value = optional(string)
                  })), [])
                })), [])
              })), [])
            }))
            response = optional(list(object({
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
            })), [])
          }))
        })),[])
        success_next_step   = optional(list(object({
          session_attributes = optional(map(string))
          dialog_action      = optional(list(object({
            type                  = string
            slot_to_elicit        = optional(string)
            suppress_next_message = optional(bool)
          })), [])
          intent             = optional(list(object({
            name = optional(string)
            slot = optional(list(object({
              shape = optional(string)
              value = optional(list(object({
                interpreted_value = optional(string)
              })), [])
            })), [])
          })), [])          
        })),[])
        success_response    = optional(list(object({
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
        })),[])
        timeout_conditional = optional(list(object({
          active = bool
          conditional_branch = list(object({
            name      = string
            condition = list(object({
              expression_string = string
            }))
            next_step = list(object({
              session_attributes = optional(map(string))
              dialog_action      = optional(list(object({
                type                  = string
                slot_to_elicit        = optional(string) 
                suppress_next_message = optional(bool)
              })), [])
              intent             = optional(list(object({
                name = optional(string)
                slot = optional(list(object({
                  shape = optional(string)
                  value = optional(list(object({
                    interpreted_value = optional(string)
                  })), [])
                })), [])
              })), [])
            }))
            response = optional(list(object({
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
            })), [])
          })) 
          default_branch     = list(object({
            next_step = list(object({
              session_attributes = optional(map(string))
              dialog_action      = optional(list(object({
                type                  = string
                slot_to_elicit        = optional(string) 
                suppress_next_message = optional(bool)
              })), [])
              intent             = optional(list(object({
                name = optional(string)
                slot = optional(list(object({
                  shape = optional(string)
                  value = optional(list(object({
                    interpreted_value = optional(string)
                  })), [])
                })), [])
              })), [])
            }))
            response = optional(list(object({
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
            })), [])
          }))
        })),[])
        timeout_next_step   = optional(list(object({
          session_attributes = optional(map(string))
          dialog_action      = optional(list(object({
            type                  = string
            slot_to_elicit        = optional(string)
            suppress_next_message = optional(bool)
          })), [])
          intent             = optional(list(object({
            name = optional(string)
            slot = optional(list(object({
              shape = optional(string)
              value = optional(list(object({
                interpreted_value = optional(string)
              })), [])
            })), [])
          })), [])
        })),[])
        timeout_response    = optional(list(object({
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
        })),[])
      })) 
    })), [])
    confirmation_conditional = optional(list(object({
      active = bool
      conditional_branch = list(object({
        name      = string
        condition = list(object({
          expression_string = string
        }))
        next_step = list(object({
          session_attributes = optional(map(string))
          dialog_action      = optional(list(object({
            type                  = string
            slot_to_elicit        = optional(string) 
            suppress_next_message = optional(bool)
          })), [])
          intent             = optional(list(object({
            name = optional(string)
            slot = optional(list(object({
              shape = optional(string)
              value = optional(list(object({
                interpreted_value = optional(string)
              })), [])
            })), [])
          })), [])
        }))
        response = optional(list(object({
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
        })), [])
      })) 
      default_branch     = list(object({
        next_step = list(object({
          session_attributes = optional(map(string))
          dialog_action      = optional(list(object({
            type                  = string
            slot_to_elicit        = optional(string) 
            suppress_next_message = optional(bool)
          })), [])
          intent             = optional(list(object({
            name = optional(string)
            slot = optional(list(object({
              shape = optional(string)
              value = optional(list(object({
                interpreted_value = optional(string)
              })), [])
            })), [])
          })), [])
        }))
        response = optional(list(object({
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
        })), [])
      }))
    })), [])
    confirmation_next_step   = optional(list(object({
      session_attributes = optional(map(string))
      dialog_action      = optional(list(object({
        type                  = string
        slot_to_elicit        = optional(string)
        suppress_next_message = optional(bool)
      })), [])
      intent             = optional(list(object({
        name = optional(string)
        slot = optional(list(object({
          shape = optional(string)
          value = optional(list(object({
            interpreted_value = optional(string)
          })), [])
        })), [])
      })), [])
    })), [])
    confirmation_response    = optional(list(object({
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
    })), [])
    declination_conditional  = optional(list(object({
      active = bool
      conditional_branch = list(object({
        name      = string
        condition = list(object({
          expression_string = string
        }))
        next_step = list(object({
          session_attributes = optional(map(string))
          dialog_action      = optional(list(object({
            type                  = string
            slot_to_elicit        = optional(string) 
            suppress_next_message = optional(bool)
          })), [])
          intent             = optional(list(object({
            name = optional(string)
            slot = optional(list(object({
              shape = optional(string)
              value = optional(list(object({
                interpreted_value = optional(string)
              })), [])
            })), [])
          })), [])
        }))
        response = optional(list(object({
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
        })), [])
      })) 
      default_branch     = list(object({
        next_step = list(object({
          session_attributes = optional(map(string))
          dialog_action      = optional(list(object({
            type                  = string
            slot_to_elicit        = optional(string) 
            suppress_next_message = optional(bool)
          })), [])
          intent             = optional(list(object({
            name = optional(string)
            slot = optional(list(object({
              shape = optional(string)
              value = optional(list(object({
                interpreted_value = optional(string)
              })), [])
            })), [])
          })), [])
        }))
        response = optional(list(object({
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
        })), [])
      }))
    })), [])
    declination_next_step    = optional(list(object({
      session_attributes = optional(map(string))
      dialog_action      = optional(list(object({
        type                  = string
        slot_to_elicit        = optional(string)
        suppress_next_message = optional(bool)
      })), [])
      intent             = optional(list(object({
        name = optional(string)
        slot = optional(list(object({
          shape = optional(string)
          value = optional(list(object({
            interpreted_value = optional(string)
          })), [])
        })), [])
      })), [])
    })), [])
    declination_response     = optional(list(object({
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
    })), [])
    elicitation_code_hook    = optional(list(object({
      enable_code_hook_invocation = optional(bool)
      invocation_label            = optional(string)
    })), [])
    failure_conditional      = optional(list(object({
      active = bool
      conditional_branch = list(object({
        name      = string
        condition = list(object({
          expression_string = string
        }))
        next_step = list(object({
          session_attributes = optional(map(string))
          dialog_action      = optional(list(object({
            type                  = string
            slot_to_elicit        = optional(string) 
            suppress_next_message = optional(bool)
          })), [])
          intent             = optional(list(object({
            name = optional(string)
            slot = optional(list(object({
              shape = optional(string)
              value = optional(list(object({
                interpreted_value = optional(string)
              })), [])
            })), [])
          })), [])
        }))
        response = optional(list(object({
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
        })), [])
      })) 
      default_branch     = list(object({
        next_step = list(object({
          session_attributes = optional(map(string))
          dialog_action      = optional(list(object({
            type                  = string
            slot_to_elicit        = optional(string) 
            suppress_next_message = optional(bool)
          })), [])
          intent             = optional(list(object({
            name = optional(string)
            slot = optional(list(object({
              shape = optional(string)
              value = optional(list(object({
                interpreted_value = optional(string)
              })), [])
            })), [])
          })), [])
        }))
        response = optional(list(object({
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
        })), [])
      }))
    })), [])
    failure_next_step        = optional(list(object({
      session_attributes = optional(map(string))
      dialog_action      = optional(list(object({
        type                  = string
        slot_to_elicit        = optional(string)
        suppress_next_message = optional(bool)
      })), [])
      intent             = optional(list(object({
        name = optional(string)
        slot = optional(list(object({
          shape = optional(string)
          value = optional(list(object({
            interpreted_value = optional(string)
          })), [])
        })), [])
      })), [])
    })), [])
    failure_response         = optional(list(object({
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
    })), [])
    prompt_specification     = list(object({
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
    }))
  }))
  default     = []
}
variable "lexv2models_intent_dialog_code_hook" {
  description = "(Optional) Configuration block for invoking the alias Lambda function for each user input. You can invoke this Lambda function to personalize user interaction"
  type        = list(object({
    enabled = bool
  }))
  default     = []
}
variable "lexv2models_intent_fulfillment_code_hook" {
  description = "(Optional) Configuration block for invoking the alias Lambda function when the intent is ready for fulfillment. You can invoke this function to complete the bot's transaction with the user"
  type        = list(object({
    active                                = optional(bool)
    enabled                               = bool
    fulfillment_updates_specification     = optional(list(object({
      active             = bool
      timeout_in_seconds = optional(number)
      start_response     = optional(list(object({
        allow_interrupt  = optional(bool)
        delay_in_seconds = optional(number)
        message_group    = list(object({
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
      update_response    = optional(list(object({
        allow_interrupt      = optional(bool)
        frequency_in_seconds = number
        message_group    = list(object({
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
    post_fulfillment_status_specification = optional(list(object({
      failure_conditional = optional(list(object({
        active = bool
        conditional_branch = list(object({
          name      = string
          condition = list(object({
            expression_string = string
          }))
          next_step = list(object({
            session_attributes = optional(map(string))
            dialog_action      = optional(list(object({
              type                  = string
              slot_to_elicit        = optional(string) 
              suppress_next_message = optional(bool)
            })), [])
            intent             = optional(list(object({
              name = optional(string)
              slot = optional(list(object({
                shape = optional(string)
                value = optional(list(object({
                  interpreted_value = optional(string)
                })), [])
              })), [])
            })), [])
          }))
          response = optional(list(object({
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
          })), [])
        })) 
        default_branch     = list(object({
          next_step = list(object({
            session_attributes = optional(map(string))
            dialog_action      = optional(list(object({
              type                  = string
              slot_to_elicit        = optional(string) 
              suppress_next_message = optional(bool)
            })), [])
            intent             = optional(list(object({
              name = optional(string)
              slot = optional(list(object({
                shape = optional(string)
                value = optional(list(object({
                  interpreted_value = optional(string)
                })), [])
              })), [])
            })), [])
          }))
          response = optional(list(object({
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
          })), [])
        }))
      })), [])
      failure_next_step   = optional(list(object({
        session_attributes = optional(map(string))
        dialog_action      = optional(list(object({
          type                  = string
          slot_to_elicit        = optional(string)
          suppress_next_message = optional(bool)
        })), [])
        intent             = optional(list(object({
          name = optional(string)
          slot = optional(list(object({
            shape = optional(string)
            value = optional(list(object({
              interpreted_value = optional(string)
            })), [])
          })), [])
        })), [])
      })), [])
      failure_response    = optional(list(object({
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
      })), [])
      success_conditional = optional(list(object({
        active = bool
        conditional_branch = list(object({
          name      = string
          condition = list(object({
            expression_string = string
          }))
          next_step = list(object({
            session_attributes = optional(map(string))
            dialog_action      = optional(list(object({
              type                  = string
              slot_to_elicit        = optional(string) 
              suppress_next_message = optional(bool)
            })), [])
            intent             = optional(list(object({
              name = optional(string)
              slot = optional(list(object({
                shape = optional(string)
                value = optional(list(object({
                  interpreted_value = optional(string)
                })), [])
              })), [])
            })), [])
          }))
          response = optional(list(object({
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
          })), [])
        })) 
        default_branch     = list(object({
          next_step = list(object({
            session_attributes = optional(map(string))
            dialog_action      = optional(list(object({
              type                  = string
              slot_to_elicit        = optional(string) 
              suppress_next_message = optional(bool)
            })), [])
            intent             = optional(list(object({
              name = optional(string)
              slot = optional(list(object({
                shape = optional(string)
                value = optional(list(object({
                  interpreted_value = optional(string)
                })), [])
              })), [])
            })), [])
          }))
          response = optional(list(object({
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
          })), [])
        }))
      })), [])
      success_next_step   = optional(list(object({
        session_attributes = optional(map(string))
        dialog_action      = optional(list(object({
          type                  = string
          slot_to_elicit        = optional(string)
          suppress_next_message = optional(bool)
        })), [])
        intent             = optional(list(object({
          name = optional(string)
          slot = optional(list(object({
            shape = optional(string)
            value = optional(list(object({
              interpreted_value = optional(string)
            })), [])
          })), [])
        })), [])
      })), [])
      success_response    = optional(list(object({
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
      })), [])
      timeout_conditional = optional(list(object({
        active = bool
        conditional_branch = list(object({
          name      = string
          condition = list(object({
            expression_string = string
          }))
          next_step = list(object({
            session_attributes = optional(map(string))
            dialog_action      = optional(list(object({
              type                  = string
              slot_to_elicit        = optional(string) 
              suppress_next_message = optional(bool)
            })), [])
            intent             = optional(list(object({
              name = optional(string)
              slot = optional(list(object({
                shape = optional(string)
                value = optional(list(object({
                  interpreted_value = optional(string)
                })), [])
              })), [])
            })), [])
          }))
          response = optional(list(object({
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
          })), [])
        })) 
        default_branch     = list(object({
          next_step = list(object({
            session_attributes = optional(map(string))
            dialog_action      = optional(list(object({
              type                  = string
              slot_to_elicit        = optional(string) 
              suppress_next_message = optional(bool)
            })), [])
            intent             = optional(list(object({
              name = optional(string)
              slot = optional(list(object({
                shape = optional(string)
                value = optional(list(object({
                  interpreted_value = optional(string)
                })), [])
              })), [])
            })), [])
          }))
          response = optional(list(object({
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
          })), [])
        }))
      })), [])
      timeout_next_step   = optional(list(object({
        session_attributes = optional(map(string))
        dialog_action      = optional(list(object({
          type                  = string
          slot_to_elicit        = optional(string)
          suppress_next_message = optional(bool)
        })), [])
        intent             = optional(list(object({
          name = optional(string)
          slot = optional(list(object({
            shape = optional(string)
            value = optional(list(object({
              interpreted_value = optional(string)
            })), [])
          })), [])
        })), [])
      })), [])
      timeout_response    = optional(list(object({
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
      })), [])
    })), [])
  }))
  default     = []
}
variable "lexv2models_intent_initial_response_setting" {
  description = "(Optional) Configuration block for the response that is sent to the user at the beginning of a conversation, before eliciting slot values"
  type        = list(object({
    code_hook = optional(list(object({
      active                       = bool
      enable_code_hook_invocation  = bool
      invocation_label             = optional(string)
      post_code_hook_specification = list(object({
        failure_conditional = optional(list(object({
          active = bool
          conditional_branch = list(object({
            name      = string
            condition = list(object({
              expression_string = string
            }))
            next_step = list(object({
              session_attributes = optional(map(string))
              dialog_action      = optional(list(object({
                type                  = string
                slot_to_elicit        = optional(string) 
                suppress_next_message = optional(bool)
              })), [])
              intent             = optional(list(object({
                name = optional(string)
                slot = optional(list(object({
                  shape = optional(string)
                  value = optional(list(object({
                    interpreted_value = optional(string)
                  })), [])
                })), [])
              })), [])
            }))
            response = optional(list(object({
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
            })), [])
          })) 
          default_branch     = list(object({
            next_step = list(object({
              session_attributes = optional(map(string))
              dialog_action      = optional(list(object({
                type                  = string
                slot_to_elicit        = optional(string) 
                suppress_next_message = optional(bool)
              })), [])
              intent             = optional(list(object({
                name = optional(string)
                slot = optional(list(object({
                  shape = optional(string)
                  value = optional(list(object({
                    interpreted_value = optional(string)
                  })), [])
                })), [])
              })), [])
            }))
            response = optional(list(object({
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
            })), [])
          }))
        })),[])
        failure_next_step   = optional(list(object({
          session_attributes = optional(map(string))
          dialog_action      = optional(list(object({
            type                  = string
            slot_to_elicit        = optional(string)
            suppress_next_message = optional(bool)
          })), [])
          intent             = optional(list(object({
            name = optional(string)
            slot = optional(list(object({
              shape = optional(string)
              value = optional(list(object({
                interpreted_value = optional(string)
              })), [])
            })), [])
          })), [])          
        })),[])
        failure_response    = optional(list(object({
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
        })),[])
        success_conditional = optional(list(object({
          active = bool
          conditional_branch = list(object({
            name      = string
            condition = list(object({
              expression_string = string
            }))
            next_step = list(object({
              session_attributes = optional(map(string))
              dialog_action      = optional(list(object({
                type                  = string
                slot_to_elicit        = optional(string) 
                suppress_next_message = optional(bool)
              })), [])
              intent             = optional(list(object({
                name = optional(string)
                slot = optional(list(object({
                  shape = optional(string)
                  value = optional(list(object({
                    interpreted_value = optional(string)
                  })), [])
                })), [])
              })), [])
            }))
            response = optional(list(object({
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
            })), [])
          })) 
          default_branch     = list(object({
            next_step = list(object({
              session_attributes = optional(map(string))
              dialog_action      = optional(list(object({
                type                  = string
                slot_to_elicit        = optional(string) 
                suppress_next_message = optional(bool)
              })), [])
              intent             = optional(list(object({
                name = optional(string)
                slot = optional(list(object({
                  shape = optional(string)
                  value = optional(list(object({
                    interpreted_value = optional(string)
                  })), [])
                })), [])
              })), [])
            }))
            response = optional(list(object({
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
            })), [])
          }))
        })),[])
        success_next_step   = optional(list(object({
          session_attributes = optional(map(string))
          dialog_action      = optional(list(object({
            type                  = string
            slot_to_elicit        = optional(string)
            suppress_next_message = optional(bool)
          })), [])
          intent             = optional(list(object({
            name = optional(string)
            slot = optional(list(object({
              shape = optional(string)
              value = optional(list(object({
                interpreted_value = optional(string)
              })), [])
            })), [])
          })), [])          
        })),[])
        success_response    = optional(list(object({
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
        })),[])
        timeout_conditional = optional(list(object({
          active = bool
          conditional_branch = list(object({
            name      = string
            condition = list(object({
              expression_string = string
            }))
            next_step = list(object({
              session_attributes = optional(map(string))
              dialog_action      = optional(list(object({
                type                  = string
                slot_to_elicit        = optional(string) 
                suppress_next_message = optional(bool)
              })), [])
              intent             = optional(list(object({
                name = optional(string)
                slot = optional(list(object({
                  shape = optional(string)
                  value = optional(list(object({
                    interpreted_value = optional(string)
                  })), [])
                })), [])
              })), [])
            }))
            response = optional(list(object({
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
            })), [])
          })) 
          default_branch     = list(object({
            next_step = list(object({
              session_attributes = optional(map(string))
              dialog_action      = optional(list(object({
                type                  = string
                slot_to_elicit        = optional(string) 
                suppress_next_message = optional(bool)
              })), [])
              intent             = optional(list(object({
                name = optional(string)
                slot = optional(list(object({
                  shape = optional(string)
                  value = optional(list(object({
                    interpreted_value = optional(string)
                  })), [])
                })), [])
              })), [])
            }))
            response = optional(list(object({
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
            })), [])
          }))
        })),[])
        timeout_next_step   = optional(list(object({
          session_attributes = optional(map(string))
          dialog_action      = optional(list(object({
            type                  = string
            slot_to_elicit        = optional(string)
            suppress_next_message = optional(bool)
          })), [])
          intent             = optional(list(object({
            name = optional(string)
            slot = optional(list(object({
              shape = optional(string)
              value = optional(list(object({
                interpreted_value = optional(string)
              })), [])
            })), [])
          })), [])
        })),[])
        timeout_response    = optional(list(object({
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
        })),[])
       })) 
     })), [])
     conditional       = optional(list(object({
      active             = bool
      conditional_branch = list(object({
        name      = string
        condition = list(object({
          expression_string = string
        }))
        next_step = list(object({
          session_attributes = optional(map(string))
          dialog_action      = optional(list(object({
            type                  = string
            slot_to_elicit        = optional(string) 
            suppress_next_message = optional(bool)
          })), [])
          intent             = optional(list(object({
            name = optional(string)
            slot = optional(list(object({
              shape = optional(string)
              value = optional(list(object({
                interpreted_value = optional(string)
              })), [])
            })), [])
          })), [])
        }))
        response = optional(list(object({
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
        })), [])
      })) 
      default_branch     = list(object({
        next_step = list(object({
          session_attributes = optional(map(string))
          dialog_action      = optional(list(object({
            type                  = string
            slot_to_elicit        = optional(string) 
            suppress_next_message = optional(bool)
          })), [])
          intent             = optional(list(object({
            name = optional(string)
            slot = optional(list(object({
              shape = optional(string)
              value = optional(list(object({
                interpreted_value = optional(string)
              })), [])
            })), [])
          })), [])
        }))
        response = optional(list(object({
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
        })), [])
      }))
     })), [])
     initial_response  = optional(list(object({
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
     })), []) 
     next_step         = optional(list(object({
       session_attributes = optional(map(string))
       dialog_action      = optional(list(object({
         type                  = string
         slot_to_elicit        = optional(string)
         suppress_next_message = optional(bool)
       })), [])
       intent             = optional(list(object({
         name = optional(string)
         slot = optional(list(object({
           shape = optional(string)
           value = optional(list(object({
             interpreted_value = optional(string)
           })), [])
         })), [])
       })), [])
     })), [])
  }))
  default     = []
}
variable "lexv2models_intent_input_context" {
  description = "(Optional) Configuration blocks for contexts that must be active for this intent to be considered by Amazon Lex. When an intent has an input context list, Amazon Lex only considers using the intent in an interaction with the user when the specified contexts are included in the active context list for the session. If the contexts are not active, then Amazon Lex will not use the intent. A context can be automatically activated using the outputContexts property or it can be set at runtime"
  type        = list(object({
    name = string
  }))
  default     = []
}
variable "lexv2models_intent_kendra_configuration" {
  description = "(Optional) Configuration block for information required to use the AMAZON.KendraSearchIntent intent to connect to an Amazon Kendra index. The AMAZON.KendraSearchIntent intent is called when Amazon Lex can't determine another intent to invoke. Cannot be used with qna_intent_configuration"
  type        = list(object({
    kendra_index                = string
    query_filter_string         = optional(string)
    query_filter_string_enabled = optional(bool)
  }))
  default     = []
}
variable "lexv2models_intent_qna_intent_configuration" {
  description = "(Optional) Configuration block for QnA intent settings. This is used when parent_intent_signature is set to AMAZON.QnAIntent. Cannot be used with kendra_configuration"
  type        = list(object({
    bedrock_model_configuration = optional(list(object({
      custom_prompt = optional(string)
      model_arn     = string
      trace_status  = optional(string)
      guardrail     = optional(list(object({
        identifier = string
        version    = string
      })), [])
    })), [])
    data_source_configuration   = optional(list(object({
      bedrock_knowledge_store_configuration = optional(list(object({
        bedrock_knowledge_base_arn = string
        exact_response             = bool
        exact_response_fields      = optional(list(object({
          answer_field = optional(string)

        })), [])
      })), [])
      kendra_configuration                  = optional(list(object({
        exact_response              = optional(bool)
        kendra_index                = string
        query_filter_string         = optional(string)
        query_filter_string_enabled = optional(bool)
      })), [])
      opensearch_configuration              = optional(list(object({
        domain_endpoint       = string
        exact_response        = optional(bool)
        include_fields        = optional(list(string))
        index_name            = string
        exact_response_fields = optional(list(object({
          answer_field   = string
          question_field = string
        })), [])
      })), []) 
    })), [])
  }))
  default     = []
}
variable "lexv2models_intent_output_context" {
  description = "(Optional) Configuration blocks for contexts that the intent activates when it is fulfilled. You can use an output context to indicate the intents that Amazon Lex should consider for the next turn of the conversation with a customer. When you use the outputContextsList property, all of the contexts specified in the list are activated when the intent is fulfilled. You can set up to 10 output contexts. You can also set the number of conversation turns that the context should be active, or the length of time that the context should be active"
  type        = list(object({
    name                    = string
    time_to_live_in_seconds = number
    turns_to_live           = number
  }))
  default     = []
}
variable "lexv2models_intent_sample_utterance" {
  description = "(Optional) Configuration block for strings that a user might say to signal the intent"
  type        = list(object({
    utterance = string
  }))
  default     = []
}
variable "lexv2models_intent_slot_priority" {
  description = "(Optional) Configuration block for a new list of slots and their priorities that are contained by the intent. This is ignored on create and only valid for updates"
  type        = list(object({
    priority = number
    slot_id  = string
  }))
  default     = []
}
