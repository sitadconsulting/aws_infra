variable "bedrockagent_flow_customer_encryption_key_arn" {
  description = "(Optional) ARN of the KMS key to encrypt the flow"
  type        = string
  default     = null
}
variable "bedrockagent_flow_description" {
  description = "(Optional) Description for the flow"
  type        = string
  default     = null
}
variable "bedrockagent_flow_execution_role_arn" {
  description = "(Required) ARN of the service role with permissions to create and manage a flow. For more information"
  type        = string
}
variable "bedrockagent_flow_name" {
  description = "(Required) Name for the flow"
  type        = string
}
variable "bedrockagent_flow_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "bedrockagent_flow_definition" {
  description = "(Optional) Nodes and connections between nodes in the flow"
  type        = list(object({
    connection = optional(list(object({
      name          = string
      source        = string
      target        = string
      type          = string 
      configuration = list(object({
        conditional = optional(list(object({
          condition = string
        })), [])
        data        = optional(list(object({
          source_output = string
          target_input  = string
        })), [])
      })) 
    })), [])
    node       = optional(list(object({
      name          = string
      type          = string
      configuration = list(object({
        collector       = optional(list(string))
        input           = optional(list(string))
        iterator        = optional(list(string))
        output          = optional(list(string))
        agent           = optional(list(object({
          agent_alias_arn = string
        })), [])
        condition       = optional(list(object({
          condition = optional(list(object({
            expression = optional(string)
            name       = string
          })), [])
        })), [])
        inline_code     = optional(list(object({
          code     = string
          language = string
        })), [])
        knowledge_base  = optional(list(object({
          knowledge_base_id       = string
          model_id                = string
          number_of_results       = optional(number)
          guardrail_configuration = optional(list(object({
            guardrail_identifier = string
            guardrail_version    = string
          })), []) 
          inference_configuration = optional(list(object({
            text = optional(list(object({
              max_tokens     = optional(number)
              stop_sequences = optional(list(string))
              temperature    = optional(number)
              top_p          = optional(number)
            })), [])
          })), [])
        })), [])
        lambda_function = optional(list(object({
          lambda_arn = string
        })), [])
        lex             = optional(list(object({
          bot_alias_arn = string
          locale_id     = string
        })), [])
        prompt          = optional(list(object({
          guardrail_configuration = optional(list(object({
            guardrail_identifier = string
            guardrail_version    = string
          })), [])
          source_configuration    = optional(list(object({
            inline   = optional(list(object({
              additional_model_request_fields = optional(string)
              model_id                        = string
              template_type                   = string
              inference_configuration         = optional(list(object({
                text = optional(list(object({
                  max_tokens     = optional(number)
                  stop_sequences = optional(list(string))
                  temperature    = optional(number)
                  top_p          = optional(number)
                })), [])
              })), [])
              template_configuration          = optional(list(object({
                chat = optional(list(object({
                  input_variable     = optional(list(object({
                    name = string
                  })), [])
                  message            = optional(list(object({
                    role    = string
                    content = list(object({
                      text        = optional(string)
                      cache_point = optional(list(object({
                        type = string
                      })), [])
                    }))
                  })), [])
                  system             = optional(list(object({
                    text        = optional(string)
                    cache_point = optional(list(object({
                      type = string
                    })), [])
                  })), [])
                  tool_configuration = optional(list(object({
                    tool        = optional(list(object({
                      cache_point = optional(list(object({
                        type = string
                      })), [])
                      tool_spec   = optional(list(object({
                        description  = optional(string)
                        name         = string
                        input_schema = optional(list(object({
                          json = optional(string)
                        })), [])
                      })), [])
                    })), [])
                    tool_choice = optional(list(object({
                      any  = optional(list(string))
                      auto = optional(list(string))
                      tool = optinal(list(object({
                        name = string
                      })), [])
                    })), [])
                  })), [])
                })), [])
                text = optional(list(object({
                  text           = string
                  cache_point    = optional(list(object({
                    type = string
                  })), [])    
                  input_variable = optional(list(object({
                    name = string
                  })), [])
                })), [])
              })), [])
            })), [])
            resource = optinal(list(object({
              prompt_arn = string
            })), [])
          })), [])
        })), [])
        retrieval       = optional(list(object({
          service_configuration = list(object({
            s3 = optional(list(object({
              bucket_name = string
            })), [])
          }))
        })), [])
        storage         = optional(list(object({
          service_configuration = list(object({
            s3 = optional(list(object({
              bucket_name = string
            })), [])
          }))
        })), [])
      }))
      input         = optional(list(object({
        category   = optional(string)
        expression = string 
        name       = string
        type       = string

      })), [])
      output        = optional(list(object({
        name = string
        type = string
      })), [])
    })), [])
  }))
  default     = []
}
