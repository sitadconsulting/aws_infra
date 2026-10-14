resource "aws_bedrockagent_flow" "bedrockagent_flow" {
  customer_encryption_key_arn = var.bedrockagent_flow_customer_encryption_key_arn
  description                 = var.bedrockagent_flow_description
  execution_role_arn          = var.bedrockagent_flow_execution_role_arn
  name                        = var.bedrockagent_flow_name
  tags                        = var.bedrockagent_flow_tags

  dynamic "definition" {
    for_each = var.bedrockagent_flow_definition
      content {
        dynamic "connection" {
          for_each = definition.value.connection
            content {
              name   = connection.value["name"]
              source = connection.value["source"] 
              target = connection.value["target"]
              type   = connection.value["type"]
              dynamic "configuration" {
                for_each = connection.value.configuration
                  content {
                    dynamic "conditional" {
                      for_each = configuration.value.conditional
                        content {
                          condition = conditional.value["condition"]
                        }
                    }
                    dynamic "data" {
                      for_each = configuration.value.data
                        content {
                          source_output = data.value["source_output"]
                          target_input  = data.value["target_input"]
                        }
                    }
                  }
              }
            }
        }
        dynamic "node" {
          for_each = definition.value.node
            content {
              name = node.value["name"]
              type = node.value["type"]
              dynamic "configuration" {
                for_each = node.value.configuration
                  content {
                    collector = configuration.value["collector"]
                    input     = configuration.value["input"]
                    iterator  = configuration.value["iterator"]
                    output    = configuration.value["output"]
                    dynamic "agent" {
                      for_each = configuration.value.agent 
                        content {
                          agent_alias_arn = agent.value["agent_alias_arn"]
                        }
                    }
                    dynamic "condition" {
                      for_each = configuration.value.condition
                        content {
                          dynamic "condition" {
                            for_each = condition.value.condition
                              content {
                                expression = condition.value["expression"]
                                name       = condition.value["name"]
                              }
                          }
                        }
                    }
                    dynamic "inline_code" {
                      for_each = configuration.value.inline_code
                        content {
                          code     = inline_code.value["code"]
                          language = inline_code.value["language"]
                        }
                    }
                    dynamic "knowledge_base" {
                      for_each = configuration.value.knowledge_base
                        content {
                          knowledge_base_id = knowledge_base.value["knowledge_base_id"]
                          model_id          = knowledge_base.value["model_id"]
                          number_of_results = knowledge_base.value["number_of_results"]
                          dynamic "guardrail_configuration" {
                            for_each = knowledge_base.value.guardrail_configuration
                              content {
                                guardrail_identifier = guardrail_configuration.value["guardrail_identifier"]
                                guardrail_version    = guardrail_configuration.value["guardrail_version"]
                              }
                          }
                          dynamic "inference_configuration" {
                            for_each = knowledge_base.value.inference_configuration
                              content {
                                dynamic "text" {
                                  for_each = inference_configuration.value.text
                                    content {
                                      max_tokens     = text.value["max_tokens"]
                                      stop_sequences = text.value["stop_sequences"]
                                      temperature    = text.value["temperature"]
                                      top_p          = text.value["top_p"]
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "lambda_function" {
                      for_each = configuration.value.lambda_function
                        content {
                          lambda_arn = lambda_function.value["lambda_arn"]
                        }
                    }
                    dynamic "lex" {
                      for_each = configuration.value.lex
                        content {
                          bot_alias_arn = lex.value["bot_alias_arn"]
                          locale_id     = lex.value["locale_id"]
                        }
                    }
                    dynamic "prompt" {
                      for_each = configuration.value.prompt
                        content {
                          dynamic "guardrail_configuration" {
                            for_each = prompt.value.guardrail_configuration
                              content {
                                guardrail_identifier = guardrail_configuration.value["guardrail_identifier"]
                                guardrail_version    = guardrail_configuration.value["guardrail_version"] 
                              }
                          }
                          dynamic "source_configuration" {
                            for_each = prompt.value.source_configuration
                              content {
                                dynamic "inline" {
                                  for_each = source_configuration.value.inline
                                    content {
                                      additional_model_request_fields = inline.value["additional_model_request_fields"]
                                      model_id                        = inline.value["model_id"]
                                      template_type                   = inline.value["template_type"]
                                      dynamic "inference_configuration" {
                                        for_each = inline.value.inference_configuration
                                          content {
                                            dynamic "text" {
                                              for_each = inference_configuration.value.text
                                                content {
                                                  max_tokens     = text.value["max_tokens"]
                                                  stop_sequences = text.value["stop_sequences"]
                                                  temperature    = text.value["temperature"]
                                                  top_p          = text.value["top_p"]
                                                }
                                            }
                                          }
                                      }
                                      dynamic "template_configuration" {
                                        for_each = inline.value.template_configuration
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
                                                                    type  = cache_point.value["type"]
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
								    description = tool_spec.value["description"]
                  						    name        = tool_spec.value["name"]
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
                                                                for_eaah = tool_choice.value.tool
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
							type  = cache_point.value["type"]
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
                                dynamic "resource" {
                                  for_each = source_configuration.value.resource
                                    content {
				      prompt_arn = resource.value["prompt_arn"]
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "retrieval" {
                      for_each = configuration.value.retrieval
                        content {
			  dynamic "service_configuration" {
			    for_each = retrieval.value.service_configuration
			      content {
			        dynamic "s3" {
				  for_each = service_configuration.value.s3
				    content {
				      bucket_name = s3.value["bucket_name"]
				    }
				}	
			      }
                          }
                        }
                    }
                    dynamic "storage" {
                      for_each = configuration.value.storage
                        content {
			  dynamic "service_configuration" {
			    for_each = storage.value.service_configuration
			      content {
				dynamic "s3" {
				  for_each = service_configuration.value.s3
				    content {
				      bucket_name = s3.value["bucket_name"]
				    }
				}
			      }
                          }
                        }
                    }
                  }
              }
              dynamic "input" {
                for_each = node.value.input
                  content {
	            category   = input.value["category"]	    
                    expression = input.value["expression"]
 		    name       = input.value["name"]
		    type       = input.value["type"]
                  }
              }
              dynamic "output" {
                for_each = node.value.output
                  content {
                    name = output.value["name"]
                    type = output.value["type"]
                  }
              }
            }
        }
      }
  }
}
