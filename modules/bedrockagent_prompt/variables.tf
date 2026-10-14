variable "bedrockagent_prompt_customer_encryption_key_arn" {
  description = "(Optional) ARN of the KMS key that you encrypted the prompt with"
  type        = string
  default     = null
}
variable "bedrockagent_prompt_default_variant" {
  description = "(Optional) Name of the default variant for your prompt"
  type        = string
  default     = null
}
variable "bedrockagent_prompt_description" {
  description = "(Optional) Description of the prompt"
  type        = string
  default     = null
}
variable "bedrockagent_prompt_name" {
  description = "(Required) Name of the prompt"
  type        = string
  default     = null
}
variable "bedrockagent_prompt_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "bedrockagent_prompt_variant" {
  description = "(Optional) List of objects, each containing details about a variant of the prompt"
  type        = list(object({
    additional_model_request_fields = optional(string)
    model_id                        =  optional(string)
    name   			    = string
    template_type 		    = string
    gen_ai_resource         = optional(list(object({
      agent = optional(list(object({
        agent_identifier = string
      })), [])
    })), [])
    inference_configuration = optional(list(object({
      text = optional(list(object({
        max_tokens     = optional(number)
 	stop_sequences = optional(list(string))
 	temperature    = optional(number)
	top_p	       = optional(number)
      })), [])
    })), [])
    metadata                = optional(list(object({
      key   = string
      value = string 
    })), [])
    template_configuration  = optional(list(object({
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
	system 	           = optional(list(object({
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
	    tool = optional(list(object({
	      name = string
	    })), [])
          })), [])
        })), [])
      })), [])
      text = optional(list(object({
	text           = string
 	cache_point    = optional(list(object({
	  tyoe = string
 	})), [])
        input_variable = optional(list(object({
          name = string
        })), [])
      })), [])
    })), [])
  }))
  default     = []
}
