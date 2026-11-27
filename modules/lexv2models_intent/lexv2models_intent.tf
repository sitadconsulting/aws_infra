resource "aws_lexv2models_intent" "lexv2models_intent" {
  bot_id                  = var.lexv2models_intent_bot_id
  bot_version             = var.lexv2models_intent_bot_version
  description             = var.lexv2models_intent_description
  locale_id               = var.lexv2models_intent_locale_id
  name                    = var.lexv2models_intent_name
  parent_intent_signature = var.lexv2models_intent_parent_intent_signature
  
  dynamic "closing_setting" {
    for_each = var.lexv2models_intent_closing_setting
      content {
        active = closing_setting.value["active"]
        dynamic "closing_response" {
          for_each = closing_setting.value.closing_response
            content {
              allow_interrupt = closing_response.value["allow_interrupt"]
              dynamic "message_group" {
                for_each = closing_response.value.message_group
                  content {
                    dynamic "message" {
                      for_each = message_group.value.message
                        content {
                           dynamic "custom_payload" {
                             for_each = message.value.custom_payload
                               content {
                                 value = custom_payload.value["value"]
                               } 
                           }
                           dynamic "image_response_card" {
                             for_each = message.value.image_response_card
                               content {
                                 image_url = image_response_card.value["image_url"]
                                 subtitle  = image_response_card.value["subtitle"]
                                 title     = image_response_card.value["title"]
                                 dynamic "button" {
                                   for_each = image_response_card.value.button
                                     content {
                                       text  = button.value["text"]
                                       value = button.value["value"]
                                     }
                                 }
                               } 
                           }
                           dynamic "plain_text_message" {
                             for_each = message.value.plain_text_message
                               content {
                                 value = plain_text_message.value["value"]
                               } 
                           }
                           dynamic "ssml_message" {
                             for_each = message.value.ssml_message
                               content {
                                 value = ssml_message.value["value"]
                               } 
                           }
                        }
                    }
                    dynamic "variation" {
                      for_each = message_group.value.variation
                        content {
                           dynamic "custom_payload" {
                             for_each = variation.value.custom_payload
                               content {
                                 value = custom_payload.value["value"]
                               }
                           }
                           dynamic "image_response_card" {
                             for_each = variation.value.image_response_card
                               content {
                                 image_url = image_response_card.value["image_url"]
                                 subtitle  = image_response_card.value["subtitle"]
                                 title     = image_response_card.value["title"]
                                 dynamic "button" {
                                   for_each = image_response_card.value.button
                                     content {
                                       text  = button.value["text"]
                                       value = button.value["value"]
                                     }
                                 }
                               }
                           }
                           dynamic "plain_text_message" {
                             for_each = variation.value.plain_text_message
                               content {
                                 value = plain_text_message.value["value"]
                               }
                           }
                           dynamic "ssml_message" {
                             for_each = variation.value.ssml_message
                               content {
                                 value = ssml_message.value["value"]
                               }
                           }                          
                        }
                    }
                  }
              }
            }
        }
        dynamic "conditional" {
          for_each = closing_setting.value.conditional
            content {
              active = conditional.value["active"]
              dynamic "conditional_branch" {
                for_each = conditional.value.conditional_branch
                  content {
                    name = conditional_branch.value["name"]
                    dynamic "condition" {
                      for_each = conditional_branch.value.condition
                        content {
                          expression_string = condition.value["expression_string"]
                        }
                    }
                    dynamic "next_step" {
                      for_each = conditional_branch.value.next_step
                        content {
                          session_attributes = next_step.value["session_attributes"]
                          dynamic "dialog_action" {
                            for_each = next_step.value.dialog_action
                              content {
                                type                  = dialog_action.value["type"]
                                slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                suppress_next_message = dialog_action.value["suppress_next_message"]
                              }
                          }
                          dynamic "intent" {
                            for_each = next_step.value.intent
                              content {
                                name = intent.value["name"]
                                dynamic "slot" {
                                  for_each = intent.value.slot
                                    content {
                                      shape = slot.value["shape"]
                                      dynamic "value" {
                                        for_each = slot.value.value
                                          content {
                                            interpreted_value = value.value["interpreted_value"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "response" {
                      for_each = conditional_branch.value.response
                        content {
                          allow_interrupt = response.value["allow_interrupt"]
                          dynamic "message_group" {
                            for_each = response.value.message_group
                              content {
                                dynamic "message" {
                                  for_each = message_group.value.message
                                    content {
                                       dynamic "custom_payload" {
                                         for_each = message.value.custom_payload
                                           content {
                                             value = custom_payload.value["value"]
                                           } 
                                       }
                                       dynamic "image_response_card" {
                                         for_each = message.value.image_response_card
                                           content {
                                             image_url = image_response_card.value["image_url"]
                                             subtitle  = image_response_card.value["subtitle"]
                                             title     = image_response_card.value["title"]
                                             dynamic "button" {
                                               for_each = image_response_card.value.button
                                                 content {
                                                   text  = button.value["text"]
                                                   value = button.value["value"]
                                                 }
                                             }
                                           } 
                                       }
                                       dynamic "plain_text_message" {
                                         for_each = message.value.plain_text_message
                                           content {
                                             value = plain_text_message.value["value"]
                                           } 
                                       }
                                       dynamic "ssml_message" {
                                         for_each = message.value.ssml_message
                                           content {
                                             value = ssml_message.value["value"]
                                           } 
                                       }
                                    }
                                }
                                dynamic "variation" {
                                  for_each = message_group.value.variation
                                    content {
                                       dynamic "custom_payload" {
                                         for_each = variation.value.custom_payload
                                           content {
                                             value = custom_payload.value["value"]
                                           }
                                       }
                                       dynamic "image_response_card" {
                                         for_each = variation.value.image_response_card
                                           content {
                                             image_url = image_response_card.value["image_url"]
                                             subtitle  = image_response_card.value["subtitle"]
                                             title     = image_response_card.value["title"]
                                             dynamic "button" {
                                               for_each = image_response_card.value.button
                                                 content {
                                                   text  = button.value["text"]
                                                   value = button.value["value"]
                                                 }
                                             }
                                           }
                                       }
                                       dynamic "plain_text_message" {
                                         for_each = variation.value.plain_text_message
                                           content {
                                             value = plain_text_message.value["value"]
                                           }
                                       }
                                       dynamic "ssml_message" {
                                         for_each = variation.value.ssml_message
                                           content {
                                             value = ssml_message.value["value"]
                                           }
                                       }                          
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "default_branch" {
                for_each = conditional.value.default_branch
                  content {
                    dynamic "next_step" {
                      for_each = default_branch.value.next_step
                        content {
                          session_attributes = next_step.value["session_attributes"]
                          dynamic "dialog_action" {
                            for_each = next_step.value.dialog_action
                              content {
                                type                  = dialog_action.value["type"]
                                slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                suppress_next_message = dialog_action.value["suppress_next_message"]
                              }
                          }
                          dynamic "intent" {
                            for_each = next_step.value.intent
                              content {
                                name = intent.value["name"]
                                dynamic "slot" {
                                  for_each = intent.value.slot
                                    content {
                                      shape = slot.value["shape"]
                                      dynamic "value" {
                                        for_each = slot.value.value
                                          content {
                                            interpreted_value = value.value["interpreted_value"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "response" {
                      for_each = default_branch.value.response
                        content {
                          allow_interrupt = response.value["allow_interrupt"]
                          dynamic "message_group" {
                            for_each = response.value.message_group
                              content {
                                dynamic "message" {
                                  for_each = message_group.value.message
                                    content {
                                       dynamic "custom_payload" {
                                         for_each = message.value.custom_payload
                                           content {
                                             value = custom_payload.value["value"]
                                           } 
                                       }
                                       dynamic "image_response_card" {
                                         for_each = message.value.image_response_card
                                           content {
                                             image_url = image_response_card.value["image_url"]
                                             subtitle  = image_response_card.value["subtitle"]
                                             title     = image_response_card.value["title"]
                                             dynamic "button" {
                                               for_each = image_response_card.value.button
                                                 content {
                                                   text  = button.value["text"]
                                                   value = button.value["value"]
                                                 }
                                             }
                                           } 
                                       }
                                       dynamic "plain_text_message" {
                                         for_each = message.value.plain_text_message
                                           content {
                                             value = plain_text_message.value["value"]
                                           } 
                                       }
                                       dynamic "ssml_message" {
                                         for_each = message.value.ssml_message
                                           content {
                                             value = ssml_message.value["value"]
                                           } 
                                       }
                                    }
                                }
                                dynamic "variation" {
                                  for_each = message_group.value.variation
                                    content {
                                       dynamic "custom_payload" {
                                         for_each = variation.value.custom_payload
                                           content {
                                             value = custom_payload.value["value"]
                                           }
                                       }
                                       dynamic "image_response_card" {
                                         for_each = variation.value.image_response_card
                                           content {
                                             image_url = image_response_card.value["image_url"]
                                             subtitle  = image_response_card.value["subtitle"]
                                             title     = image_response_card.value["title"]
                                             dynamic "button" {
                                               for_each = image_response_card.value.button
                                                 content {
                                                   text  = button.value["text"]
                                                   value = button.value["value"]
                                                 }
                                             }
                                           }
                                       }
                                       dynamic "plain_text_message" {
                                         for_each = variation.value.plain_text_message
                                           content {
                                             value = plain_text_message.value["value"]
                                           }
                                       }
                                       dynamic "ssml_message" {
                                         for_each = variation.value.ssml_message
                                           content {
                                             value = ssml_message.value["value"]
                                           }
                                       }                          
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "next_step" {
          for_each = closing_setting.value.next_step
            content {
              dynamic "next_step" {
                for_each = default_branch.value.next_step
                  content {
                    session_attributes = next_step.value["session_attributes"]
                    dynamic "dialog_action" {
                      for_each = next_step.value.dialog_action
                        content {
                          type                  = dialog_action.value["type"]
                          slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                          suppress_next_message = dialog_action.value["suppress_next_message"]
                        }
                    }
                    dynamic "intent" {
                      for_each = next_step.value.intent
                        content {
                          name = intent.value["name"]
                          dynamic "slot" {
                            for_each = intent.value.slot
                              content {
                                shape = slot.value["shape"]
                                dynamic "value" {
                                  for_each = slot.value.value
                                    content {
                                      interpreted_value = value.value["interpreted_value"]
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
      }
  }
  dynamic "confirmation_setting" {
    for_each = var.lexv2models_intent_confirmation_setting
      content {
        active = confirmation_setting.value["active"]
        dynamic "code_hook" {
          for_each = confirmation_setting.value.code_hook
            content {
              active                       = code_hook.value["active"]
              enable_code_hook_invocation  = code_hook.value["enable_code_hook_invocation"]
              invocation_label             = code_hook.value["invocation_label"]
              dynamic "post_code_hook_specification" {
                for_each = code_hook.value.post_code_hook_specification
                  content {
                    dynamic "failure_conditional" {
                      for_each = post_code_hook_specification.value.failure_conditional
                        content {
                          active = failure_conditional.value["active"]
                          dynamic "conditional_branch" {
                            for_each = failure_conditional.value.conditional_branch
                              content {
                                name = conditional_branch.value["name"]
                                dynamic "condition" {
                                  for_each = conditional_branch.value.condition
                                    content {
                                      expression_string = condition.value["expression_string"]
                                    }
                                }
                                dynamic "next_step" {
                                  for_each = conditional_branch.value.next_step
                                    content {
                                      session_attributes = next_step.value["session_attributes"]
                                      dynamic "dialog_action" {
                                        for_each = next_step.value.dialog_action
                                          content {
                                            type                  = dialog_action.value["type"]
                                            slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                            suppress_next_message = dialog_action.value["suppress_next_message"]
                                          }
                                      }
                                      dynamic "intent" {
                                        for_each = next_step.value.intent
                                          content {
                                            name = intent.value["name"]
                                            dynamic "slot" {
                                              for_each = intent.value.slot
                                                content {
                                                  shape = slot.value["shape"]
                                                  dynamic "value" {
                                                    for_each = slot.value.value
                                                      content {
                                                        interpreted_value = value.value["interpreted_value"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "response" {
                                  for_each = conditional_branch.value.response
                                    content {
                                      allow_interrupt = response.value["allow_interrupt"]
                                      dynamic "message_group" {
                                        for_each = response.value.message_group
                                          content {
                                            dynamic "message" {
                                              for_each = message_group.value.message
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = message.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       } 
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = message.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       } 
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = message.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       } 
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = message.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       } 
                                                   }
                                                }
                                            }
                                            dynamic "variation" {
                                              for_each = message_group.value.variation
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = variation.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       }
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = variation.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       }
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = variation.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       }
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = variation.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       }
                                                   }                          
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "default_branch" {
                            for_each = failure_conditional.value.default_branch
                              content {
                                dynamic "next_step" {
                                  for_each = default_branch.value.next_step
                                    content {
                                      session_attributes = next_step.value["session_attributes"]
                                      dynamic "dialog_action" {
                                        for_each = next_step.value.dialog_action
                                          content {
                                            type                  = dialog_action.value["type"]
                                            slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                            suppress_next_message = dialog_action.value["suppress_next_message"]
                                          }
                                      }
                                      dynamic "intent" {
                                        for_each = next_step.value.intent
                                          content {
                                            name = intent.value["name"]
                                            dynamic "slot" {
                                              for_each = intent.value.slot
                                                content {
                                                  shape = slot.value["shape"]
                                                  dynamic "value" {
                                                    for_each = slot.value.value
                                                      content {
                                                        interpreted_value = value.value["interpreted_value"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "response" {
                                  for_each = default_branch.value.response
                                    content {
                                      allow_interrupt = response.value["allow_interrupt"]
                                      dynamic "message_group" {
                                        for_each = response.value.message_group
                                          content {
                                            dynamic "message" {
                                              for_each = message_group.value.message
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = message.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       } 
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = message.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       } 
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = message.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       } 
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = message.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       } 
                                                   }
                                                }
                                            }
                                            dynamic "variation" {
                                              for_each = message_group.value.variation
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = variation.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       }
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = variation.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       }
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = variation.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       }
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = variation.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       }
                                                   }                          
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "failure_next_step" {
                      for_each = post_code_hook_specification.value.failure_next_step
                        content {
                          session_attributes = failure_next_step.value["session_attributes"]
                          dynamic "dialog_action" {
                            for_each = failure_next_step.value.dialog_action
                              content {
                                type                  = dialog_action.value["type"]
                                slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                suppress_next_message = dialog_action.value["suppress_next_message"]
                              }
                          }
                          dynamic "intent" {
                            for_each = failure_next_step.value.intent
                              content {
                                name = intent.value["name"]
                                dynamic "slot" {
                                  for_each = intent.value.slot
                                    content {
                                      shape = slot.value["shape"]
                                      dynamic "value" {
                                        for_each = slot.value.value
                                          content {
                                            interpreted_value = value.value["interpreted_value"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "failure_response" {
                      for_each = post_code_hook_specification.value.failure_response
                        content {
                          allow_interrupt = failure_response.value["allow_interrupt"]
                          dynamic "message_group" {
                            for_each = failure_response.value.message_group
                              content {
                                dynamic "message" {
                                  for_each = message_group.value.message
                                    content {
                                       dynamic "custom_payload" {
                                         for_each = message.value.custom_payload
                                           content {
                                             value = custom_payload.value["value"]
                                           } 
                                       }
                                       dynamic "image_response_card" {
                                         for_each = message.value.image_response_card
                                           content {
                                             image_url = image_response_card.value["image_url"]
                                             subtitle  = image_response_card.value["subtitle"]
                                             title     = image_response_card.value["title"]
                                             dynamic "button" {
                                               for_each = image_response_card.value.button
                                                 content {
                                                   text  = button.value["text"]
                                                   value = button.value["value"]
                                                 }
                                             }
                                           } 
                                       }
                                       dynamic "plain_text_message" {
                                         for_each = message.value.plain_text_message
                                           content {
                                             value = plain_text_message.value["value"]
                                           } 
                                       }
                                       dynamic "ssml_message" {
                                         for_each = message.value.ssml_message
                                           content {
                                             value = ssml_message.value["value"]
                                           } 
                                       }
                                    }
                                }
                                dynamic "variation" {
                                  for_each = message_group.value.variation
                                    content {
                                       dynamic "custom_payload" {
                                         for_each = variation.value.custom_payload
                                           content {
                                             value = custom_payload.value["value"]
                                           }
                                       }
                                       dynamic "image_response_card" {
                                         for_each = variation.value.image_response_card
                                           content {
                                             image_url = image_response_card.value["image_url"]
                                             subtitle  = image_response_card.value["subtitle"]
                                             title     = image_response_card.value["title"]
                                             dynamic "button" {
                                               for_each = image_response_card.value.button
                                                 content {
                                                   text  = button.value["text"]
                                                   value = button.value["value"]
                                                 }
                                             }
                                           }
                                       }
                                       dynamic "plain_text_message" {
                                         for_each = variation.value.plain_text_message
                                           content {
                                             value = plain_text_message.value["value"]
                                           }
                                       }
                                       dynamic "ssml_message" {
                                         for_each = variation.value.ssml_message
                                           content {
                                             value = ssml_message.value["value"]
                                           }
                                       }                          
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "success_conditional" {
                      for_each = post_code_hook_specification.value.success_conditional
                        content {
                          active = success_conditional.value["active"] 
                          dynamic "conditional_branch" {
                            for_each = success_conditional.value.conditional_branch
                              content {
                                name = conditional_branch.value["name"]
                                dynamic "condition" {
                                  for_each = conditional_branch.value.condition
                                    content {
                                      expression_string = condition.value["expression_string"]
                                    }
                                }
                                dynamic "next_step" {
                                  for_each = success_conditional.value.next_step
                                    content {
                                      session_attributes = next_step.value["session_attributes"]
                                      dynamic "dialog_action" {
                                        for_each = next_step.value.dialog_action
                                          content {
                                            type                  = dialog_action.value["type"]
                                            slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                            suppress_next_message = dialog_action.value["suppress_next_message"]
                                          }
                                      }
                                      dynamic "intent" {
                                        for_each = next_step.value.intent
                                          content {
                                            name = intent.value["name"]
                                            dynamic "slot" {
                                              for_each = intent.value.slot
                                                content {
                                                  shape = slot.value["shape"]
                                                  dynamic "value" {
                                                    for_each = slot.value.value
                                                      content {
                                                        interpreted_value = value.value["interpreted_value"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "response" {
                                  for_each = success_conditional.value.response
                                    content {
                                      allow_interrupt = response.value["allow_interrupt"]
                                      dynamic "message_group" {
                                        for_each = response.value.message_group
                                          content {
                                            dynamic "message" {
                                              for_each = message_group.value.message
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = message.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       } 
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = message.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       } 
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = message.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       } 
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = message.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       } 
                                                   }
                                                }
                                            }
                                            dynamic "variation" {
                                              for_each = message_group.value.variation
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = variation.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       }
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = variation.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       }
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = variation.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       }
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = variation.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       }
                                                   }                          
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "default_branch" {
                            for_each = success_conditional.value.default_branch
                              content {
                                dynamic "next_step" {
                                  for_each = default_branch.value.next_step
                                    content {
                                      session_attributes = next_step.value["session_attributes"]
                                      dynamic "dialog_action" {
                                        for_each = next_step.value.dialog_action
                                          content {
                                            type                  = dialog_action.value["type"]
                                            slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                            suppress_next_message = dialog_action.value["suppress_next_message"]
                                          }
                                      }
                                      dynamic "intent" {
                                        for_each = next_step.value.intent
                                          content {
                                            name = intent.value["name"]
                                            dynamic "slot" {
                                              for_each = intent.value.slot
                                                content {
                                                  shape = slot.value["shape"]
                                                  dynamic "value" {
                                                    for_each = slot.value.value
                                                      content {
                                                        interpreted_value = value.value["interpreted_value"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "response" {
                                  for_each = default_branch.value.response
                                    content {
                                      allow_interrupt = response.value["allow_interrupt"]
                                      dynamic "message_group" {
                                        for_each = response.value.message_group
                                          content {
                                            dynamic "message" {
                                              for_each = message_group.value.message
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = message.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       } 
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = message.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       } 
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = message.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       } 
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = message.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       } 
                                                   }
                                                }
                                            }
                                            dynamic "variation" {
                                              for_each = message_group.value.variation
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = variation.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       }
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = variation.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       }
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = variation.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       }
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = variation.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       }
                                                   }                          
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "success_next_step" {
                      for_each = post_code_hook_specification.value.success_next_step
                        content {
                          session_attributes = success_next_step.value["session_attributes"]
                          dynamic "dialog_action" {
                            for_each = success_next_step.value.dialog_action
                              content {
                                type                  = dialog_action.value["type"]
                                slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                suppress_next_message = dialog_action.value["suppress_next_message"]
                              }
                          }
                          dynamic "intent" {
                            for_each = success_next_step.value.intent
                              content {
                                name = intent.value["name"]
                                dynamic "slot" {
                                  for_each = intent.value.slot
                                    content {
                                      shape = slot.value["shape"]
                                      dynamic "value" {
                                        for_each = slot.value.value
                                          content {
                                            interpreted_value = value.value["interpreted_value"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "success_response" {
                      for_each = post_code_hook_specification.value.success_response
                        content {
                          allow_interrupt = success_response.value["allow_interrupt"]
                          dynamic "message_group" {
                            for_each = success_response.value.message_group
                              content {
                                dynamic "message" {
                                  for_each = message_group.value.message
                                    content {
                                       dynamic "custom_payload" {
                                         for_each = message.value.custom_payload
                                           content {
                                             value = custom_payload.value["value"]
                                           } 
                                       }
                                       dynamic "image_response_card" {
                                         for_each = message.value.image_response_card
                                           content {
                                             image_url = image_response_card.value["image_url"]
                                             subtitle  = image_response_card.value["subtitle"]
                                             title     = image_response_card.value["title"]
                                             dynamic "button" {
                                               for_each = image_response_card.value.button
                                                 content {
                                                   text  = button.value["text"]
                                                   value = button.value["value"]
                                                 }
                                             }
                                           } 
                                       }
                                       dynamic "plain_text_message" {
                                         for_each = message.value.plain_text_message
                                           content {
                                             value = plain_text_message.value["value"]
                                           } 
                                       }
                                       dynamic "ssml_message" {
                                         for_each = message.value.ssml_message
                                           content {
                                             value = ssml_message.value["value"]
                                           } 
                                       }
                                    }
                                }
                                dynamic "variation" {
                                  for_each = message_group.value.variation
                                    content {
                                       dynamic "custom_payload" {
                                         for_each = variation.value.custom_payload
                                           content {
                                             value = custom_payload.value["value"]
                                           }
                                       }
                                       dynamic "image_response_card" {
                                         for_each = variation.value.image_response_card
                                           content {
                                             image_url = image_response_card.value["image_url"]
                                             subtitle  = image_response_card.value["subtitle"]
                                             title     = image_response_card.value["title"]
                                             dynamic "button" {
                                               for_each = image_response_card.value.button
                                                 content {
                                                   text  = button.value["text"]
                                                   value = button.value["value"]
                                                 }
                                             }
                                           }
                                       }
                                       dynamic "plain_text_message" {
                                         for_each = variation.value.plain_text_message
                                           content {
                                             value = plain_text_message.value["value"]
                                           }
                                       }
                                       dynamic "ssml_message" {
                                         for_each = variation.value.ssml_message
                                           content {
                                             value = ssml_message.value["value"]
                                           }
                                       }                          
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "timeout_conditional" {
                      for_each = post_code_hook_specification.value.timeout_conditional
                        content {
                          active = timeout_conditional.value["active"]
                          dynamic "conditional_branch" {
                            for_each = timeout_conditional.value.conditional_branch
                              content {
                                name = conditional_branch.value["name"]
                                dynamic "condition" {
                                  for_each = conditional_branch.value.condition
                                    content {
                                      expression_string = condition.value["expression_string"]
                                    }
                                }
                                dynamic "next_step" {
                                  for_each = conditional_branch.value.next_step
                                    content {
                                      session_attributes = next_step.value["session_attributes"]
                                      dynamic "dialog_action" {
                                        for_each = next_step.value.dialog_action
                                          content {
                                            type                  = dialog_action.value["type"]
                                            slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                            suppress_next_message = dialog_action.value["suppress_next_message"]
                                          }
                                      }
                                      dynamic "intent" {
                                        for_each = next_step.value.intent
                                          content {
                                            name = intent.value["name"]
                                            dynamic "slot" {
                                              for_each = intent.value.slot
                                                content {
                                                  shape = slot.value["shape"]
                                                  dynamic "value" {
                                                    for_each = slot.value.value
                                                      content {
                                                        interpreted_value = value.value["interpreted_value"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "response" {
                                  for_each = conditional_branch.value.response
                                    content {
                                      allow_interrupt = response.value["allow_interrupt"]
                                      dynamic "message_group" {
                                        for_each = response.value.message_group
                                          content {
                                            dynamic "message" {
                                              for_each = message_group.value.message
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = message.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       } 
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = message.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       } 
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = message.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       } 
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = message.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       } 
                                                   }
                                                }
                                            }
                                            dynamic "variation" {
                                              for_each = message_group.value.variation
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = variation.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       }
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = variation.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       }
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = variation.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       }
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = variation.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       }
                                                   }                          
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "default_branch" {
                            for_each = timeout_conditional.value.default_branch
                              content {
                                dynamic "next_step" {
                                  for_each = default_branch.value.next_step
                                    content {
                                      session_attributes = next_step.value["session_attributes"]
                                      dynamic "dialog_action" {
                                        for_each = next_step.value.dialog_action
                                          content {
                                            type                  = dialog_action.value["type"]
                                            slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                            suppress_next_message = dialog_action.value["suppress_next_message"]
                                          }
                                      }
                                      dynamic "intent" {
                                        for_each = next_step.value.intent
                                          content {
                                            name = intent.value["name"]
                                            dynamic "slot" {
                                              for_each = intent.value.slot
                                                content {
                                                  shape = slot.value["shape"]
                                                  dynamic "value" {
                                                    for_each = slot.value.value
                                                      content {
                                                        interpreted_value = value.value["interpreted_value"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "response" {
                                  for_each = default_branch.value.response
                                    content {
                                      allow_interrupt = response.value["allow_interrupt"]
                                      dynamic "message_group" {
                                        for_each = response.value.message_group
                                          content {
                                            dynamic "message" {
                                              for_each = message_group.value.message
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = message.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       } 
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = message.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       } 
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = message.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       } 
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = message.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       } 
                                                   }
                                                }
                                            }
                                            dynamic "variation" {
                                              for_each = message_group.value.variation
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = variation.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       }
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = variation.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       }
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = variation.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       }
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = variation.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       }
                                                   }                          
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "timeout_next_step" {
                      for_each = post_code_hook_specification.value.timeout_next_step
                        content {
                          session_attributes = timeout_next_step.value["session_attributes"]
                          dynamic "dialog_action" {
                            for_each = timeout_next_step.value.dialog_action
                              content {
                                type                  = dialog_action.value["type"]
                                slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                suppress_next_message = dialog_action.value["suppress_next_message"]
                              }
                          }
                          dynamic "intent" {
                            for_each = timeout_next_step.value.intent
                              content {
                                name = intent.value["name"]
                                dynamic "slot" {
                                  for_each = intent.value.slot
                                    content {
                                      shape = slot.value["shape"]
                                      dynamic "value" {
                                        for_each = slot.value.value
                                          content {
                                            interpreted_value = value.value["interpreted_value"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "timeout_response" {
                      for_each = post_code_hook_specification.value.timeout_response
                        content {
                          allow_interrupt = timeout_response.value["allow_interrupt"]
                          dynamic "message_group" {
                            for_each = timeout_response.value.message_group
                              content {
                                dynamic "message" {
                                  for_each = message_group.value.message
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = message.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          } 
                                      }
                                      dynamic "image_response_card" {
                                        for_each = message.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = message.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          } 
                                      }
                                      dynamic "ssml_message" {
                                        for_each = message.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          } 
                                      }
                                    }
                                }
                                dynamic "variation" {
                                  for_each = message_group.value.variation
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = variation.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          }
                                      }
                                      dynamic "image_response_card" {
                                        for_each = variation.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          }
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = variation.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          }
                                      }
                                      dynamic "ssml_message" {
                                        for_each = variation.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          }
                                      }                          
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "confirmation_conditional" {
          for_each = confirmation_setting.value.confirmation_conditional
            content {
              active = confirmation_conditional.value["active"]
              dynamic "conditional_branch" {
                for_each = confirmation_conditional.value.conditional_branch
                  content {
                    name  = conditional_branch.value["name"]
                    dynamic "condition" {
                      for_each = conditional_branch.value.condition
                        content {
                          expression_string = condition.value["expression_string"] 
                        }
                    }
                    dynamic "next_step" {
                      for_each = conditional_branch.value.next_step
                        content {
                          session_attributes = next_step.value["session_attributes"]
                          dynamic "dialog_action" {
                            for_each = next_step.value.dialog_action
                              content {
                                type                  = dialog_action.value["type"]
                                slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                suppress_next_message = dialog_action.value["suppress_next_message"]
                              }
                          }
                          dynamic "intent" {
                            for_each = next_step.value.intent
                              content {
                                name = intent.value["name"]
                                dynamic "slot" {
                                  for_each = intent.value.slot
                                    content {
                                      shape = slot.value["shape"]
                                      dynamic "value" {
                                        for_each = slot.value.value
                                          content {
                                            interpreted_value = value.value["interpreted_value"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "response" {
                      for_each = conditional_branch.value.response
                        content {
                          allow_interrupt = response.value["allow_interrupt"]
                          dynamic "message_group" {
                            for_each = response.value.message_group
                              content {
                                dynamic "message" {
                                  for_each = message_group.value.message
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = message.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          } 
                                      }
                                      dynamic "image_response_card" {
                                        for_each = message.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = message.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          } 
                                      }
                                      dynamic "ssml_message" {
                                        for_each = message.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          } 
                                      }
                                    }
                                }
                                dynamic "variation" {
                                  for_each = message_group.value.variation
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = variation.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          } 
                                      }
                                      dynamic "image_response_card" {
                                        for_each = variation.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = variation.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          } 
                                      }
                                      dynamic "ssml_message" {
                                        for_each = variation.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          } 
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "default_branch" {
                for_each = confirmation_conditional.value.default_branch
                  content {
                    dynamic "next_step" {
                      for_each = default_branch.value.next_step
                        content {
                          session_attributes = next_step.value["session_attributes"]
                          dynamic "dialog_action" {
                            for_each = next_step.value.dialog_action
                              content {
                                type                  = dialog_action.value["type"]
                                slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                suppress_next_message = dialog_action.value["suppress_next_message"]
                              }
                          }
                          dynamic "intent" {
                            for_each = next_step.value.intent
                              content {
                                name = intent.value["name"]
                                dynamic "slot" {
                                  for_each = intent.value.slot
                                    content {
                                      shape = slot.value["shape"]
                                      dynamic "value" {
                                        for_each = slot.value.value
                                          content {
                                            interpreted_value = value.value["interpreted_value"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "response" {
                      for_each = default_branch.value.response
                        content {
                          allow_interrupt = response.value["allow_interrupt"]
                          dynamic "message_group" {
                            for_each = response.value.message_group
                              content {
                                dynamic "message" {
                                  for_each = message_group.value.message
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = message.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          } 
                                      }
                                      dynamic "image_response_card" {
                                        for_each = message.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = message.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          } 
                                      }
                                      dynamic "ssml_message" {
                                        for_each = message.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          } 
                                      }
                                    }
                                }
                                dynamic "variation" {
                                  for_each = message_group.value.variation
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = variation.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          } 
                                      }
                                      dynamic "image_response_card" {
                                        for_each = variation.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = variation.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          } 
                                      }
                                      dynamic "ssml_message" {
                                        for_each = variation.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          } 
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "confirmation_next_step" {
          for_each = confirmation_setting.value.confirmation_next_step
            content {
              session_attributes = confirmation_next_step.value["session_attributes"]
              dynamic "dialog_action" {
                for_each = confirmation_next_step.value.dialog_action
                  content {
                    type                  = dialog_action.value["type"]
                    slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                    suppress_next_message = dialog_action.value["suppress_next_message"]
                  }
              }
              dynamic "intent" {
                for_each = confirmation_next_step.value.intent
                  content {
                    name = intent.value["name"]
                    dynamic "slot" {
                      for_each = intent.value.slot
                        content {
                          shape = slot.value["shape"]
                          dynamic "value" {
                            for_each = slot.value.value
                              content {
                                interpreted_value = value.value["interpreted_value"]
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "confirmation_response" {
          for_each = confirmation_setting.value.confirmation_response
            content {
              allow_interrupt = confirmation_response.value["allow_interrupt"]
              dynamic "message_group" {
                for_each = confirmation_response.value.message_group
                  content {
                    dynamic "message" {
                      for_each = message_group.value.message
                        content {
                          dynamic "custom_payload" {
                            for_each = message.value.custom_payload
                              content {
                                value = custom_payload.value["value"]
                              } 
                          }
                          dynamic "image_response_card" {
                            for_each = message.value.image_response_card
                              content {
                                image_url = image_response_card.value["image_url"]
                                subtitle  = image_response_card.value["subtitle"]
                                title     = image_response_card.value["title"]
                                dynamic "button" {
                                  for_each = image_response_card.value.button
                                    content {
                                      text  = button.value["text"]
                                      value = button.value["value"]
                                    }
                                }
                              } 
                          }
                          dynamic "plain_text_message" {
                            for_each = message.value.plain_text_message
                              content {
                                value = plain_text_message.value["value"]
                              } 
                          }
                          dynamic "ssml_message" {
                            for_each = message.value.ssml_message
                              content {
                                value = ssml_message.value["value"]
                              } 
                          }
                        }
                    }
                    dynamic "variation" {
                      for_each = message_group.value.variation
                        content {
                          dynamic "custom_payload" {
                            for_each = variation.value.custom_payload
                              content {
                                value = custom_payload.value["value"]
                              } 
                          }
                          dynamic "image_response_card" {
                            for_each = variation.value.image_response_card
                              content {
                                image_url = image_response_card.value["image_url"]
                                subtitle  = image_response_card.value["subtitle"]
                                title     = image_response_card.value["title"]
                                dynamic "button" {
                                  for_each = image_response_card.value.button
                                    content {
                                      text  = button.value["text"]
                                      value = button.value["value"]
                                    }
                                }
                              } 
                          }
                          dynamic "plain_text_message" {
                            for_each = variation.value.plain_text_message
                              content {
                                value = plain_text_message.value["value"]
                              } 
                          }
                          dynamic "ssml_message" {
                            for_each = variation.value.ssml_message
                              content {
                                value = ssml_message.value["value"]
                              } 
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "declination_conditional" {
          for_each = confirmation_setting.value.declination_conditional
            content {
              active = declination_conditional.value["active"]
              dynamic "conditional_branch" {
                for_each = declination_conditional.value.conditional_branch
                  content {
                    name = conditional_branch.value["name"]
                    dynamic "condition" {
                      for_each = conditional_branch.value.condition
                        content {
                          expression_string = condition.value["expression_string"]
                        }
                    }
                    dynamic "next_step" {
                      for_each = conditional_branch.value.next_step
                        content {
                          session_attributes = next_step.value["session_attributes"]
                          dynamic "dialog_action" {
                            for_each = next_step.value.dialog_action
                              content {
                                type                  = dialog_action.value["type"]
                                slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                suppress_next_message = dialog_action.value["suppress_next_message"]
                              }
                          }
                          dynamic "intent" {
                            for_each = next_step.value.intent
                              content {
                                name = intent.value["name"]
                                dynamic "slot" {
                                  for_each = intent.value.slot
                                    content {
                                      shape = slot.value["shape"]
                                      dynamic "value" {
                                        for_each = slot.value.value
                                          content {
                                            interpreted_value = value.value["interpreted_value"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "response" {
                      for_each = conditional_branch.value.response
                        content {
                          allow_interrupt = response.value["allow_interrupt"]
                          dynamic "message_group" {
                            for_each = response.value.message_group
                              content {
                                dynamic "message" {
                                  for_each = message_group.value.message
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = message.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          } 
                                      }
                                      dynamic "image_response_card" {
                                        for_each = message.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = message.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          } 
                                      }
                                      dynamic "ssml_message" {
                                        for_each = message.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          } 
                                      }
                                    }
                                }
                                dynamic "variation" {
                                  for_each = message_group.value.variation
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = variation.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          } 
                                      }
                                      dynamic "image_response_card" {
                                        for_each = variation.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = variation.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          } 
                                      }
                                      dynamic "ssml_message" {
                                        for_each = variation.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          } 
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "default_branch" {
                for_each = declination_conditional.value.default_branch
                  content {
                    dynamic "next_step" {
                      for_each = default_branch.value.next_step
                        content {
                          session_attributes = next_step.value["session_attributes"]
                          dynamic "dialog_action" {
                            for_each = next_step.value.dialog_action
                              content {
                                type                  = dialog_action.value["type"]
                                slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                suppress_next_message = dialog_action.value["suppress_next_message"]
                              }
                          }
                          dynamic "intent" {
                            for_each = next_step.value.intent
                              content {
                                name = intent.value["name"]
                                dynamic "slot" {
                                  for_each = intent.value.slot
                                    content {
                                      shape = slot.value["shape"]
                                      dynamic "value" {
                                        for_each = slot.value.value
                                          content {
                                            interpreted_value = value.value["interpreted_value"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "response" {
                      for_each = default_branch.value.response
                        content {
                          allow_interrupt = response.value["allow_interrupt"]
                          dynamic "message_group" {
                            for_each = response.value.message_group
                              content {
                                dynamic "message" {
                                  for_each = message_group.value.message
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = message.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          } 
                                      }
                                      dynamic "image_response_card" {
                                        for_each = message.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = message.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          } 
                                      }
                                      dynamic "ssml_message" {
                                        for_each = message.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          } 
                                      }
                                    }
                                }
                                dynamic "variation" {
                                  for_each = message_group.value.variation
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = variation.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          } 
                                      }
                                      dynamic "image_response_card" {
                                        for_each = variation.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = variation.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          } 
                                      }
                                      dynamic "ssml_message" {
                                        for_each = variation.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          } 
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "declination_next_step" {
          for_each = confirmation_setting.value.declination_next_step
            content {
              session_attributes = declination_next_step.value["session_attributes"]
              dynamic "dialog_action" {
                for_each = declination_next_step.value.dialog_action
                  content {
                    type                  = dialog_action.value["type"]
                    slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                    suppress_next_message = dialog_action.value["suppress_next_message"]
                  }
              }
              dynamic "intent" {
                for_each = declination_next_step.value.intent
                  content {
                    name = intent.value["name"]
                    dynamic "slot" {
                      for_each = intent.value.slot
                        content {
                          shape = slot.value["shape"]
                          dynamic "value" {
                            for_each = slot.value.value
                              content {
                                interpreted_value = value.value["interpreted_value"]
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "declination_response" {
          for_each = confirmation_setting.value.declination_response
            content {
              allow_interrupt = declination_response.value["allow_interrupt"]
              dynamic "message_group" {
                for_each = declination_response.value.message_group
                  content {
                    dynamic "message" {
                      for_each = message_group.value.message
                        content {
                          dynamic "custom_payload" {
                            for_each = message.value.custom_payload
                              content {
                                value = custom_payload.value["value"]
                              } 
                          }
                          dynamic "image_response_card" {
                            for_each = message.value.image_response_card
                              content {
                                image_url = image_response_card.value["image_url"]
                                subtitle  = image_response_card.value["subtitle"]
                                title     = image_response_card.value["title"]
                                dynamic "button" {
                                  for_each = image_response_card.value.button
                                    content {
                                      text  = button.value["text"]
                                      value = button.value["value"]
                                    }
                                }
                              } 
                          }
                          dynamic "plain_text_message" {
                            for_each = message.value.plain_text_message
                              content {
                                value = plain_text_message.value["value"]
                              } 
                          }
                          dynamic "ssml_message" {
                            for_each = message.value.ssml_message
                              content {
                                value = ssml_message.value["value"]
                              } 
                          }
                        }
                    }
                    dynamic "variation" {
                      for_each = message_group.value.variation
                        content {
                          dynamic "custom_payload" {
                            for_each = variation.value.custom_payload
                              content {
                                value = custom_payload.value["value"]
                              } 
                          }
                          dynamic "image_response_card" {
                            for_each = variation.value.image_response_card
                              content {
                                image_url = image_response_card.value["image_url"]
                                subtitle  = image_response_card.value["subtitle"]
                                title     = image_response_card.value["title"]
                                dynamic "button" {
                                  for_each = image_response_card.value.button
                                    content {
                                      text  = button.value["text"]
                                      value = button.value["value"]
                                    }
                                }
                              } 
                          }
                          dynamic "plain_text_message" {
                            for_each = variation.value.plain_text_message
                              content {
                                value = plain_text_message.value["value"]
                              } 
                          }
                          dynamic "ssml_message" {
                            for_each = variation.value.ssml_message
                              content {
                                value = ssml_message.value["value"]
                              } 
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "elicitation_code_hook" {
          for_each = confirmation_setting.value.elicitation_code_hook
            content {
              enable_code_hook_invocation = elicitation_code_hook.value["enable_code_hook_invocation"]
              invocation_label            = elicitation_code_hook.value["invocation_label"]
            }
        }
        dynamic "failure_conditional" {
          for_each = confirmation_setting.value.failure_conditional
            content {
              active = failure_conditional.value["active"]
              dynamic "conditional_branch" {
                for_each = failure_conditional.value.conditional_branch
                  content {
                    name = conditional_branch.value["name"]
                    dynamic "condition" {
                      for_each = conditional_branch.value.condition
                        content {
                          expression_string = condition.value["expression_string"]
                        }
                    }
                    dynamic "next_step" {
                      for_each = conditional_branch.value.next_step
                        content {
                          session_attributes = next_step.value["session_attributes"]
                          dynamic "dialog_action" {
                            for_each = next_step.value.dialog_action
                              content {
                                type                  = dialog_action.value["type"]
                                slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                suppress_next_message = dialog_action.value["suppress_next_message"]
                              }
                          }
                          dynamic "intent" {
                            for_each = next_step.value.intent
                              content {
                                name = intent.value["name"]
                                dynamic "slot" {
                                  for_each = intent.value.slot
                                    content {
                                      shape = slot.value["shape"]
                                      dynamic "value" {
                                        for_each = slot.value.value
                                          content {
                                            interpreted_value = value.value["interpreted_value"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "response" {
                      for_each = conditional_branch.value.response
                        content {
                          allow_interrupt = response.value["allow_interrupt"]
                          dynamic "message_group" {
                            for_each = response.value.message_group
                              content {
                                dynamic "message" {
                                  for_each = message_group.value.message
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = message.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          } 
                                      }
                                      dynamic "image_response_card" {
                                        for_each = message.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = message.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          } 
                                      }
                                      dynamic "ssml_message" {
                                        for_each = message.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          } 
                                      }
                                    }
                                }
                                dynamic "variation" {
                                  for_each = message_group.value.variation
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = variation.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          } 
                                      }
                                      dynamic "image_response_card" {
                                        for_each = variation.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = variation.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          } 
                                      }
                                      dynamic "ssml_message" {
                                        for_each = variation.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          } 
                                      }
                                    }
                                }
                              }
                          }
                        }
                      }
                   }
                 }
                 dynamic "default_branch" {
                   for_each =  failure_conditional.value.default_branch
                     content {
                       dynamic "next_step" {
                         for_each = default_branch.value.next_step
                           content {
                             session_attributes = next_step.value["session_attributes"]
                             dynamic "dialog_action" {
                               for_each = next_step.value.dialog_action
                                 content {
                                   type                  = dialog_action.value["type"]
                                   slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                   suppress_next_message = dialog_action.value["suppress_next_message"]
                                 }
                             }
                             dynamic "intent" {
                               for_each = next_step.value.intent
                                 content {
                                   name = intent.value["name"]
                                   dynamic "slot" {
                                     for_each = intent.value.slot
                                       content {
                                         shape = slot.value["shape"]
                                         dynamic "value" {
                                           for_each = slot.value.value
                                             content {
                                               interpreted_value = value.value["interpreted_value"]
                                             }
                                         }
                                       }
                                   }
                                 }
                             }
                           }
                       }
                       dynamic "response" {
                         for_each = default_branch.value.response
                           content {
                             allow_interrupt = response.value["allow_interrupt"]
                             dynamic "message_group" {
                               for_each = response.value.message_group
                                 content {
                                   dynamic "message" {
                                     for_each = message_group.value.message
                                       content {
                                         dynamic "custom_payload" {
                                           for_each = message.value.custom_payload
                                             content {
                                               value = custom_payload.value["value"]
                                             } 
                                         }
                                         dynamic "image_response_card" {
                                           for_each = message.value.image_response_card
                                             content {
                                               image_url = image_response_card.value["image_url"]
                                               subtitle  = image_response_card.value["subtitle"]
                                               title     = image_response_card.value["title"]
                                               dynamic "button" {
                                                 for_each = image_response_card.value.button
                                                   content {
                                                     text  = button.value["text"]
                                                     value = button.value["value"]
                                                   }
                                               }
                                             } 
                                         }
                                         dynamic "plain_text_message" {
                                           for_each = message.value.plain_text_message
                                             content {
                                               value = plain_text_message.value["value"]
                                             } 
                                         }
                                         dynamic "ssml_message" {
                                           for_each = message.value.ssml_message
                                             content {
                                               value = ssml_message.value["value"]
                                             } 
                                         }
                                       }
                                   }
                                   dynamic "variation" {
                                     for_each = message_group.value.variation
                                       content {
                                         dynamic "custom_payload" {
                                           for_each = variation.value.custom_payload
                                             content {
                                               value = custom_payload.value["value"]
                                             } 
                                         }
                                         dynamic "image_response_card" {
                                           for_each = variation.value.image_response_card
                                             content {
                                               image_url = image_response_card.value["image_url"]
                                               subtitle  = image_response_card.value["subtitle"]
                                               title     = image_response_card.value["title"]
                                               dynamic "button" {
                                                 for_each = image_response_card.value.button
                                                   content {
                                                     text  = button.value["text"]
                                                     value = button.value["value"]
                                                   }
                                               }
                                             } 
                                         }
                                         dynamic "plain_text_message" {
                                           for_each = variation.value.plain_text_message
                                             content {
                                               value = plain_text_message.value["value"]
                                             } 
                                         }
                                         dynamic "ssml_message" {
                                           for_each = variation.value.ssml_message
                                             content {
                                               value = ssml_message.value["value"]
                                             } 
                                         }
                                       }
                                   }
                                 }
                             }
                           }
                       }
                     }
                 }                 
            }
        }
        dynamic "failure_next_step" {
          for_each = confirmation_setting.value.failure_next_step
            content {
              session_attributes = failure_next_step.value["session_attributes"]
              dynamic "dialog_action" {
                for_each = failure_next_step.value.dialog_action
                  content {
                    type                  = dialog_action.value["type"]
                    slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                    suppress_next_message = dialog_action.value["suppress_next_message"]
                  }
              }
              dynamic "intent" {
                for_each = failure_next_step.value.intent
                  content {
                    name = intent.value["name"]
                    dynamic "slot" {
                      for_each = intent.value.slot
                        content {
                          shape = slot.value["shape"]
                          dynamic "value" {
                            for_each = slot.value.value
                              content {
                                interpreted_value = value.value["interpreted_value"]
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "failure_response" {
          for_each = confirmation_setting.value.failure_response
            content {
              allow_interrupt = failure_response.value["allow_interrupt"]
              dynamic "message_group" {
                for_each = failure_response.value.message_group
                  content {
                    dynamic "message" {
                      for_each = message_group.value.message
                        content {
                          dynamic "custom_payload" {
                            for_each = message.value.custom_payload
                              content {
                                value = custom_payload.value["value"]
                              } 
                          }
                          dynamic "image_response_card" {
                            for_each = message.value.image_response_card
                              content {
                                image_url = image_response_card.value["image_url"]
                                subtitle  = image_response_card.value["subtitle"]
                                title     = image_response_card.value["title"]
                                dynamic "button" {
                                  for_each = image_response_card.value.button
                                    content {
                                      text  = button.value["text"]
                                      value = button.value["value"]
                                    }
                                }
                              } 
                          }
                          dynamic "plain_text_message" {
                            for_each = message.value.plain_text_message
                              content {
                                value = plain_text_message.value["value"]
                              } 
                          }
                          dynamic "ssml_message" {
                            for_each = message.value.ssml_message
                              content {
                                value = ssml_message.value["value"]
                              } 
                          }
                        }
                    }
                    dynamic "variation" {
                      for_each = message_group.value.variation
                        content {
                          dynamic "custom_payload" {
                            for_each = variation.value.custom_payload
                              content {
                                value = custom_payload.value["value"]
                              } 
                          }
                          dynamic "image_response_card" {
                            for_each = variation.value.image_response_card
                              content {
                                image_url = image_response_card.value["image_url"]
                                subtitle  = image_response_card.value["subtitle"]
                                title     = image_response_card.value["title"]
                                dynamic "button" {
                                  for_each = image_response_card.value.button
                                    content {
                                      text  = button.value["text"]
                                      value = button.value["value"]
                                    }
                                }
                              } 
                          }
                          dynamic "plain_text_message" {
                            for_each = variation.value.plain_text_message
                              content {
                                value = plain_text_message.value["value"]
                              } 
                          }
                          dynamic "ssml_message" {
                            for_each = variation.value.ssml_message
                              content {
                                value = ssml_message.value["value"]
                              } 
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "prompt_specification" {
          for_each = confirmation_setting.value.prompt_specification
            content {
              allow_interrupt            = prompt_specification.value["allow_interrupt"]
              max_retries                = prompt_specification.value["max_retries"]
              message_selection_strategy = prompt_specification.value["message_selection_strategy"]
              dynamic "message_group" {
                for_each = prompt_specification.value.message_group
                  content {
                    dynamic "message" {
                      for_each = message_group.value.message
                        content {
                          dynamic "custom_payload" {
                            for_each = message.value.custom_payload
                              content {
                                value = custom_payload.value["value"]
                              } 
                          }
                          dynamic "image_response_card" {
                            for_each = message.value.image_response_card
                              content {
                                image_url = image_response_card.value["image_url"]
                                subtitle  = image_response_card.value["subtitle"]
                                title     = image_response_card.value["title"]
                                dynamic "button" {
                                  for_each = image_response_card.value.button
                                    content {
                                      text  = button.value["text"]
                                      value = button.value["value"]
                                    }
                                }
                              } 
                          }
                          dynamic "plain_text_message" {
                            for_each = message.value.plain_text_message
                              content {
                                value = plain_text_message.value["value"]
                              } 
                          }
                          dynamic "ssml_message" {
                            for_each = message.value.ssml_message
                              content {
                                value = ssml_message.value["value"]
                              } 
                          }
                        }
                    }
                    dynamic "variation" {
                      for_each = message_group.value.variation
                        content {
                          dynamic "custom_payload" {
                            for_each = variation.value.custom_payload
                              content {
                                value = custom_payload.value["value"]
                              } 
                          }
                          dynamic "image_response_card" {
                            for_each = variation.value.image_response_card
                              content {
                                image_url = image_response_card.value["image_url"]
                                subtitle  = image_response_card.value["subtitle"]
                                title     = image_response_card.value["title"]
                                dynamic "button" {
                                  for_each = image_response_card.value.button
                                    content {
                                      text  = button.value["text"]
                                      value = button.value["value"]
                                    }
                                }
                              } 
                          }
                          dynamic "plain_text_message" {
                            for_each = variation.value.plain_text_message
                              content {
                                value = plain_text_message.value["value"]
                              } 
                          }
                          dynamic "ssml_message" {
                            for_each = variation.value.ssml_message
                              content {
                                value = ssml_message.value["value"]
                              } 
                          }
                        }
                    }
                  }
              }
              dynamic "prompt_attempts_specification" {
                for_each = prompt_specification.value.prompt_attempts_specification
                  content {
                    allow_interrupt = prompt_attempts_specification.value["allow_interrupt"]
                    map_block_key   = prompt_attempts_specification.value["map_block_key"]
                    dynamic "allowed_input_types" {
                      for_each = prompt_attempts_specification.value.allowed_input_types
                        content {
                          allow_audio_input = allowed_input_types.value["allow_audio_input"]
                          allow_dtmf_input  = allowed_input_types.value["allow_dtmf_input"]
                        }
                    }
                    dynamic "audio_and_dtmf_input_specification" {
                      for_each = prompt_attempts_specification.value.audio_and_dtmf_input_specification
                        content {
                          start_timeout_ms = audio_and_dtmf_input_specification.value["start_timeout_ms"]
                          dynamic "audio_specification" {
                            for_each = audio_and_dtmf_input_specification.value.audio_specification
                              content {
                                end_timeout_ms = audio_specification.value["end_timeout_ms"]
                                max_length_ms  = audio_specification.value["max_length_ms"]
                              }
                          }
                          dynamic "dtmf_specification" {
                            for_each = audio_and_dtmf_input_specification.value.dtmf_specification
                              content {
                                deletion_character = dtmf_specification.value["deletion_character"]
                                end_character      = dtmf_specification.value["end_character"]
                                end_timeout_ms     = dtmf_specification.value["end_timeout_ms"]
                                max_length         = dtmf_specification.value["max_length"]
                              }
                          }
                        }
                    }
                    dynamic "text_input_specification" {
                      for_each = prompt_attempts_specification.value.text_input_specification
                        content {
                          start_timeout_ms = text_input_specification.value["start_timeout_ms"]
                        }
                    }
                  }
              }
            }
        }
      }
  }
  dynamic "dialog_code_hook" {
    for_each = var.lexv2models_intent_dialog_code_hook
      content {
        enabled = dialog_code_hook.value["enabled"]
      }
  }
  dynamic "fulfillment_code_hook" {
    for_each = var.lexv2models_intent_fulfillment_code_hook
      content {
        active  = fulfillment_code_hook.value["active"]
        enabled = fulfillment_code_hook.value["enabled"]
        dynamic "fulfillment_updates_specification" {
          for_each = fulfillment_code_hook.value.fulfillment_updates_specification
            content {
              active             = fulfillment_updates_specification.value["active"]
              timeout_in_seconds = fulfillment_updates_specification.value["timeout_in_seconds"]
              dynamic "start_response" {
                for_each = fulfillment_updates_specification.value.start_response
                  content {
                    allow_interrupt  = start_response.value["allow_interrupt"]
                    delay_in_seconds = start_response.value["delay_in_seconds"] 
                    dynamic "message_group" {
                      for_each = start_response.value.message_group
                        content {
                          dynamic "message" {
                            for_each = message_group.value.message
                              content {
                                dynamic "custom_payload" {
                                  for_each = message.value.custom_payload
                                    content {
                                      value = custom_payload.value["value"]
                                    } 
                                }
                                dynamic "image_response_card" {
                                  for_each = message.value.image_response_card
                                    content {
                                      image_url = image_response_card.value["image_url"]
                                      subtitle  = image_response_card.value["subtitle"]
                                      title     = image_response_card.value["title"]
                                      dynamic "button" {
                                        for_each = image_response_card.value.button
                                          content {
                                            text  = button.value["text"]
                                            value = button.value["value"]
                                          }
                                      }
                                    } 
                                }
                                dynamic "plain_text_message" {
                                  for_each = message.value.plain_text_message
                                    content {
                                      value = plain_text_message.value["value"]
                                    } 
                                }
                                dynamic "ssml_message" {
                                  for_each = message.value.ssml_message
                                    content {
                                      value = ssml_message.value["value"]
                                    } 
                                }
                              }
                          }
                          dynamic "variation" {
                            for_each = message_group.value.variation
                              content {
                                dynamic "custom_payload" {
                                  for_each = variation.value.custom_payload
                                    content {
                                      value = custom_payload.value["value"]
                                    } 
                                }
                                dynamic "image_response_card" {
                                  for_each = variation.value.image_response_card
                                    content {
                                      image_url = image_response_card.value["image_url"]
                                      subtitle  = image_response_card.value["subtitle"]
                                      title     = image_response_card.value["title"]
                                      dynamic "button" {
                                        for_each = image_response_card.value.button
                                          content {
                                            text  = button.value["text"]
                                            value = button.value["value"]
                                          }
                                      }
                                    } 
                                }
                                dynamic "plain_text_message" {
                                  for_each = variation.value.plain_text_message
                                    content {
                                      value = plain_text_message.value["value"]
                                    } 
                                }
                                dynamic "ssml_message" {
                                  for_each = variation.value.ssml_message
                                    content {
                                      value = ssml_message.value["value"]
                                    } 
                                }
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "update_response" {
                for_each = fulfillment_updates_specification.value.update_response
                  content {
                    allow_interrupt      = update_response.value["allow_interrupt"]
                    frequency_in_seconds = update_response.value["frequency_in_seconds"]
                    dynamic "message_group" {
                      for_each = update_response.value.message_group
                        content {
                          dynamic "message" {
                            for_each = message_group.value.message
                              content {
                                dynamic "custom_payload" {
                                  for_each = message.value.custom_payload
                                    content {
                                      value = custom_payload.value["value"]
                                    } 
                                }
                                dynamic "image_response_card" {
                                  for_each = message.value.image_response_card
                                    content {
                                      image_url = image_response_card.value["image_url"]
                                      subtitle  = image_response_card.value["subtitle"]
                                      title     = image_response_card.value["title"]
                                      dynamic "button" {
                                        for_each = image_response_card.value.button
                                          content {
                                            text  = button.value["text"]
                                            value = button.value["value"]
                                          }
                                      }
                                    } 
                                }
                                dynamic "plain_text_message" {
                                  for_each = message.value.plain_text_message
                                    content {
                                      value = plain_text_message.value["value"]
                                    } 
                                }
                                dynamic "ssml_message" {
                                  for_each = message.value.ssml_message
                                    content {
                                      value = ssml_message.value["value"]
                                    } 
                                }
                              }
                          }
                          dynamic "variation" {
                            for_each = message_group.value.variation
                              content {
                                dynamic "custom_payload" {
                                  for_each = variation.value.custom_payload
                                    content {
                                      value = custom_payload.value["value"]
                                    } 
                                }
                                dynamic "image_response_card" {
                                  for_each = variation.value.image_response_card
                                    content {
                                      image_url = image_response_card.value["image_url"]
                                      subtitle  = image_response_card.value["subtitle"]
                                      title     = image_response_card.value["title"]
                                      dynamic "button" {
                                        for_each = image_response_card.value.button
                                          content {
                                            text  = button.value["text"]
                                            value = button.value["value"]
                                          }
                                      }
                                    } 
                                }
                                dynamic "plain_text_message" {
                                  for_each = variation.value.plain_text_message
                                    content {
                                      value = plain_text_message.value["value"]
                                    } 
                                }
                                dynamic "ssml_message" {
                                  for_each = variation.value.ssml_message
                                    content {
                                      value = ssml_message.value["value"]
                                    } 
                                }
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "post_fulfillment_status_specification" {
          for_each = fulfillment_code_hook.value.post_fulfillment_status_specification
            content {
              dynamic "failure_conditional" {
                for_each = post_fulfillment_status_specification.value.failure_conditional
                  content {
                    active = failure_conditional.value["active"]
                    dynamic "conditional_branch" {
                      for_each = failure_conditional.value.conditional_branch
                        content {
                          name = conditional_branch.value["name"]
                          dynamic "condition" {
                            for_each = conditional_branch.value.condition
                              content {
                                expression_string = condition.value["expression_string"]
                              }
                          }
                          dynamic "next_step" {
                            for_each = conditional_branch.value.next_step
                              content {
                                session_attributes = next_step.value["session_attributes"]
                                dynamic "dialog_action" {
                                  for_each = next_step.value.dialog_action
                                    content {
                                      type                  = dialog_action.value["type"]
                                      slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                      suppress_next_message = dialog_action.value["suppress_next_message"]
                                    }
                                }
                                dynamic "intent" {
                                  for_each = next_step.value.intent
                                    content {
                                      name = intent.value["name"]
                                      dynamic "slot" {
                                        for_each = intent.value.slot
                                          content {
                                            shape = slot.value["shape"]
                                            dynamic "value" {
                                              for_each = slot.value.value
                                                content {
                                                  interpreted_value = value.value["interpreted_value"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "response" {
                            for_each = conditional_branch.value.response
                              content {
                                allow_interrupt = response.value["allow_interrupt"]
                                dynamic "message_group" {
                                  for_each = response.value.message_group
                                    content {
                                      dynamic "message" {
                                        for_each = message_group.value.message
                                          content {
                                             dynamic "custom_payload" {
                                               for_each = message.value.custom_payload
                                                 content {
                                                   value = custom_payload.value["value"]
                                                 } 
                                             }
                                             dynamic "image_response_card" {
                                               for_each = message.value.image_response_card
                                                 content {
                                                   image_url = image_response_card.value["image_url"]
                                                   subtitle  = image_response_card.value["subtitle"]
                                                   title     = image_response_card.value["title"]
                                                   dynamic "button" {
                                                     for_each = image_response_card.value.button
                                                       content {
                                                         text  = button.value["text"]
                                                         value = button.value["value"]
                                                       }
                                                   }
                                                 } 
                                             }
                                             dynamic "plain_text_message" {
                                               for_each = message.value.plain_text_message
                                                 content {
                                                   value = plain_text_message.value["value"]
                                                 } 
                                             }
                                             dynamic "ssml_message" {
                                               for_each = message.value.ssml_message
                                                 content {
                                                   value = ssml_message.value["value"]
                                                 } 
                                             }
                                          }
                                      }
                                      dynamic "variation" {
                                        for_each = message_group.value.variation
                                          content {
                                             dynamic "custom_payload" {
                                               for_each = variation.value.custom_payload
                                                 content {
                                                   value = custom_payload.value["value"]
                                                 }
                                             }
                                             dynamic "image_response_card" {
                                               for_each = variation.value.image_response_card
                                                 content {
                                                   image_url = image_response_card.value["image_url"]
                                                   subtitle  = image_response_card.value["subtitle"]
                                                   title     = image_response_card.value["title"]
                                                   dynamic "button" {
                                                     for_each = image_response_card.value.button
                                                       content {
                                                         text  = button.value["text"]
                                                         value = button.value["value"]
                                                       }
                                                   }
                                                 }
                                             }
                                             dynamic "plain_text_message" {
                                               for_each = variation.value.plain_text_message
                                                 content {
                                                   value = plain_text_message.value["value"]
                                                 }
                                             }
                                             dynamic "ssml_message" {
                                               for_each = variation.value.ssml_message
                                                 content {
                                                   value = ssml_message.value["value"]
                                                 }
                                             }                          
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "default_branch" {
                      for_each = failure_conditional.value.default_branch
                        content {
                          dynamic "next_step" {
                            for_each = default_branch.value.next_step
                              content {
                                session_attributes = next_step.value["session_attributes"]
                                dynamic "dialog_action" {
                                  for_each = next_step.value.dialog_action
                                    content {
                                      type                  = dialog_action.value["type"]
                                      slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                      suppress_next_message = dialog_action.value["suppress_next_message"]
                                    }
                                }
                                dynamic "intent" {
                                  for_each = next_step.value.intent
                                    content {
                                      name = intent.value["name"]
                                      dynamic "slot" {
                                        for_each = intent.value.slot
                                          content {
                                            shape = slot.value["shape"]
                                            dynamic "value" {
                                              for_each = slot.value.value
                                                content {
                                                  interpreted_value = value.value["interpreted_value"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "response" {
                            for_each = default_branch.value.response
                              content {
                                allow_interrupt = response.value["allow_interrupt"]
                                dynamic "message_group" {
                                  for_each = response.value.message_group
                                    content {
                                      dynamic "message" {
                                        for_each = message_group.value.message
                                          content {
                                            dynamic "custom_payload" {
                                              for_each = message.value.custom_payload
                                                content {
                                                  value = custom_payload.value["value"]
                                                } 
                                            }
                                            dynamic "image_response_card" {
                                              for_each = message.value.image_response_card
                                                content {
                                                  image_url = image_response_card.value["image_url"]
                                                  subtitle  = image_response_card.value["subtitle"]
                                                  title     = image_response_card.value["title"]
                                                  dynamic "button" {
                                                    for_each = image_response_card.value.button
                                                      content {
                                                        text  = button.value["text"]
                                                        value = button.value["value"]
                                                      }
                                                  }
                                                } 
                                            }
                                            dynamic "plain_text_message" {
                                              for_each = message.value.plain_text_message
                                                content {
                                                  value = plain_text_message.value["value"]
                                                } 
                                            }
                                            dynamic "ssml_message" {
                                              for_each = message.value.ssml_message
                                                content {
                                                  value = ssml_message.value["value"]
                                                } 
                                            }
                                          }
                                      }
                                      dynamic "variation" {
                                        for_each = message_group.value.variation
                                          content {
                                            dynamic "custom_payload" {
                                              for_each = variation.value.custom_payload
                                                content {
                                                  value = custom_payload.value["value"]
                                                } 
                                            }
                                            dynamic "image_response_card" {
                                              for_each = variation.value.image_response_card
                                                content {
                                                  image_url = image_response_card.value["image_url"]
                                                  subtitle  = image_response_card.value["subtitle"]
                                                  title     = image_response_card.value["title"]
                                                  dynamic "button" {
                                                    for_each = image_response_card.value.button
                                                      content {
                                                        text  = button.value["text"]
                                                        value = button.value["value"]
                                                      }
                                                  }
                                                } 
                                            }
                                            dynamic "plain_text_message" {
                                              for_each = variation.value.plain_text_message
                                                content {
                                                  value = plain_text_message.value["value"]
                                                } 
                                            }
                                            dynamic "ssml_message" {
                                              for_each = variation.value.ssml_message
                                                content {
                                                  value = ssml_message.value["value"]
                                                } 
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "failure_next_step" {
                for_each = post_fulfillment_status_specification.value.failure_next_step
                  content {
                    session_attributes = failure_next_step.value["session_attributes"]
                    dynamic "dialog_action" {
                      for_each = failure_next_step.value.dialog_action
                        content {
                          type                  = dialog_action.value["type"]
                          slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                          suppress_next_message = dialog_action.value["suppress_next_message"]
                        }
                    }
                    dynamic "intent" {
                      for_each = failure_next_step.value.intent
                        content {
                          name = intent.value["name"]
                          dynamic "slot" {
                            for_each = intent.value.slot
                              content {
                                shape = slot.value["shape"]
                                dynamic "value" {
                                  for_each = slot.value.value
                                    content {
                                      interpreted_value = value.value["interpreted_value"]
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "failure_response" {
                for_each = post_fulfillment_status_specification.value.failure_response
                  content {
                    allow_interrupt = failure_response.value["allow_interrupt"]
                    dynamic "message_group" {
                      for_each = failure_response.value.message_group
                        content {
                          dynamic "message" {
                            for_each = message_group.value.message
                              content {
                                dynamic "custom_payload" {
                                  for_each = message.value.custom_payload
                                    content {
                                      value = custom_payload.value["value"]
                                    } 
                                }
                                dynamic "image_response_card" {
                                  for_each = message.value.image_response_card
                                    content {
                                      image_url = image_response_card.value["image_url"]
                                      subtitle  = image_response_card.value["subtitle"]
                                      title     = image_response_card.value["title"]
                                      dynamic "button" {
                                        for_each = image_response_card.value.button
                                          content {
                                            text  = button.value["text"]
                                            value = button.value["value"]
                                          }
                                      }
                                    } 
                                }
                                dynamic "plain_text_message" {
                                  for_each = message.value.plain_text_message
                                    content {
                                      value = plain_text_message.value["value"]
                                    } 
                                }
                                dynamic "ssml_message" {
                                  for_each = message.value.ssml_message
                                    content {
                                      value = ssml_message.value["value"]
                                    } 
                                }
                              }
                          }
                          dynamic "variation" {
                            for_each = message_group.value.variation
                              content {
                                dynamic "custom_payload" {
                                  for_each = variation.value.custom_payload
                                    content {
                                      value = custom_payload.value["value"]
                                    } 
                                }
                                dynamic "image_response_card" {
                                  for_each = variation.value.image_response_card
                                    content {
                                      image_url = image_response_card.value["image_url"]
                                      subtitle  = image_response_card.value["subtitle"]
                                      title     = image_response_card.value["title"]
                                      dynamic "button" {
                                        for_each = image_response_card.value.button
                                          content {
                                            text  = button.value["text"]
                                            value = button.value["value"]
                                          }
                                      }
                                    } 
                                }
                                dynamic "plain_text_message" {
                                  for_each = variation.value.plain_text_message
                                    content {
                                      value = plain_text_message.value["value"]
                                    } 
                                }
                                dynamic "ssml_message" {
                                  for_each = variation.value.ssml_message
                                    content {
                                      value = ssml_message.value["value"]
                                    } 
                                }
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "success_conditional" {
                for_each = post_fulfillment_status_specification.value.success_conditional
                  content {
                    active = success_conditional.value["active"]
                    dynamic "conditional_branch" {
                      for_each = success_conditional.value.conditional_branch
                        content {
                          name = conditional_branch.value["name"]
                          dynamic "condition" {
                            for_each = conditional_branch.value.condition
                              content {
                                expression_string = condition.value["expression_string"]
                              }
                          }
                          dynamic "next_step" {
                            for_each = conditional_branch.value.next_step
                              content {
                                session_attributes = next_step.value["session_attributes"]
                                dynamic "dialog_action" {
                                  for_each = next_step.value.dialog_action
                                    content {
                                      type                  = dialog_action.value["type"]
                                      slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                      suppress_next_message = dialog_action.value["suppress_next_message"]
                                    }
                                }
                                dynamic "intent" {
                                  for_each = next_step.value.intent
                                    content {
                                      name = intent.value["name"]
                                      dynamic "slot" {
                                        for_each = intent.value.slot
                                          content {
                                            shape = slot.value["shape"]
                                            dynamic "value" {
                                              for_each = slot.value.value
                                                content {
                                                  interpreted_value = value.value["interpreted_value"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "response" {
                            for_each = conditional_branch.value.response
                              content {
                                allow_interrupt = response.value["allow_interrupt"]
                                dynamic "message_group" {
                                  for_each = response.value.message_group
                                    content {
                                      dynamic "message" {
                                        for_each = message_group.value.message
                                          content {
                                             dynamic "custom_payload" {
                                               for_each = message.value.custom_payload
                                                 content {
                                                   value = custom_payload.value["value"]
                                                 } 
                                             }
                                             dynamic "image_response_card" {
                                               for_each = message.value.image_response_card
                                                 content {
                                                   image_url = image_response_card.value["image_url"]
                                                   subtitle  = image_response_card.value["subtitle"]
                                                   title     = image_response_card.value["title"]
                                                   dynamic "button" {
                                                     for_each = image_response_card.value.button
                                                       content {
                                                         text  = button.value["text"]
                                                         value = button.value["value"]
                                                       }
                                                   }
                                                 } 
                                             }
                                             dynamic "plain_text_message" {
                                               for_each = message.value.plain_text_message
                                                 content {
                                                   value = plain_text_message.value["value"]
                                                 } 
                                             }
                                             dynamic "ssml_message" {
                                               for_each = message.value.ssml_message
                                                 content {
                                                   value = ssml_message.value["value"]
                                                 } 
                                             }
                                          }
                                      }
                                      dynamic "variation" {
                                        for_each = message_group.value.variation
                                          content {
                                             dynamic "custom_payload" {
                                               for_each = variation.value.custom_payload
                                                 content {
                                                   value = custom_payload.value["value"]
                                                 }
                                             }
                                             dynamic "image_response_card" {
                                               for_each = variation.value.image_response_card
                                                 content {
                                                   image_url = image_response_card.value["image_url"]
                                                   subtitle  = image_response_card.value["subtitle"]
                                                   title     = image_response_card.value["title"]
                                                   dynamic "button" {
                                                     for_each = image_response_card.value.button
                                                       content {
                                                         text  = button.value["text"]
                                                         value = button.value["value"]
                                                       }
                                                   }
                                                 }
                                             }
                                             dynamic "plain_text_message" {
                                               for_each = variation.value.plain_text_message
                                                 content {
                                                   value = plain_text_message.value["value"]
                                                 }
                                             }
                                             dynamic "ssml_message" {
                                               for_each = variation.value.ssml_message
                                                 content {
                                                   value = ssml_message.value["value"]
                                                 }
                                             }                          
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "default_branch" {
                      for_each = success_conditional.value.default_branch
                        content {
                          dynamic "next_step" {
                            for_each = default_branch.value.next_step
                              content {
                                session_attributes = next_step.value["session_attributes"]
                                dynamic "dialog_action" {
                                  for_each = next_step.value.dialog_action
                                    content {
                                      type                  = dialog_action.value["type"]
                                      slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                      suppress_next_message = dialog_action.value["suppress_next_message"]
                                    }
                                }
                                dynamic "intent" {
                                  for_each = next_step.value.intent
                                    content {
                                      name = intent.value["name"]
                                      dynamic "slot" {
                                        for_each = intent.value.slot
                                          content {
                                            shape = slot.value["shape"]
                                            dynamic "value" {
                                              for_each = slot.value.value
                                                content {
                                                  interpreted_value = value.value["interpreted_value"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "response" {
                            for_each = default_branch.value.response
                              content {
                                allow_interrupt = response.value["allow_interrupt"]
                                dynamic "message_group" {
                                  for_each = response.value.message_group
                                    content {
                                      dynamic "message" {
                                        for_each = message_group.value.message
                                          content {
                                            dynamic "custom_payload" {
                                              for_each = message.value.custom_payload
                                                content {
                                                  value = custom_payload.value["value"]
                                                } 
                                            }
                                            dynamic "image_response_card" {
                                              for_each = message.value.image_response_card
                                                content {
                                                  image_url = image_response_card.value["image_url"]
                                                  subtitle  = image_response_card.value["subtitle"]
                                                  title     = image_response_card.value["title"]
                                                  dynamic "button" {
                                                    for_each = image_response_card.value.button
                                                      content {
                                                        text  = button.value["text"]
                                                        value = button.value["value"]
                                                      }
                                                  }
                                                } 
                                            }
                                            dynamic "plain_text_message" {
                                              for_each = message.value.plain_text_message
                                                content {
                                                  value = plain_text_message.value["value"]
                                                } 
                                            }
                                            dynamic "ssml_message" {
                                              for_each = message.value.ssml_message
                                                content {
                                                  value = ssml_message.value["value"]
                                                } 
                                            }
                                          }
                                      }
                                      dynamic "variation" {
                                        for_each = message_group.value.variation
                                          content {
                                            dynamic "custom_payload" {
                                              for_each = variation.value.custom_payload
                                                content {
                                                  value = custom_payload.value["value"]
                                                } 
                                            }
                                            dynamic "image_response_card" {
                                              for_each = variation.value.image_response_card
                                                content {
                                                  image_url = image_response_card.value["image_url"]
                                                  subtitle  = image_response_card.value["subtitle"]
                                                  title     = image_response_card.value["title"]
                                                  dynamic "button" {
                                                    for_each = image_response_card.value.button
                                                      content {
                                                        text  = button.value["text"]
                                                        value = button.value["value"]
                                                      }
                                                  }
                                                } 
                                            }
                                            dynamic "plain_text_message" {
                                              for_each = variation.value.plain_text_message
                                                content {
                                                  value = plain_text_message.value["value"]
                                                } 
                                            }
                                            dynamic "ssml_message" {
                                              for_each = variation.value.ssml_message
                                                content {
                                                  value = ssml_message.value["value"]
                                                } 
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "success_next_step" {
                for_each = post_fulfillment_status_specification.value.success_next_step
                  content {
                    session_attributes = success_next_step.value["session_attributes"]
                    dynamic "dialog_action" {
                      for_each = success_next_step.value.dialog_action
                        content {
                          type                  = dialog_action.value["type"]
                          slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                          suppress_next_message = dialog_action.value["suppress_next_message"]
                        }
                    }
                    dynamic "intent" {
                      for_each = success_next_step.value.intent
                        content {
                          name = intent.value["name"]
                          dynamic "slot" {
                            for_each = intent.value.slot
                              content {
                                shape = slot.value["shape"]
                                dynamic "value" {
                                  for_each = slot.value.value
                                    content {
                                      interpreted_value = value.value["interpreted_value"]
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "success_response" {
                for_each = post_fulfillment_status_specification.value.success_response
                  content {
                    allow_interrupt = success_response.value["allow_interrupt"]
                    dynamic "message_group" {
                      for_each = success_response.value.message_group
                        content {
                          dynamic "message" {
                            for_each = message_group.value.message
                              content {
                                dynamic "custom_payload" {
                                  for_each = message.value.custom_payload
                                    content {
                                      value = custom_payload.value["value"]
                                    } 
                                }
                                dynamic "image_response_card" {
                                  for_each = message.value.image_response_card
                                    content {
                                      image_url = image_response_card.value["image_url"]
                                      subtitle  = image_response_card.value["subtitle"]
                                      title     = image_response_card.value["title"]
                                      dynamic "button" {
                                        for_each = image_response_card.value.button
                                          content {
                                            text  = button.value["text"]
                                            value = button.value["value"]
                                          }
                                      }
                                    } 
                                }
                                dynamic "plain_text_message" {
                                  for_each = message.value.plain_text_message
                                    content {
                                      value = plain_text_message.value["value"]
                                    } 
                                }
                                dynamic "ssml_message" {
                                  for_each = message.value.ssml_message
                                    content {
                                      value = ssml_message.value["value"]
                                    } 
                                }
                              }
                          }
                          dynamic "variation" {
                            for_each = message_group.value.variation
                              content {
                                dynamic "custom_payload" {
                                  for_each = variation.value.custom_payload
                                    content {
                                      value = custom_payload.value["value"]
                                    } 
                                }
                                dynamic "image_response_card" {
                                  for_each = variation.value.image_response_card
                                    content {
                                      image_url = image_response_card.value["image_url"]
                                      subtitle  = image_response_card.value["subtitle"]
                                      title     = image_response_card.value["title"]
                                      dynamic "button" {
                                        for_each = image_response_card.value.button
                                          content {
                                            text  = button.value["text"]
                                            value = button.value["value"]
                                          }
                                      }
                                    } 
                                }
                                dynamic "plain_text_message" {
                                  for_each = variation.value.plain_text_message
                                    content {
                                      value = plain_text_message.value["value"]
                                    } 
                                }
                                dynamic "ssml_message" {
                                  for_each = variation.value.ssml_message
                                    content {
                                      value = ssml_message.value["value"]
                                    } 
                                }
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "timeout_conditional" {
                for_each = post_fulfillment_status_specification.value.timeout_conditional
                  content {
                    active = timeout_conditional.value["active"]
                    dynamic "conditional_branch" {
                      for_each = timeout_conditional.value.conditional_branch
                        content {
                          name = conditional_branch.value["name"]
                          dynamic "condition" {
                            for_each = conditional_branch.value.condition
                              content {
                                expression_string = condition.value["expression_string"]
                              }
                          }
                          dynamic "next_step" {
                            for_each = conditional_branch.value.next_step
                              content {
                                session_attributes = next_step.value["session_attributes"]
                                dynamic "dialog_action" {
                                  for_each = next_step.value.dialog_action
                                    content {
                                      type                  = dialog_action.value["type"]
                                      slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                      suppress_next_message = dialog_action.value["suppress_next_message"]
                                    }
                                }
                                dynamic "intent" {
                                  for_each = next_step.value.intent
                                    content {
                                      name = intent.value["name"]
                                      dynamic "slot" {
                                        for_each = intent.value.slot
                                          content {
                                            shape = slot.value["shape"]
                                            dynamic "value" {
                                              for_each = slot.value.value
                                                content {
                                                  interpreted_value = value.value["interpreted_value"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "response" {
                            for_each = conditional_branch.value.response
                              content {
                                allow_interrupt = response.value["allow_interrupt"]
                                dynamic "message_group" {
                                  for_each = response.value.message_group
                                    content {
                                      dynamic "message" {
                                        for_each = message_group.value.message
                                          content {
                                             dynamic "custom_payload" {
                                               for_each = message.value.custom_payload
                                                 content {
                                                   value = custom_payload.value["value"]
                                                 } 
                                             }
                                             dynamic "image_response_card" {
                                               for_each = message.value.image_response_card
                                                 content {
                                                   image_url = image_response_card.value["image_url"]
                                                   subtitle  = image_response_card.value["subtitle"]
                                                   title     = image_response_card.value["title"]
                                                   dynamic "button" {
                                                     for_each = image_response_card.value.button
                                                       content {
                                                         text  = button.value["text"]
                                                         value = button.value["value"]
                                                       }
                                                   }
                                                 } 
                                             }
                                             dynamic "plain_text_message" {
                                               for_each = message.value.plain_text_message
                                                 content {
                                                   value = plain_text_message.value["value"]
                                                 } 
                                             }
                                             dynamic "ssml_message" {
                                               for_each = message.value.ssml_message
                                                 content {
                                                   value = ssml_message.value["value"]
                                                 } 
                                             }
                                          }
                                      }
                                      dynamic "variation" {
                                        for_each = message_group.value.variation
                                          content {
                                             dynamic "custom_payload" {
                                               for_each = variation.value.custom_payload
                                                 content {
                                                   value = custom_payload.value["value"]
                                                 }
                                             }
                                             dynamic "image_response_card" {
                                               for_each = variation.value.image_response_card
                                                 content {
                                                   image_url = image_response_card.value["image_url"]
                                                   subtitle  = image_response_card.value["subtitle"]
                                                   title     = image_response_card.value["title"]
                                                   dynamic "button" {
                                                     for_each = image_response_card.value.button
                                                       content {
                                                         text  = button.value["text"]
                                                         value = button.value["value"]
                                                       }
                                                   }
                                                 }
                                             }
                                             dynamic "plain_text_message" {
                                               for_each = variation.value.plain_text_message
                                                 content {
                                                   value = plain_text_message.value["value"]
                                                 }
                                             }
                                             dynamic "ssml_message" {
                                               for_each = variation.value.ssml_message
                                                 content {
                                                   value = ssml_message.value["value"]
                                                 }
                                             }                          
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "default_branch" {
                      for_each = timeout_conditional.value.default_branch
                        content {
                          dynamic "next_step" {
                            for_each = default_branch.value.next_step
                              content {
                                session_attributes = next_step.value["session_attributes"]
                                dynamic "dialog_action" {
                                  for_each = next_step.value.dialog_action
                                    content {
                                      type                  = dialog_action.value["type"]
                                      slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                      suppress_next_message = dialog_action.value["suppress_next_message"]
                                    }
                                }
                                dynamic "intent" {
                                  for_each = next_step.value.intent
                                    content {
                                      name = intent.value["name"]
                                      dynamic "slot" {
                                        for_each = intent.value.slot
                                          content {
                                            shape = slot.value["shape"]
                                            dynamic "value" {
                                              for_each = slot.value.value
                                                content {
                                                  interpreted_value = value.value["interpreted_value"]
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "response" {
                            for_each = default_branch.value.response
                              content {
                                allow_interrupt = response.value["allow_interrupt"]
                                dynamic "message_group" {
                                  for_each = response.value.message_group
                                    content {
                                      dynamic "message" {
                                        for_each = message_group.value.message
                                          content {
                                            dynamic "custom_payload" {
                                              for_each = message.value.custom_payload
                                                content {
                                                  value = custom_payload.value["value"]
                                                } 
                                            }
                                            dynamic "image_response_card" {
                                              for_each = message.value.image_response_card
                                                content {
                                                  image_url = image_response_card.value["image_url"]
                                                  subtitle  = image_response_card.value["subtitle"]
                                                  title     = image_response_card.value["title"]
                                                  dynamic "button" {
                                                    for_each = image_response_card.value.button
                                                      content {
                                                        text  = button.value["text"]
                                                        value = button.value["value"]
                                                      }
                                                  }
                                                } 
                                            }
                                            dynamic "plain_text_message" {
                                              for_each = message.value.plain_text_message
                                                content {
                                                  value = plain_text_message.value["value"]
                                                } 
                                            }
                                            dynamic "ssml_message" {
                                              for_each = message.value.ssml_message
                                                content {
                                                  value = ssml_message.value["value"]
                                                } 
                                            }
                                          }
                                      }
                                      dynamic "variation" {
                                        for_each = message_group.value.variation
                                          content {
                                            dynamic "custom_payload" {
                                              for_each = variation.value.custom_payload
                                                content {
                                                  value = custom_payload.value["value"]
                                                } 
                                            }
                                            dynamic "image_response_card" {
                                              for_each = variation.value.image_response_card
                                                content {
                                                  image_url = image_response_card.value["image_url"]
                                                  subtitle  = image_response_card.value["subtitle"]
                                                  title     = image_response_card.value["title"]
                                                  dynamic "button" {
                                                    for_each = image_response_card.value.button
                                                      content {
                                                        text  = button.value["text"]
                                                        value = button.value["value"]
                                                      }
                                                  }
                                                } 
                                            }
                                            dynamic "plain_text_message" {
                                              for_each = variation.value.plain_text_message
                                                content {
                                                  value = plain_text_message.value["value"]
                                                } 
                                            }
                                            dynamic "ssml_message" {
                                              for_each = variation.value.ssml_message
                                                content {
                                                  value = ssml_message.value["value"]
                                                } 
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "timeout_next_step" {
                for_each = post_fulfillment_status_specification.value.timeout_next_step
                  content {
                    session_attributes = timeout_next_step.value["session_attributes"]
                    dynamic "dialog_action" {
                      for_each = timeout_next_step.value.dialog_action
                        content {
                          type                  = dialog_action.value["type"]
                          slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                          suppress_next_message = dialog_action.value["suppress_next_message"]
                        }
                    }
                    dynamic "intent" {
                      for_each = timeout_next_step.value.intent
                        content {
                          name = intent.value["name"]
                          dynamic "slot" {
                            for_each = intent.value.slot
                              content {
                                shape = slot.value["shape"]
                                dynamic "value" {
                                  for_each = slot.value.value
                                    content {
                                      interpreted_value = value.value["interpreted_value"]
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "timeout_response" {
                for_each = post_fulfillment_status_specification.value.timeout_response
                  content {
                    allow_interrupt = timeout_response.value["allow_interrupt"]
                    dynamic "message_group" {
                      for_each = timeout_response.value.message_group
                        content {
                          dynamic "message" {
                            for_each = message_group.value.message
                              content {
                                dynamic "custom_payload" {
                                  for_each = message.value.custom_payload
                                    content {
                                      value = custom_payload.value["value"]
                                    } 
                                }
                                dynamic "image_response_card" {
                                  for_each = message.value.image_response_card
                                    content {
                                      image_url = image_response_card.value["image_url"]
                                      subtitle  = image_response_card.value["subtitle"]
                                      title     = image_response_card.value["title"]
                                      dynamic "button" {
                                        for_each = image_response_card.value.button
                                          content {
                                            text  = button.value["text"]
                                            value = button.value["value"]
                                          }
                                      }
                                    } 
                                }
                                dynamic "plain_text_message" {
                                  for_each = message.value.plain_text_message
                                    content {
                                      value = plain_text_message.value["value"]
                                    } 
                                }
                                dynamic "ssml_message" {
                                  for_each = message.value.ssml_message
                                    content {
                                      value = ssml_message.value["value"]
                                    } 
                                }
                              }
                          }
                          dynamic "variation" {
                            for_each = message_group.value.variation
                              content {
                                dynamic "custom_payload" {
                                  for_each = variation.value.custom_payload
                                    content {
                                      value = custom_payload.value["value"]
                                    } 
                                }
                                dynamic "image_response_card" {
                                  for_each = variation.value.image_response_card
                                    content {
                                      image_url = image_response_card.value["image_url"]
                                      subtitle  = image_response_card.value["subtitle"]
                                      title     = image_response_card.value["title"]
                                      dynamic "button" {
                                        for_each = image_response_card.value.button
                                          content {
                                            text  = button.value["text"]
                                            value = button.value["value"]
                                          }
                                      }
                                    } 
                                }
                                dynamic "plain_text_message" {
                                  for_each = variation.value.plain_text_message
                                    content {
                                      value = plain_text_message.value["value"]
                                    } 
                                }
                                dynamic "ssml_message" {
                                  for_each = variation.value.ssml_message
                                    content {
                                      value = ssml_message.value["value"]
                                    } 
                                }
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
      }
  }
  dynamic "initial_response_setting" {
    for_each = var.lexv2models_intent_initial_response_setting
      content {
        dynamic "code_hook" {
          for_each = initial_response_setting.value.code_hook
            content {
              active                      = code_hook.value["active"]
              enable_code_hook_invocation = code_hook.value["enable_code_hook_invocation"]
              invocation_label            = code_hook.value["invocation_label"]
              dynamic "post_code_hook_specification" {
                for_each = code_hook.value.post_code_hook_specification
                  content {
                    dynamic "failure_conditional" {
                      for_each = post_code_hook_specification.value.failure_conditional
                        content {
                          active = failure_conditional.value["active"]
                          dynamic "conditional_branch" {
                            for_each = failure_conditional.value.conditional_branch
                              content {
                                name = conditional_branch.value["name"]
                                dynamic "condition" {
                                  for_each = conditional_branch.value.condition
                                    content {
                                      expression_string = condition.value["expression_string"]
                                    }
                                }
                                dynamic "next_step" {
                                  for_each = conditional_branch.value.next_step
                                    content {
                                      session_attributes = next_step.value["session_attributes"]
                                      dynamic "dialog_action" {
                                        for_each = next_step.value.dialog_action
                                          content {
                                            type                  = dialog_action.value["type"]
                                            slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                            suppress_next_message = dialog_action.value["suppress_next_message"]
                                          }
                                      }
                                      dynamic "intent" {
                                        for_each = next_step.value.intent
                                          content {
                                            name = intent.value["name"]
                                            dynamic "slot" {
                                              for_each = intent.value.slot
                                                content {
                                                  shape = slot.value["shape"]
                                                  dynamic "value" {
                                                    for_each = slot.value.value
                                                      content {
                                                        interpreted_value = value.value["interpreted_value"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "response" {
                                  for_each = conditional_branch.value.response
                                    content {
                                      allow_interrupt = response.value["allow_interrupt"]
                                      dynamic "message_group" {
                                        for_each = response.value.message_group
                                          content {
                                            dynamic "message" {
                                              for_each = message_group.value.message
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = message.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       } 
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = message.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       } 
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = message.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       } 
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = message.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       } 
                                                   }
                                                }
                                            }
                                            dynamic "variation" {
                                              for_each = message_group.value.variation
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = variation.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       }
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = variation.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       }
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = variation.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       }
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = variation.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       }
                                                   }                          
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                          dynamic "default_branch" {
                            for_each = failure_conditional.value.default_branch
                              content {
                                dynamic "next_step" {
                                  for_each = default_branch.value.next_step
                                    content {
                                      session_attributes = next_step.value["session_attributes"]
                                      dynamic "dialog_action" {
                                        for_each = next_step.value.dialog_action
                                          content {
                                            type                  = dialog_action.value["type"]
                                            slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                            suppress_next_message = dialog_action.value["suppress_next_message"]
                                          }
                                      }
                                      dynamic "intent" {
                                        for_each = next_step.value.intent
                                          content {
                                            name = intent.value["name"]
                                            dynamic "slot" {
                                              for_each = intent.value.slot
                                                content {
                                                  shape = slot.value["shape"]
                                                  dynamic "value" {
                                                    for_each = slot.value.value
                                                      content {
                                                        interpreted_value = value.value["interpreted_value"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "response" {
                                  for_each = default_branch.value.response
                                    content {
                                      allow_interrupt = response.value["allow_interrupt"]
                                      dynamic "message_group" {
                                        for_each = response.value.message_group
                                          content {
                                            dynamic "message" {
                                              for_each = message_group.value.message
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = message.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       } 
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = message.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       } 
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = message.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       } 
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = message.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       } 
                                                   }
                                                }
                                            }
                                            dynamic "variation" {
                                              for_each = message_group.value.variation
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = variation.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       }
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = variation.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       }
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = variation.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       }
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = variation.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       }
                                                   }                          
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "failure_next_step" {
                      for_each = post_code_hook_specification.value.failure_next_step
                        content {
                          session_attributes = failure_next_step.value["session_attributes"]
                          dynamic "dialog_action" {
                            for_each = failure_next_step.value.dialog_action
                              content {
                                type                  = dialog_action.value["type"]
                                slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                suppress_next_message = dialog_action.value["suppress_next_message"]
                              }
                          }
                          dynamic "intent" {
                            for_each = failure_next_step.value.intent
                              content {
                                name = intent.value["name"]
                                dynamic "slot" {
                                  for_each = intent.value.slot
                                    content {
                                      shape = slot.value["shape"]
                                      dynamic "value" {
                                        for_each = slot.value.value
                                          content {
                                            interpreted_value = value.value["interpreted_value"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "failure_response" {
                      for_each = post_code_hook_specification.value.failure_response
                        content {
                          allow_interrupt = failure_response.value["allow_interrupt"]
                          dynamic "message_group" {
                            for_each = failure_response.value.message_group
                              content {
                                dynamic "message" {
                                  for_each = message_group.value.message
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = message.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          } 
                                      }
                                      dynamic "image_response_card" {
                                        for_each = message.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = message.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          } 
                                      }
                                      dynamic "ssml_message" {
                                        for_each = message.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          } 
                                      }
                                    }
                                }
                                dynamic "variation" {
                                  for_each = message_group.value.variation
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = variation.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          } 
                                      }
                                      dynamic "image_response_card" {
                                        for_each = variation.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = variation.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          } 
                                      }
                                      dynamic "ssml_message" {
                                        for_each = variation.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          } 
                                      }
                                    }
                                }
                              }
                          }

                        }
                    }
                    dynamic "success_conditional" {
                      for_each = post_code_hook_specification.value.success_conditional
                        content {
                          active = success_conditional.value["active"]
                          dynamic "conditional_branch" {
                            for_each = success_conditional.value.conditional_branch
                              content {
                                name = conditional_branch.value["name"]
                                dynamic "condition" {
                                  for_each = conditional_branch.value.condition
                                    content {
                                      expression_string = condition.value["expression_string"]
                                    }
                                }
                                dynamic "next_step" {
                                  for_each = conditional_branch.value.next_step
                                    content {
                                      session_attributes = next_step.value["session_attributes"]
                                      dynamic "dialog_action" {
                                        for_each = next_step.value.dialog_action
                                          content {
                                            type                  = dialog_action.value["type"]
                                            slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                            suppress_next_message = dialog_action.value["suppress_next_message"]
                                          }
                                      }
                                      dynamic "intent" {
                                        for_each = next_step.value.intent
                                          content {
                                            name = intent.value["name"]
                                            dynamic "slot" {
                                              for_each = intent.value.slot
                                                content {
                                                  shape = slot.value["shape"]
                                                  dynamic "value" {
                                                    for_each = slot.value.value
                                                      content {
                                                        interpreted_value = value.value["interpreted_value"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "response" {
                                  for_each = conditional_branch.value.response
                                    content {
                                      allow_interrupt = response.value["allow_interrupt"]
                                      dynamic "message_group" {
                                        for_each = response.value.message_group
                                          content {
                                            dynamic "message" {
                                              for_each = message_group.value.message
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = message.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       } 
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = message.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       } 
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = message.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       } 
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = message.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       } 
                                                   }
                                                }
                                            }
                                            dynamic "variation" {
                                              for_each = message_group.value.variation
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = variation.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       }
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = variation.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       }
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = variation.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       }
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = variation.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       }
                                                   }                          
                                                }
                                            }
                                          }
                                      }
                                    }
                                 }
                              }
                          }
                          dynamic "default_branch" {
                            for_each = success_conditional.value.default_branch
                              content {
                                dynamic "next_step" {
                                  for_each = default_branch.value.next_step
                                    content {
                                      session_attributes = next_step.value["session_attributes"]
                                      dynamic "dialog_action" {
                                        for_each = next_step.value.dialog_action
                                          content {
                                            type                  = dialog_action.value["type"]
                                            slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                            suppress_next_message = dialog_action.value["suppress_next_message"]
                                          }
                                      }
                                      dynamic "intent" {
                                        for_each = next_step.value.intent
                                          content {
                                            name = intent.value["name"]
                                            dynamic "slot" {
                                              for_each = intent.value.slot
                                                content {
                                                  shape = slot.value["shape"]
                                                  dynamic "value" {
                                                    for_each = slot.value.value
                                                      content {
                                                        interpreted_value = value.value["interpreted_value"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "response" {
                                  for_each = default_branch.value.response
                                    content {
                                      allow_interrupt = response.value["allow_interrupt"]
                                      dynamic "message_group" {
                                        for_each = response.value.message_group
                                          content {
                                            dynamic "message" {
                                              for_each = message_group.value.message
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = message.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       } 
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = message.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       } 
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = message.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       } 
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = message.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       } 
                                                   }
                                                }
                                            }
                                            dynamic "variation" {
                                              for_each = message_group.value.variation
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = variation.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       }
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = variation.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       }
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = variation.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       }
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = variation.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       }
                                                   }                          
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "success_next_step" {
                      for_each = post_code_hook_specification.value.success_next_step
                        content {
                          session_attributes = success_next_step.value["session_attributes"]
                          dynamic "dialog_action" {
                            for_each = success_next_step.value.dialog_action
                              content {
                                type                  = dialog_action.value["type"]
                                slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                suppress_next_message = dialog_action.value["suppress_next_message"]
                              }
                          }
                          dynamic "intent" {
                            for_each = success_next_step.value.intent
                              content {
                                name = intent.value["name"]
                                dynamic "slot" {
                                  for_each = intent.value.slot
                                    content {
                                      shape = slot.value["shape"]
                                      dynamic "value" {
                                        for_each = slot.value.value
                                          content {
                                            interpreted_value = value.value["interpreted_value"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "success_response" {
                      for_each = post_code_hook_specification.value.success_response
                        content {
                          allow_interrupt = success_response.value["allow_interrupt"]
                          dynamic "message_group" {
                            for_each = success_response.value.message_group
                              content {
                                dynamic "message" {
                                  for_each = message_group.value.message
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = message.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          } 
                                      }
                                      dynamic "image_response_card" {
                                        for_each = message.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = message.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          } 
                                      }
                                      dynamic "ssml_message" {
                                        for_each = message.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          } 
                                      }
                                    }
                                }
                                dynamic "variation" {
                                  for_each = message_group.value.variation
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = variation.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          }
                                      }
                                      dynamic "image_response_card" {
                                        for_each = variation.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          }
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = variation.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          }
                                      }
                                      dynamic "ssml_message" {
                                        for_each = variation.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          }
                                      }                          
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "timeout_conditional" {
                      for_each = post_code_hook_specification.value.timeout_conditional
                        content {
                          active = timeout_conditional.value["active"]
                          dynamic "conditional_branch" {
                            for_each = timeout_conditional.value.conditional_branch
                              content {
                                name = conditional_branch.value["name"]
                                dynamic "condition" {
                                  for_each = conditional_branch.value.condition
                                    content {
                                      expression_string = condition.value["expression_string"]
                                    }
                                }
                                dynamic "next_step" {
                                  for_each = conditional_branch.value.next_step
                                    content {
                                      session_attributes = next_step.value["session_attributes"]
                                      dynamic "dialog_action" {
                                        for_each = next_step.value.dialog_action
                                          content {
                                            type                  = dialog_action.value["type"]
                                            slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                            suppress_next_message = dialog_action.value["suppress_next_message"]
                                          }
                                      }
                                      dynamic "intent" {
                                        for_each = next_step.value.intent
                                          content {
                                            name = intent.value["name"]
                                            dynamic "slot" {
                                              for_each = intent.value.slot
                                                content {
                                                  shape = slot.value["shape"]
                                                  dynamic "value" {
                                                    for_each = slot.value.value
                                                      content {
                                                        interpreted_value = value.value["interpreted_value"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "response" {
                                  for_each = conditional_branch.value.response
                                    content {
                                      allow_interrupt = response.value["allow_interrupt"]
                                      dynamic "message_group" {
                                        for_each = response.value.message_group
                                          content {
                                            dynamic "message" {
                                              for_each = message_group.value.message
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = message.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       } 
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = message.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       } 
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = message.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       } 
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = message.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       } 
                                                   }
                                                }
                                            }
                                            dynamic "variation" {
                                              for_each = message_group.value.variation
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = variation.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       }
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = variation.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       }
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = variation.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       }
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = variation.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       }
                                                   }                          
                                                }
                                            }
                                          }
                                      }
                                    }
                                 } 
                              }
                          }
                          dynamic "default_branch" {
                            for_each = timeout_conditional.value.default_branch
                              content {
                                dynamic "next_step" {
                                  for_each = default_branch.value.next_step
                                    content {
                                      session_attributes = next_step.value["session_attributes"]
                                      dynamic "dialog_action" {
                                        for_each = next_step.value.dialog_action
                                          content {
                                            type                  = dialog_action.value["type"]
                                            slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                            suppress_next_message = dialog_action.value["suppress_next_message"]
                                          }
                                      }
                                      dynamic "intent" {
                                        for_each = next_step.value.intent
                                          content {
                                            name = intent.value["name"]
                                            dynamic "slot" {
                                              for_each = intent.value.slot
                                                content {
                                                  shape = slot.value["shape"]
                                                  dynamic "value" {
                                                    for_each = slot.value.value
                                                      content {
                                                        interpreted_value = value.value["interpreted_value"]
                                                      }
                                                  }
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                                dynamic "response" {
                                  for_each = default_branch.value.response
                                    content {
                                      allow_interrupt = response.value["allow_interrupt"]
                                      dynamic "message_group" {
                                        for_each = response.value.message_group
                                          content {
                                            dynamic "message" {
                                              for_each = message_group.value.message
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = message.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       } 
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = message.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       } 
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = message.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       } 
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = message.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       } 
                                                   }
                                                }
                                            }
                                            dynamic "variation" {
                                              for_each = message_group.value.variation
                                                content {
                                                   dynamic "custom_payload" {
                                                     for_each = variation.value.custom_payload
                                                       content {
                                                         value = custom_payload.value["value"]
                                                       }
                                                   }
                                                   dynamic "image_response_card" {
                                                     for_each = variation.value.image_response_card
                                                       content {
                                                         image_url = image_response_card.value["image_url"]
                                                         subtitle  = image_response_card.value["subtitle"]
                                                         title     = image_response_card.value["title"]
                                                         dynamic "button" {
                                                           for_each = image_response_card.value.button
                                                             content {
                                                               text  = button.value["text"]
                                                               value = button.value["value"]
                                                             }
                                                         }
                                                       }
                                                   }
                                                   dynamic "plain_text_message" {
                                                     for_each = variation.value.plain_text_message
                                                       content {
                                                         value = plain_text_message.value["value"]
                                                       }
                                                   }
                                                   dynamic "ssml_message" {
                                                     for_each = variation.value.ssml_message
                                                       content {
                                                         value = ssml_message.value["value"]
                                                       }
                                                   }                          
                                                }
                                            }
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "timeout_next_step" {
                      for_each = post_code_hook_specification.value.timeout_next_step
                        content {
                          session_attributes = timeout_next_step.value["session_attributes"]
                          dynamic "dialog_action" {
                            for_each = timeout_next_step.value.dialog_action
                              content {
                                type                  = dialog_action.value["type"]
                                slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                suppress_next_message = dialog_action.value["suppress_next_message"]
                              }
                          }
                          dynamic "intent" {
                            for_each = timeout_next_step.value.intent
                              content {
                                name = intent.value["name"]
                                dynamic "slot" {
                                  for_each = intent.value.slot
                                    content {
                                      shape = slot.value["shape"]
                                      dynamic "value" {
                                        for_each = slot.value.value
                                          content {
                                            interpreted_value = value.value["interpreted_value"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "timeout_response" {
                      for_each = post_code_hook_specification.value.timeout_response
                        content {
                          allow_interrupt = timeout_response.value["allow_interrupt"]
                          dynamic "message_group" {
                            for_each = timeout_response.value.message_group
                              content {
                                dynamic "message" {
                                  for_each = message_group.value.message
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = message.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          } 
                                      }
                                      dynamic "image_response_card" {
                                        for_each = message.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = message.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          } 
                                      }
                                      dynamic "ssml_message" {
                                        for_each = message.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          } 
                                      }
                                    }
                                }
                                dynamic "variation" {
                                  for_each = message_group.value.variation
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = variation.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          }
                                      }
                                      dynamic "image_response_card" {
                                        for_each = variation.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          }
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = variation.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          }
                                      }
                                      dynamic "ssml_message" {
                                        for_each = variation.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          }
                                      }                          
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "conditional" {
          for_each = initial_response_setting.value.conditional
            content {
              active = conditional.value["active"]
              dynamic "conditional_branch" {
                for_each = conditional.value.conditional_branch
                  content {
                    name = conditional_branch.value["name"]
                    dynamic "condition" {
                      for_each = conditional_branch.value.condition
                        content {
                          expression_string = condition.value["expression_string"]
                        }
                    }
                    dynamic "next_step" {
                      for_each = conditional_branch.value.next_step
                        content {
                          session_attributes = next_step.value["session_attributes"]
                          dynamic "dialog_action" {
                            for_each = next_step.value.dialog_action
                              content {
                                type                  = dialog_action.value["type"]
                                slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                suppress_next_message = dialog_action.value["suppress_next_message"]
                              }
                          }
                          dynamic "intent" {
                            for_each = next_step.value.intent
                              content {
                                name = intent.value["name"]
                                dynamic "slot" {
                                  for_each = intent.value.slot
                                    content {
                                      shape = slot.value["shape"]
                                      dynamic "value" {
                                        for_each = slot.value.value
                                          content {
                                            interpreted_value = value.value["interpreted_value"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "response" {
                      for_each = conditional_branch.value.response
                        content {
                          allow_interrupt = response.value["allow_interrupt"]
                          dynamic "message_group" {
                            for_each = response.value.message_group
                              content {
                                dynamic "message" {
                                  for_each = message_group.value.message
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = message.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          } 
                                      }
                                      dynamic "image_response_card" {
                                        for_each = message.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = message.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          } 
                                      }
                                      dynamic "ssml_message" {
                                        for_each = message.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          } 
                                      }
                                    }
                                }
                                dynamic "variation" {
                                  for_each = message_group.value.variation
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = variation.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          }
                                      }
                                      dynamic "image_response_card" {
                                        for_each = variation.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          }
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = variation.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          }
                                      }
                                      dynamic "ssml_message" {
                                        for_each = variation.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          }
                                      }                          
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "default_branch" {
                for_each = conditional.value.default_branch
                  content {
                    dynamic "next_step" {
                      for_each = default_branch.value.next_step
                        content {
                          session_attributes = next_step.value["session_attributes"]
                          dynamic "dialog_action" {
                            for_each = next_step.value.dialog_action
                              content {
                                type                  = dialog_action.value["type"]
                                slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                                suppress_next_message = dialog_action.value["suppress_next_message"]
                              }
                          }
                          dynamic "intent" {
                            for_each = next_step.value.intent
                              content {
                                name = intent.value["name"]
                                dynamic "slot" {
                                  for_each = intent.value.slot
                                    content {
                                      shape = slot.value["shape"]
                                      dynamic "value" {
                                        for_each = slot.value.value
                                          content {
                                            interpreted_value = value.value["interpreted_value"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "response" {
                      for_each = default_branch.value.response
                        content {
                          allow_interrupt = response.value["allow_interrupt"]
                          dynamic "message_group" {
                            for_each = response.value.message_group
                              content {
                                dynamic "message" {
                                  for_each = message_group.value.message
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = message.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          } 
                                      }
                                      dynamic "image_response_card" {
                                        for_each = message.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          } 
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = message.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          } 
                                      }
                                      dynamic "ssml_message" {
                                        for_each = message.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          } 
                                      }
                                    }
                                }
                                dynamic "variation" {
                                  for_each = message_group.value.variation
                                    content {
                                      dynamic "custom_payload" {
                                        for_each = variation.value.custom_payload
                                          content {
                                            value = custom_payload.value["value"]
                                          }
                                      }
                                      dynamic "image_response_card" {
                                        for_each = variation.value.image_response_card
                                          content {
                                            image_url = image_response_card.value["image_url"]
                                            subtitle  = image_response_card.value["subtitle"]
                                            title     = image_response_card.value["title"]
                                            dynamic "button" {
                                              for_each = image_response_card.value.button
                                                content {
                                                  text  = button.value["text"]
                                                  value = button.value["value"]
                                                }
                                            }
                                          }
                                      }
                                      dynamic "plain_text_message" {
                                        for_each = variation.value.plain_text_message
                                          content {
                                            value = plain_text_message.value["value"]
                                          }
                                      }
                                      dynamic "ssml_message" {
                                        for_each = variation.value.ssml_message
                                          content {
                                            value = ssml_message.value["value"]
                                          }
                                      }                          
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "initial_response" {
          for_each = initial_response_setting.value.initial_response
            content {
              allow_interrupt = initial_response.value["allow_interrupt"]
              dynamic "message_group" {
                for_each = initial_response.value.message_group
                  content {
                    dynamic "message" {
                      for_each = message_group.value.message
                        content {
                          dynamic "custom_payload" {
                            for_each = message.value.custom_payload
                              content {
                                value = custom_payload.value["value"]
                              } 
                          }
                          dynamic "image_response_card" {
                            for_each = message.value.image_response_card
                              content {
                                image_url = image_response_card.value["image_url"]
                                subtitle  = image_response_card.value["subtitle"]
                                title     = image_response_card.value["title"]
                                dynamic "button" {
                                  for_each = image_response_card.value.button
                                    content {
                                      text  = button.value["text"]
                                      value = button.value["value"]
                                    }
                                }
                              } 
                          }
                          dynamic "plain_text_message" {
                            for_each = message.value.plain_text_message
                              content {
                                value = plain_text_message.value["value"]
                              } 
                          }
                          dynamic "ssml_message" {
                            for_each = message.value.ssml_message
                              content {
                                value = ssml_message.value["value"]
                              } 
                          }
                        }
                    }
                    dynamic "variation" {
                      for_each = message_group.value.variation
                        content {
                          dynamic "custom_payload" {
                            for_each = variation.value.custom_payload
                              content {
                                value = custom_payload.value["value"]
                              }
                          }
                          dynamic "image_response_card" {
                            for_each = variation.value.image_response_card
                              content {
                                image_url = image_response_card.value["image_url"]
                                subtitle  = image_response_card.value["subtitle"]
                                title     = image_response_card.value["title"]
                                dynamic "button" {
                                  for_each = image_response_card.value.button
                                    content {
                                      text  = button.value["text"]
                                      value = button.value["value"]
                                    }
                                }
                              }
                          }
                          dynamic "plain_text_message" {
                            for_each = variation.value.plain_text_message
                              content {
                                value = plain_text_message.value["value"]
                              }
                          }
                          dynamic "ssml_message" {
                            for_each = variation.value.ssml_message
                              content {
                                value = ssml_message.value["value"]
                              }
                          }                          
                        }
                    }
                  }
              }
            }
        }
        dynamic "next_step" {
          for_each = initial_response_setting.value.next_step
            content {
              session_attributes = next_step.value["session_attributes"]
              dynamic "dialog_action" {
                for_each = next_step.value.dialog_action
                  content {
                    type                  = dialog_action.value["type"]
                    slot_to_elicit        = dialog_action.value["slot_to_elicit"]
                    suppress_next_message = dialog_action.value["suppress_next_message"]
                  }
              } 
              dynamic "intent" {
                for_each = next_step.value.intent
                  content {
                    name = intent.value["name"]
                    dynamic "slot" {
                      for_each = intent.value.slot
                        content {
                          shape = slot.value["shape"]
                          dynamic "value" {
                            for_each = slot.value.value
                              content {
                                interpreted_value = value.value["interpreted_value"]
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
      }
  }
  dynamic "input_context" {
    for_each = var.lexv2models_intent_input_context
      content {
        name = input_context.value["name"]
      }
  }
  dynamic "kendra_configuration" {
    for_each = var.lexv2models_intent_kendra_configuration
      content {
        kendra_index                = kendra_configuration.value["kendra_index"]
        query_filter_string         = kendra_configuration.value["query_filter_string"]
        query_filter_string_enabled = kendra_configuration.value["query_filter_string_enabled"] 
      }
  }
  dynamic "qna_intent_configuration" {
    for_each = var.lexv2models_intent_qna_intent_configuration
      content {
        dynamic "bedrock_model_configuration" {
          for_each = qna_intent_configuration.value.bedrock_model_configuration
            content {
              custom_prompt = bedrock_model_configuration.value["custom_prompt"]
              model_arn     = bedrock_model_configuration.value["model_arn"]
              trace_status  = bedrock_model_configuration.value["trace_status"]
              dynamic "guardrail" {
                for_each = bedrock_model_configuration.value.guardrail
                  content {
                    identifier = guardrail.value["identifier"]
                    version    = guardrail.value["version"]
                  }
              }
            }
        }
        dynamic "data_source_configuration" {
          for_each = qna_intent_configuration.value.data_source_configuration
            content {
              dynamic "bedrock_knowledge_store_configuration" {
                for_each = data_source_configuration.value.bedrock_knowledge_store_configuration
                  content {
                    bedrock_knowledge_base_arn = bedrock_knowledge_store_configuration.value["bedrock_knowledge_base_arn"]
                    exact_response             = bedrock_knowledge_store_configuration.value["exact_response"]
                    dynamic "exact_response_fields" {
                      for_each = bedrock_knowledge_store_configuration.value.exact_response_fields
                        content {
                          answer_field = exact_response_fields.value["answer_field"]
                        }
                    }
                  }
              }
              dynamic "kendra_configuration" {
                for_each = data_source_configuration.value.kendra_configuration
                  content {
                    exact_response              = kendra_configuration.value["exact_response"]
                    kendra_index                = kendra_configuration.value["kendra_index"]
                    query_filter_string         = kendra_configuration.value["query_filter_string"]
                    query_filter_string_enabled = kendra_configuration.value["query_filter_string_enabled"]
                  }
              }
              dynamic "opensearch_configuration" {
                for_each = data_source_configuration.value.opensearch_configuration
                  content {
                    domain_endpoint = opensearch_configuration.value["domain_endpoint"]
                    exact_response  = opensearch_configuration.value["exact_response"]
                    include_fields  = opensearch_configuration.value["include_fields"]
                    index_name      = opensearch_configuration.value["index_name"]
                    dynamic "exact_response_fields" {
                      for_each = opensearch_configuration.value.exact_response_fields
                        content {
                          answer_field   = exact_response_fields.value["answer_field"]
                          question_field = exact_response_fields.value["question_field"]
                        }
                    }
                  }
              }
            }
        }
      }
  }
  dynamic "output_context" {
    for_each = var.lexv2models_intent_output_context
      content {
        name                    = output_context.value["name"]
        time_to_live_in_seconds = output_context.value["time_to_live_in_seconds"]
        turns_to_live           = output_context.value["turns_to_live"]
      }
  }
  dynamic "sample_utterance" {
    for_each = var.lexv2models_intent_sample_utterance
      content {
        utterance = sample_utterance.value["utterance"]
      }
  }
  dynamic "slot_priority" {
    for_each = var.lexv2models_intent_slot_priority
      content {
        priority = slot_priority.value["priority"]
        slot_id  = slot_priority.value["slot_id"]
      }
  }
}
