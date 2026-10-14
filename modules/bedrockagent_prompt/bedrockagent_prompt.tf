resource "aws_bedrockagent_prompt" "bedrockagent_prompt" {
  customer_encryption_key_arn = var.bedrockagent_prompt_customer_encryption_key_arn
  default_variant             = var.bedrockagent_prompt_default_variant
  description                 = var.bedrockagent_prompt_description
  name                        = var.bedrockagent_prompt_name
  tags                        = var.bedrockagent_prompt_tags

  dynamic "variant" {
    for_each = var.bedrockagent_prompt_variant
      content {
        additional_model_request_fields = variant.value["additional_model_request_fields"] 
        model_id                        = variant.value["model_id"]
        name                            = variant.value["name"]
        template_type                   = variant.value["template_type"]
        dynamic "gen_ai_resource" {
          for_each = variant.value.gen_ai_resource
            content {
              dynamic "agent" {
		for_each = gen_ai_resource.value.agent
 		  content {
		    agent_identifier = agent.value["agent_identifier"]
		  }
  	      }
            }
        }       
        dynamic "inference_configuration" {
          for_each = variant.value.inference_configuration
            content {
	      dynamic "text" {
		for_Each = inference_configuration.value.text
		  content {
		    max_tokens     = text.value["max_tokens"]
     		    stop_sequences = text.value["stop_sequences"]
  		    temperature    = text.value["temperature"]
 		    top_p   	   = text.value["top_p"]
		  }
	      }
            }
        }
        dynamic "metadata" {
	  for_each = variant.value.metadata
	    content {
	      key   = metadata.value["key"]
              value = metadata.value["value"]	
	    }
        }
        dynamic "template_configuration" {
	  for_each = variant.value.template_configuration
	    content {
	      dynamic "chat" {
		for_each = template_configuration.value.chat
 		  content {
		    dynamic "input_variable" {
                      for_each = chat.value.input_variable
			content {
			  name = input_variable.value["name"]
			}
		    }
		    dynamic "message" {
		      for_each = chat.value.message
			content {
			  role = message.value["role"]
 			  dynamic "content" {
			    for_each = message.value.content
			      content {
				text = content.value["text"]
				dynamic "cache_point" {
				  for_each = content.value.cache_point
				    content {
				      type = cache_point.value["type"]
				    }
				}
			      }
			  }
			}
		    }
                    dynamic "system" {
		      for_each = chat.value.system
			content {
                          text = system.value["text"]
			  dynamic "cache_point" {
			    for_each = system.value.cache_point
			      content {
				type = cache_point.value["type"]
			      }
			  }
			}
                    }
                    dynamic "tool_configuration" {
		      for_each = chat.value.tool_configuration
			content {
		          dynamic "tool" {
			    for_each = tool_configuration.value.tool
			      content {
				dynamic "cache_point" {
				  for_each = tool.value.cache_point
				    content {
				      type = cache_point.value["type"]	
				    }
				}
				dynamic "tool_spec" {
				  for_each = tool.value.tool_spec
				    content {
				      description  = tool_spec.value["description"]
				      name  	   = tool_spec.value["name"]
 				      dynamic "input_schema" {
					for_each = tool_spec.value.input_schema
					  content {
					    json = input_schema.value["json"]
					  }
				      } 
				    }
				}
			      }
			  }	
			  dynamic "tool_choice" {
			    for_each = tool_configuration.value.tool_choice
			      content {
				any  = tool_choice.value["any"]
				auto = tool_choice.value["auto"]
				dynamic "tool" {
				  for_each = tool_choice.value.tool
				    content {
				      name = tool.value["name"]
				    }
				}
			      }
 			  }
			}
                    }
		  }
              }
	      dynamic "text" {
		for_each = template_configuration.value.text
		  content {
		    text = text.value["text"]
 		    dynamic "cache_point" {
		      for_each = text.value.cache_point
			content {
                          type = cache_point.value["type"]
			}
		    }
		    dynamic "input_variable" {
		      for_each = text.value.input_variable
			content {
			  name = input_variable.value["name"]
			}
		    }
		  }
	      }
	    }
        }
      }
  }
}
