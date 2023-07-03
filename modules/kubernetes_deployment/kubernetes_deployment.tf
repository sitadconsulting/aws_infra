resource "kubernetes_deployment_v1" "deployment" {

  metadata {
    annotations = var.deployment_metadata_annotations
    labels      = var.deployment_metadata_labels
    name        = var.deployment_metadata_name
    namespace   = var.deployment_metadata_namespace
  }

  wait_for_rollout = var.deployment_wait_for_rollout

  spec {
    min_ready_seconds         = var.deployment_spec_min_ready_seconds
    paused                    = var.deployment_spec_paused
    progress_deadline_seconds = var.deployment_spec_progress_deadline_seconds
    replicas                  = var.deployment_spec_replicas
    revision_history_limit    = var.deployment_spec_revision_history_limit

    dynamic "selector" {
      for_each = var.deployment_spec_selector 
        content {
          match_labels = selector.value["match_labels"]
        }
    }
    dynamic "strategy" {
      for_each = var.deployment_spec_strategy
        content {
          type = strategy.value["type"]
          dynamic "rolling_update" {
            for_each = strategy.value.rolling_update
              content {
                max_surge       = rolling_update.value["max_surge"]
                max_unavailable = rolling_update.value["max_unavailable"]
              }
          }
        }
    }
    template {
      metadata {
        annotations = var.deployment_spec_template_metadata_annotations
        labels      = var.deployment_spec_template_metadata_labels
        name        = var.deployment_spec_template_metadata_name
        namespace   = var.deployment_spec_template_metadata_namespace
      }
      spec {
        active_deadline_seconds          = var.deployment_spec_template_spec_active_deadline_seconds
        automount_service_account_token  = var.deployment_spec_template_spec_automount_service_account_token
        dns_policy                       = var.deployment_spec_template_spec_dns_policy
        enable_service_links             = var.deployment_spec_template_spec_enable_service_links
        host_ipc                         = var.deployment_spec_template_spec_host_ipc
        host_network                     = var.deployment_spec_template_spec_host_network
        host_pid                         = var.deployment_spec_template_spec_host_pid
        hostname                         = var.deployment_spec_template_spec_hostname
        node_name                        = var.deployment_spec_template_spec_node_name
        node_selector                    = var.deployment_spec_template_spec_node_selector
        priority_class_name              = var.deployment_spec_template_spec_priority_class_name
        restart_policy                   = var.deployment_spec_template_spec_restart_policy
        runtime_class_name               = var.deployment_spec_template_spec_runtime_class_name
        scheduler_name                   = var.deployment_spec_template_spec_scheduler_name
        service_account_name             = var.deployment_spec_template_spec_service_account_name
        share_process_namespace          = var.deployment_spec_template_spec_share_process_namespace
        subdomain                        = var.deployment_spec_template_spec_subdomain
        termination_grace_period_seconds = var.deployment_spec_template_spec_termination_grace_period_seconds
  
        affinity {
          node_affinity {
            dynamic "preferred_during_scheduling_ignored_during_execution" {
              for_each = var.deployment_spec_template_spec_affinity_node_affinity_preferred
                content {
                  weight  = preferred_during_scheduling_ignored_during_execution.value.weight
                  dynamic "preference" {
                    for_each = preferred_during_scheduling_ignored_during_execution.value.preference
                      content {
                        dynamic "match_expressions" {
                          for_each = preference.value.match_expressions
                            content {
                              key      = match_expressions.value["key"]
                              operator = match_expressions.value["operator"]
                              values   = match_expressions.value["values"]
                            }
                        }
                      }
                  }
                }
            }
            required_during_scheduling_ignored_during_execution {
              node_selector_term {
                dynamic "match_expressions" {
                  for_each = var.deployment_spec_template_spec_affinity_node_affinity_required_match_expressions
                    content {
                      key      = match_expressions.value["key"]
                      operator = match_expressions.value["operator"]
                      values   = match_expressions.value["values"]
                    }
                }
              } 
            }
          }
          pod_affinity {
            dynamic "preferred_during_scheduling_ignored_during_execution" {
              for_each = var.deployment_spec_template_spec_affinity_pod_affinity_preferred
                 content {
                   weight  = preferred_during_scheduling_ignored_during_execution.value["weight"]
                   dynamic "pod_affinity_term" {
                     for_each = preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term
                       content {
                         namespaces    = pod_affinity_term.value["namespaces"]      
                         topology_key  = pod_affinity_term.value["topology_key"]
                           dynamic "label_selector" {
                             for_each = pod_affinity_term.value.label_selector
                               content {
                                 match_labels = label_selector.value["match_labels"]
                                 dynamic "match_expressions" {
                                   for_each = label_selector.value.match_expressions
                                     content {
                                       key       = match_expressions.value["key"]
                                       operator  = match_expressions.value["operator"]
                                       values    = match_expressions.values["values"]
                                     }
                                 }
                               }
                           }
                       }
                   }
                 }
            }
            dynamic "required_during_scheduling_ignored_during_execution" {
              for_each = var.deployment_spec_template_spec_affinity_pod_affinity_required
                content {
                  namespaces   = required_during_scheduling_ignored_during_execution.value["namespaces"]
                  topology_key = required_during_scheduling_ignored_during_execution.value["topology_key"]
                  dynamic "label_selector" {
                    for_each = required_during_scheduling_ignored_during_execution.value.label_selector
                      content {
                        match_labels = label_selector.value["match_labels"]
                        dynamic "match_expressions" {
                          for_each = label_selector.value.match_expressions
                            content {
                              key      = match_expressions.value["key"]
                              operator = match_expressions.value["operator"]
                              values   = match_expressions.value["values"]
                            }
                        }
                      }
                  }  
                }
            } 
          }
          pod_anti_affinity {
            dynamic "preferred_during_scheduling_ignored_during_execution" {
              for_each = var.deployment_spec_template_spec_affinity_pod_anti_affinity_preferred
                content {
                  weight  = preferred_during_scheduling_ignored_during_execution.value["weight"]
                  dynamic "pod_affinity_term" {
                    for_each = preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term
                      content {
                        namespaces    = pod_affinity_term.value["namespaces"]
                        topology_key  = pod_affinity_term.value["topology_key"]
                          dynamic "label_selector" {
                            for_each = pod_affinity_term.value.label_selector
                              content {
                                match_labels = label_selector.value["match_labels"]
                                dynamic "match_expressions" {
                                  for_each = label_selector.value.match_expressions
                                    content {
                                      key       = match_expressions.value["key"]
                                      operator  = match_expressions.value["operator"]
                                      values    = match_expressions.value["values"]
                                    }
                                }
                              }
                          }
                      }
                  }
                }
            }
            dynamic "required_during_scheduling_ignored_during_execution" {
              for_each = var.deployment_spec_template_spec_affinity_pod_anti_affinity_required
                content {
                  topology_key = required_during_scheduling_ignored_during_execution.value["topology_key"]
                  namespaces   = required_during_scheduling_ignored_during_execution.value["namespaces"]
                  dynamic "label_selector" {
                    for_each = required_during_scheduling_ignored_during_execution.value.label_selector
                      content {
                        match_labels = label_selector.value["match_labels"]
                        dynamic "match_expressions" {
                          for_each = label_selector.value.match_expressions
                            content {
                              key       = match_expressions.value["key"]
                              operator  = match_expressions.value["operator"]
                              values    = match_expressions.value["values"]
                            }      
                        }
                      }
                  }
                }
            }
          }
        }
        dynamic "container" {
          for_each = var.deployment_spec_template_spec_container
            content {
              args                       = container.value["args"] 
              command                    = container.value["command"] 
              image                      = container.value["image"] 
              image_pull_policy          = container.value["image_pull_policy"] 
              name                       = container.value["name"] 
              stdin                      = container.value["stdin"] 
              stdin_once                 = container.value["stdin_once"] 
              termination_message_path   = container.value["termination_message_path"]
              termination_message_policy = container.value["termination_message_policy"]
              tty                        = container.value["tty"] 
              working_dir                = container.value["working_dir"] 
              dynamic "env" {
                for_each = container.value.env 
                  content {
                    name    = env.value["name"] 
                    value   = env.value["value"] 
                    dynamic "value_from" {
                      for_each = env.value.value_from 
                        content {
                          dynamic "config_map_key_ref" {
                            for_each = value_from.value.config_map_key_ref 
                              content {
                                key       = config_map_key_ref.value["key"] 
                                name      = config_map_key_ref.value["name"] 
                                optional  = config_map_key_ref.value["optional"] 
                              }
                          }
                          dynamic "field_ref" {
                            for_each = value_from.value.field_ref 
                              content {
                                api_version  = field_ref.value["api_version"] 
                                field_path   = field_ref.value["field_path"] 
                              }
                          }
                          dynamic "resource_field_ref" {
                            for_each = value_from.value.resource_field_ref 
                              content {
                                container_name = resource_field_ref.value["container_name"] 
                                resource       = resource_field_ref.value["resource"] 
                                divisor        = resource_field_ref.value["divisor"] 
                              }
                          }         
                          dynamic "secret_key_ref" {
                            for_each = value_from.value.secret_key_ref 
                              content {
                                key       = secret_key_ref.value["key"] 
                                name      = secret_key_ref.value["name"]
                                optional  = secret_key_ref.value["optional"] 
                              }
                          }
                        }
                     }
                  }
                }
                dynamic "env_from" {
                  for_each = container.value.env_from 
                    content {
                      prefix = env_from.value["prefix"] 
                      dynamic "config_map_ref" {
                        for_each = env_from.value.config_map_ref 
                          content {
                            name     = config_map_ref.value["name"] 
                            optional = config_map_ref.value["optional"] 
                          }
                      }
                      dynamic "secret_ref" {
                        for_each = env_from.value.secret_ref 
                          content {
                            name     = secret_ref.value["name"] 
                            optional = secret_ref.value["optional"] 
                          }
                      }
                    }
                  }
                  dynamic "lifecycle" {
                    for_each = container.value.lifecycle
                      content {
                        dynamic "post_start" {
                          for_each = lifecycle.value.post_start
                            content {
                              dynamic "exec" {
                                for_each = post_start.value.exec
                                  content {
                                     command = exec.value["command"]
                                  }
                               }
                               dynamic "http_get" {
                                 for_each = post_start.value.http_get
                                   content {
                                     port   = http_get.value["port"]
                                     host   = http_get.value["host"]
                                     path   = http_get.value["path"]
                                     scheme = http_get.value["scheme"]
                                     dynamic "http_header" {
                                       for_each = http_get.value.http_header
                                         content {
                                           name   = http_header.value["name"]
                                           value  = http_header.value["value"]
                                         }
                                     }
                                   }
                               }
                               dynamic "tcp_socket" {
                                 for_each = post_start.value.tcp_socket
                                   content {
                                     port = tcp_socket.value["port"]
                                   }
                               }
                            }
                        } 
                        dynamic "pre_stop" {
                          for_each = lifecycle.value.pre_stop
                            content {
                              dynamic "exec" {
                                for_each = pre_stop.value.exec
                                  content {
                                    command = exec.value["command"] 
                                  }
                              }
                              dynamic "http_get" {
                                for_each = pre_stop.value.http_get
                                  content {
                                    port   = http_get.value["port"]
                                    host   = http_get.value["host"]
                                    path   = http_get.value["path"]
                                    scheme = http_get.value["scheme"]
                                    dynamic "http_header" {
                                      for_each = http_get.value.http_header
                                        content {
                                          name   = http_header.value["name"]
                                          value  = http_header.value["value"]
                                        }
                                    }
                                  }
                              } 
                              dynamic "tcp_socket" {
                                for_each = pre_stop.value.tcp_socket
                                  content {
                                    port = tcp_socket.value["port"]
                                  } 
                              }
                          }
                        }
                      }
                  }
                  dynamic "liveness_probe" {
                    for_each = container.value.liveness_probe 
                      content {
                        failure_threshold                = liveness_probe.value["failure_threshold"] 
                        initial_delay_seconds            = liveness_probe.value["initial_delay_seconds"] 
                        period_seconds                   = liveness_probe.value["period_seconds"] 
                        success_threshold                = liveness_probe.value["success_threshold"] 
                        dynamic "exec" {
                          for_each  = liveness_probe.value.exec 
                            content {
                              command = exec.value["command"] 
                            }
                         }
                         dynamic "grpc" {
                           for_each = liveness_probe.value.grpc 
                             content {
                               port    = grpc.value["port"] 
                               service = grpc.value["service"] 
                             }
                         }
                         dynamic "http_get" {
                           for_each  = liveness_probe.value.http_get 
                             content {
                               port   = http_get.value["port"] 
                               host   = http_get.value["host"] 
                               path   = http_get.value["path"] 
                               scheme = http_get.value["path"] 
                               dynamic "http_header" {
                                 for_each = http_get.value.http_header 
                                   content {
                                     name  = http_header.value["name"] 
                                     value = http_header.value["value"]
                                   }
                               }
                             }
                         }
                         dynamic "tcp_socket" {
                           for_each   = liveness_probe.value.tcp_socket 
                             content {
                               port = tcp_socket.value["port"] 
                             }
                         }
                         dynamic "grpc" {
                           for_each = liveness_probe.value.grpc
                             content {
                               port    = grpc.value["port"]
                               service = grpc.value["service"]
                             }
                         } 
                      }
                  }
                  dynamic "readiness_probe" {
                    for_each = container.value.readiness_probe 
                      content {
                        failure_threshold                = readiness_probe.value["failure_threshold"]
                        initial_delay_seconds            = readiness_probe.value["initial_delay_seconds"]
                        period_seconds                   = readiness_probe.value["period_seconds"]
                        timeout_seconds                  = readiness_probe.value["timeout_seconds"] 
                        success_threshold                = readiness_probe.value["success_threshold"] 
                        dynamic "exec"  {
                          for_each  = readiness_probe.value.exec 
                            content {
                              command  = exec.value["command"] 
                            }
                        }
                        dynamic "grpc" {
                          for_each  = readiness_probe.value.grpc 
                            content {
                              port    = grpc.value["port"] 
                              service = grpc.value["service"] 
                            }
                        }
                        dynamic "http_get" {
                          for_each = readiness_probe.value.http_get 
                            content {
                              port   = http_get.value["port"] 
                              host   = http_get.value["host"] 
                              path   = http_get.value["path"] 
                              scheme = http_get.value["scheme"] 
                              dynamic "http_header" {
                                for_each = http_get.value.http_header 
                                  content {
                                    name  = http_header.value["name"]
                                    value = http_header.value["value"]
                                  }
                              }
                            }
                        }  
                        dynamic "tcp_socket" {
                          for_each = readiness_probe.value.tcp_socket 
                            content {
                              port = tcp_socket.value["port"] 
                            }
                        }
                      }
                  }
                  dynamic "resources" {
                    for_each = container.value.resources
                      content {
                        limits   = resources.value["limits"]
                        requests = resources.value["requests"]
                      }
                  }
                  dynamic "security_context" {
                    for_each = container.value.security_context
                      content {
                        allow_privilege_escalation = security_context.value["allow_privilege_escalation"]
                        privileged                 = security_context.value["privileged"]
                        read_only_root_filesystem  = security_context.value["read_only_root_filesystem"]
                        run_as_group               = security_context.value["run_as_group"]
                        run_as_non_root            = security_context.value["run_as_non_root"]
                        run_as_user                = security_context.value["run_as_user"]
                        dynamic "capabilities" {
                          for_each = security_context.value.capabilities
                            content {
                              add  = capabilities.value["add"]
                              drop = capabilities.value["drop"]
                            }
                        }
                        dynamic "seccomp_profile" {
                          for_each = security_context.value.seccomp_profile
                            content {
                              localhost_profile = seccomp_profile.value["localhost_profile"]
                              type              = seccomp_profile.value["type"]
                            }
                        }
                        dynamic "se_linux_options" {
                          for_each = security_context.value.se_linux_options
                            content {
                              level = se_linux_options.value["level"]
                              role  = se_linux_options.value["role"]
                              type  = se_linux_options.value["type"]
                              user  = se_linux_options.value["user"]
                            }
                        }
                      }
                  }
                  dynamic "startup_probe" {
                    for_each = container.value.startup_probe 
                      content {
                        failure_threshold                = startup_probe.value["failure_threshold"] 
                        initial_delay_seconds            = startup_probe.value["initial_delay_seconds"] 
                        period_seconds                   = startup_probe.value["period_seconds"] 
                        timeout_seconds                  = startup_probe.value["timeout_seconds"] 
                        success_threshold                = startup_probe.value["success_threshold"] 
                          dynamic "exec"  {
                            for_each  = startup_probe.value.exec 
                              content {
                                command  = exec.value["command"] 
                              }
                          }
                          dynamic "grpc" {
                            for_each  = startup_probe.value.grpc 
                              content {
                                port    = grpc.value["port"] 
                                service = grpc.value["service"] 
                              }
                          }
                          dynamic "http_get" {
                            for_each = startup_probe.value.http_get 
                              content {
                                port   = http_get.value["port"]
                                host   = http_get.value["host"] 
                                path   = http_get.value["path"]
                                scheme = http_get.value["scheme"] 
                                dynamic "http_header" {
                                  for_each = http_get.value.http_header 
                                    content {
                                      name  = http_header.value["name"] 
                                      value = http_header.value["value"] 
                                    }
                                }
                              }
                          }
                          dynamic "tcp_socket" {
                            for_each = startup_probe.value.tcp_socket 
                              content {
                                port = tcp_socket.value["port"] 
                              }
                          }
                        }
                    }
                    dynamic "port" {
                      for_each = container.value.port 
                        content {
                          container_port = port.value["container_port"] 
                          host_ip        = port.value["host_ip"] 
                          host_port      = port.value["host_port"] 
                          name           = port.value["name"] 
                          protocol       = port.value["protocol"] 
                        }
                    }
                    dynamic "volume_mount" {
                      for_each = container.value.volume_mount 
                        content {
                          mount_path        = volume_mount.value["mount_path"] 
                          name              = volume_mount.value["name"] 
                          read_only         = volume_mount.value["read_only"] 
                          sub_path          = volume_mount.value["sub_path"] 
                          mount_propagation = volume_mount.value["mount_propagation"] 
                        }
                    }
            }
        }
        dynamic "readiness_gate" {
          for_each = var.deployment_spec_template_spec_readiness_gate
            content {
              condition_type = readiness_gate.value["condition_type"]
            }
        }
        dynamic "init_container" {
          for_each = var.deployment_spec_template_spec_init_container
            content {
              args                       = init_container.value["args"] 
              command                    = init_container.value["command"] 
              image                      = init_container.value["image"] 
              image_pull_policy          = init_container.value["image_pull_policy"] 
              name                       = init_container.value["name"] 
              stdin                      = init_container.value["stdin"] 
              stdin_once                 = init_container.value["stdin_once"] 
              termination_message_path   = init_container.value["termination_message_path"]
              termination_message_policy = init_container.value["termination_message_policy"]
              tty                        = init_container.value["tty"] 
              working_dir                = init_container.value["working_dir"] 
              dynamic "env" {
                for_each = init_container.value.env 
                  content {
                    name    = env.value["name"] 
                    value   = env.value["value"] 
                    dynamic "value_from" {
                      for_each = env.value.value_from 
                        content {
                          dynamic "config_map_key_ref" {
                            for_each = value_from.value.config_map_key_ref 
                              content {
                                key       = config_map_key_ref.value["key"] 
                                name      = config_map_key_ref.value["name"] 
                                optional  = config_map_key_ref.value["optional"] 
                              }
                          }
                          dynamic "field_ref" {
                            for_each = value_from.value.field_ref 
                              content {
                                api_version  = field_ref.value["api_version"] 
                                field_path   = field_ref.value["field_path"] 
                              }
                          }
                          dynamic "resource_field_ref" {
                            for_each = value_from.value.resource_field_ref 
                              content {
                                container_name = resource_field_ref.value["container_name"] 
                                resource       = resource_field_ref.value["resource"] 
                                divisor        = resource_field_ref.value["divisor"] 
                              }
                          }         
                          dynamic "secret_key_ref" {
                            for_each = value_from.value.secret_key_ref 
                              content {
                                key       = secret_key_ref.value["key"] 
                                name      = secret_key_ref.value["name"]
                                optional  = secret_key_ref.value["optional"] 
                              }
                          }
                        }
                     }
                  }
                }
                dynamic "env_from" {
                  for_each = init_container.value.env_from 
                    content {
                      prefix = env_from.value["prefix"] 
                      dynamic "config_map_ref" {
                        for_each = env_from.value.config_map_ref 
                          content {
                            name     = config_map_ref.value["name"] 
                            optional = config_map_ref.value["optional"] 
                          }
                      }
                      dynamic "secret_ref" {
                        for_each = env_from.value.secret_ref 
                          content {
                            name     = secret_ref.value["name"] 
                            optional = secret_ref.value["optional"] 
                          }
                      }
                    }
                  }
                  dynamic "lifecycle" {
                    for_each = init_container.value.lifecycle
                      content {
                        dynamic "post_start" {
                          for_each = lifecycle.value.post_start
                            content {
                              dynamic "exec" {
                                for_each = post_start.value.exec
                                  content {
                                     command = exec.value["command"]
                                  }
                               }
                               dynamic "http_get" {
                                 for_each = post_start.value.http_get
                                   content {
                                     port   = http_get.value["port"]
                                     host   = http_get.value["host"]
                                     path   = http_get.value["path"]
                                     scheme = http_get.value["scheme"]
                                     dynamic "http_header" {
                                       for_each = http_get.value.http_header
                                         content {
                                           name   = http_header.value["name"]
                                           value  = http_header.value["value"]
                                         }
                                     }
                                   }
                               }
                               dynamic "tcp_socket" {
                                 for_each = post_start.value.tcp_socket
                                   content {
                                     port = tcp_socket.value["port"]
                                   }
                               }
                            }
                        } 
                        dynamic "pre_stop" {
                          for_each = lifecycle.value.pre_stop
                            content {
                              dynamic "exec" {
                                for_each = pre_stop.value.exec
                                  content {
                                    command = exec.value["command"] 
                                  }
                              }
                              dynamic "http_get" {
                                for_each = pre_stop.value.http_get
                                  content {
                                    port   = http_get.value["port"]
                                    host   = http_get.value["host"]
                                    path   = http_get.value["path"]
                                    scheme = http_get.value["scheme"]
                                    dynamic "http_header" {
                                      for_each = http_get.value.http_header
                                        content {
                                          name   = http_header.value["name"]
                                          value  = http_header.value["value"]
                                        }
                                    }
                                  }
                              } 
                              dynamic "tcp_socket" {
                                for_each = pre_stop.value.tcp_socket
                                  content {
                                    port = tcp_socket.value["port"]
                                  } 
                              }
                          }
                        }
                      }
                  }
                  dynamic "liveness_probe" {
                    for_each = init_container.value.liveness_probe 
                      content {
                        failure_threshold                = liveness_probe.value["failure_threshold"] 
                        initial_delay_seconds            = liveness_probe.value["initial_delay_seconds"] 
                        period_seconds                   = liveness_probe.value["period_seconds"] 
                        success_threshold                = liveness_probe.value["success_threshold"] 
                        dynamic "exec" {
                          for_each  = liveness_probe.value.exec 
                            content {
                              command = exec.value["command"] 
                            }
                         }
                         dynamic "grpc" {
                           for_each = liveness_probe.value.grpc 
                             content {
                               port    = grpc.value["port"] 
                               service = grpc.value["service"] 
                             }
                         }
                         dynamic "http_get" {
                           for_each  = liveness_probe.value.http_get 
                             content {
                               port   = http_get.value["port"] 
                               host   = http_get.value["host"] 
                               path   = http_get.value["path"] 
                               scheme = http_get.value["path"] 
                               dynamic "http_header" {
                                 for_each = http_get.value.http_header 
                                   content {
                                     name  = http_header.value["name"] 
                                     value = http_header.value["value"]
                                   }
                               }
                             }
                         }
                         dynamic "tcp_socket" {
                           for_each   = liveness_probe.value.tcp_socket 
                             content {
                               port = tcp_socket.value["port"] 
                             }
                         }
                         dynamic "grpc" {
                           for_each = liveness_probe.value.grpc
                             content {
                               port    = grpc.value["port"]
                               service = grpc.value["service"]
                             }
                         } 
                      }
                  }
                  dynamic "readiness_probe" {
                    for_each = init_container.value.readiness_probe 
                      content {
                        failure_threshold                = readiness_probe.value["failure_threshold"]
                        initial_delay_seconds            = readiness_probe.value["initial_delay_seconds"]
                        period_seconds                   = readiness_probe.value["period_seconds"]
                        timeout_seconds                  = readiness_probe.value["timeout_seconds"] 
                        success_threshold                = readiness_probe.value["success_threshold"] 
                        dynamic "exec"  {
                          for_each  = readiness_probe.value.exec 
                            content {
                              command  = exec.value["command"] 
                            }
                        }
                        dynamic "grpc" {
                          for_each  = readiness_probe.value.grpc 
                            content {
                              port    = grpc.value["port"] 
                              service = grpc.value["service"] 
                            }
                        }
                        dynamic "http_get" {
                          for_each = readiness_probe.value.http_get 
                            content {
                              port   = http_get.value["port"] 
                              host   = http_get.value["host"] 
                              path   = http_get.value["path"] 
                              scheme = http_get.value["scheme"] 
                              dynamic "http_header" {
                                for_each = http_get.value.http_header 
                                  content {
                                    name  = http_header.value["name"]
                                    value = http_header.value["value"]
                                  }
                              }
                            }
                        }  
                        dynamic "tcp_socket" {
                          for_each = readiness_probe.value.tcp_socket 
                            content {
                              port = tcp_socket.value["port"] 
                            }
                        }
                      }
                  }
                  dynamic "resources" {
                    for_each = init_container.value.resources
                      content {
                        limits   = resources.value["limits"]
                        requests = resources.value["requests"]
                      }
                  }
                  dynamic "security_context" {
                    for_each = init_container.value.security_context
                      content {
                        allow_privilege_escalation = security_context.value["allow_privilege_escalation"]
                        privileged                 = security_context.value["privileged"]
                        read_only_root_filesystem  = security_context.value["read_only_root_filesystem"]
                        run_as_group               = security_context.value["run_as_group"]
                        run_as_non_root            = security_context.value["run_as_non_root"]
                        run_as_user                = security_context.value["run_as_user"]
                        dynamic "capabilities" {
                          for_each = security_context.value.capabilities
                            content {
                              add  = capabilities.value["add"]
                              drop = capabilities.value["drop"]
                            }
                        }
                        dynamic "seccomp_profile" {
                          for_each = security_context.value.seccomp_profile
                            content {
                              localhost_profile = seccomp_profile.value["localhost_profile"]
                              type              = seccomp_profile.value["type"]
                            }
                        }
                        dynamic "se_linux_options" {
                          for_each = security_context.value.se_linux_options
                            content {
                              level = se_linux_options.value["level"]
                              role  = se_linux_options.value["role"]
                              type  = se_linux_options.value["type"]
                              user  = se_linux_options.value["user"]
                            }
                        }
                      }
                  }
                  dynamic "startup_probe" {
                    for_each = init_container.value.startup_probe 
                      content {
                        failure_threshold                = startup_probe.value["failure_threshold"] 
                        initial_delay_seconds            = startup_probe.value["initial_delay_seconds"] 
                        period_seconds                   = startup_probe.value["period_seconds"] 
                        timeout_seconds                  = startup_probe.value["timeout_seconds"] 
                        success_threshold                = startup_probe.value["success_threshold"] 
                          dynamic "exec"  {
                            for_each  = startup_probe.value.exec 
                              content {
                                command  = exec.value["command"] 
                              }
                          }
                          dynamic "grpc" {
                            for_each  = startup_probe.value.grpc 
                              content {
                                port    = grpc.value["port"] 
                                service = grpc.value["service"] 
                              }
                          }
                          dynamic "http_get" {
                            for_each = startup_probe.value.http_get 
                              content {
                                port   = http_get.value["port"]
                                host   = http_get.value["host"] 
                                path   = http_get.value["path"]
                                scheme = http_get.value["scheme"] 
                                dynamic "http_header" {
                                  for_each = http_get.value.http_header 
                                    content {
                                      name  = http_header.value["name"] 
                                      value = http_header.value["value"] 
                                    }
                                }
                              }
                          }
                          dynamic "tcp_socket" {
                            for_each = startup_probe.value.tcp_socket 
                              content {
                                port = tcp_socket.value["port"] 
                              }
                          }
                        }
                    }
                    dynamic "port" {
                      for_each = init_container.value.port 
                        content {
                          container_port = port.value["container_port"] 
                          host_ip        = port.value["host_ip"] 
                          host_port      = port.value["host_port"] 
                          name           = port.value["name"] 
                          protocol       = port.value["protocol"] 
                        }
                    }
                    dynamic "volume_mount" {
                      for_each = init_container.value.volume_mount 
                        content {
                          mount_path        = volume_mount.value["mount_path"] 
                          name              = volume_mount.value["name"] 
                          read_only         = volume_mount.value["read_only"] 
                          sub_path          = volume_mount.value["sub_path"] 
                          mount_propagation = volume_mount.value["mount_propagation"] 
                        }
                    }
              }
        }
        dynamic "dns_config" {
          for_each = var.deployment_spec_template_spec_dns_config
            content {
              nameservers = dns_config.value["nameservers"]
              searches    = dns_config.value["searches"]
              dynamic "option" {
                for_each = dns_config.value.option
                   content {
                     name  = option.value["name"]
                     value = option.value["value"]
                   }
              }  
            }
        }
        dynamic "host_aliases" {
          for_each = var.deployment_spec_template_spec_host_aliases
            content {
              hostnames  = host_aliases.value["hostnames"]
              ip         = host_aliases.value["ip"]
            }
        }
        dynamic "image_pull_secrets" {
          for_each = var.deployment_spec_template_spec_image_pull_secrets
            content {
              name    = image_pull_secrets.value["name"]
            }
        }
        dynamic "security_context" {
          for_each = var.deployment_spec_template_spec_security_context
            content {
              fs_group               = security_context.value["fs_group"]
              run_as_group           = security_context.value["run_as_group"]
              run_as_non_root        = security_context.value["run_as_non_root"]
              run_as_user            = security_context.value["run_as_user"]
              fs_group_change_policy = security_context.value["fs_group_change_policy"]
              supplemental_groups    = security_context.value["supplemental_groups"]
              dynamic "seccomp_profile" {
                for_each = security_context.value.seccomp_profile
                  content {
                    localhost_profile = seccomp_profile.value["localhost_profile"]
                    type              = seccomp_profile.value["type"]
                  }
              }
              dynamic "se_linux_options" {
                for_each = security_context.value.se_linux_options
                  content {
                    level = se_linux_options.value["level"]
                    role  = se_linux_options.value["role"]
                    type  = se_linux_options.value["type"]
                    user  = se_linux_options.value["user"]
                  }
              }
              dynamic "sysctl" {
                for_each = security_context.value.sysctl
                  content {
                    name  = sysctl.value["name"]
                    value = sysctl.value["value"]
                  }
              }
            }
        }
        dynamic "toleration" {
          for_each = var.deployment_spec_template_spec_toleration
            content {
              effect             = toleration.value["effect"]
              key                = toleration.value["key"]
              operator           = toleration.value["operator"]
              toleration_seconds = toleration.value["toleration_seconds"]
              value              = toleration.value["value"]
            }
        }
        dynamic "topology_spread_constraint" {
          for_each = var.deployment_spec_template_spec_topology_spread_constraint
            content {
              max_skew           = topology_spread_constraint.value["max_skew"]
              topology_key       = topology_spread_constraint.value["topology_key"]
              when_unsatisfiable = topology_spread_constraint.value["when_unsatisfiable"]
              dynamic "label_selector" {
                for_each = topology_spread_constraint.value.label_selector
                  content {
                    match_labels = label_selector.value["match_labels"]
                    dynamic "match_expressions" {
                      for_each = label_selector.value.match_expressions
                        content {
                          key      = match_expressions.value["key"]
                          operator = match_expressions.value["operator"]
                          values   = match_expressions.value["values"]
                        }
                    }
                }
            }
          }
        }
        dynamic "volume" {
          for_each = var.deployment_spec_template_spec_volume
            content {
              name  = volume.value["name"]
              dynamic "config_map" {
                for_each = volume.value.config_map
                  content {
                    default_mode = config_map.value["default_mode"]
                      optional     = config_map.value["optional"]
                      name         = config_map.value["name"]
                      dynamic "items" {
                        for_each = config_map.value.items
                          content {
                            key    = items.value["key"]
                            mode   = items.value["mode"]
                            path   = items.value["path"]
                          }
                      }
                  }
              }
              dynamic "csi" {
                for_each = volume.value.csi
                  content {
                    driver            = csi.value["driver"]
                    fs_type           = csi.value["fs_type"]
                    read_only         = csi.value["read_only"]
                    volume_attributes = csi.value["volume_attributes"]
                    dynamic "node_publish_secret_ref" {
                      for_each = csi.value.node_publish_secret_ref
                        content {
                          name  = node_publish_secret_ref.value["name"]
                        }
                    }
                  }
              }
              dynamic "host_path" {
                for_each = volume.value.host_path
                  content {
                    path = host_path.value["path"]
                    type = host_path.value["type"]
                  }
              }
              dynamic "local" {
                for_each = volume.value.local
                  content {
                    path = local.value["path"]
                  }
              }
              dynamic "aws_elastic_block_store" {
                for_each = volume.value.aws_elastic_block_store
                  content {
                    fs_type   = aws_elastic_block_store.value["fs_type"]
                    partition = aws_elastic_block_store.value["partition"]
                    read_only = aws_elastic_block_store.value["read_only"]
                    volume_id = aws_elastic_block_store.value["volume_id"]
                  }
              }
              dynamic "azure_disk" {
                for_each = volume.value.azure_disk
                  content {
                    caching_mode  = azure_disk.value["caching_mode"]
                    data_disk_uri = azure_disk.value["data_disk_uri"]
                    disk_name     = azure_disk.value["disk_name"]
                    fs_type       = azure_disk.value["fs_type"]
                    kind          = azure_disk.value["kind"]
                    read_only     = azure_disk.value["read_only"]
                  }
              }
              dynamic "azure_file" {
                for_each = volume.value.azure_file
                  content {
                    read_only        = azure_file.value["read_only"]
                    secret_name      = azure_file.value["secret_name"]
                    secret_namespace = azure_file.value["secret_namespace"]
                    share_name       = azure_file.value["share_name"]
                  }
              }
              dynamic "fc" {
                for_each = volume.value.fc
                  content {
                    fs_type      = fc.value["fs_type"]
                    lun          = fc.value["lun"]
                    read_only    = fc.value["read_only"]
                    target_ww_ns = fc.value["target_ww_ns"]
                  }
              }
              dynamic "gce_persistent_disk" {
                for_each = volume.value.gce_persistent_disk
                  content {
                    fs_type   = gce_persistent_disk.value["fs_type"]
                    partition = gce_persistent_disk.value["partition"]
                    pd_name   = gce_persistent_disk.value["pd_name"]
                    read_only = gce_persistent_disk.value["read_only"]
                  }
              }
              dynamic "iscsi" {
                for_each = volume.value.iscsi
                  content {
                    fs_type         = iscsi.value["fs_type"]
                    iqn             = iscsi.value["iqn"]
                    iscsi_interface = iscsi.value["iscsi_interface"]
                    lun             = iscsi.value["lun"]
                    read_only       = iscsi.value["read_only"]
                    target_portal   = iscsi.value["target_portal"]
                  }
              }
              dynamic "nfs" {
                for_each = volume.value.nfs
                  content {
                    path      = nfs.value["path"]
                    read_only = nfs.value["read_only"]
                    server    = nfs.value["server"]
                  }
              }
              dynamic "downward_api" {
                for_each = volume.value.downward_api
                  content {
                    default_mode = downward_api.value["default_mode"]
                    dynamic "items" {
                      for_each = downward_api.value.items
                        content {
                          mode = items.value["mode"]
                          path = items.value["path"]
                          dynamic "field_ref" {
                            for_each = items.value.field_ref
                              content {
                                api_version = field_ref.value["api_version"]
                                field_path  = field_ref.value["field_path"]
                              }
                          }
                          dynamic "resource_field_ref" {
                            for_each = items.value.resource_field_ref
                              content {
                                container_name = resource_field_ref.value["container_name"]
                                divisor        = resource_field_ref.value["divisor"]
                                resource       = resource_field_ref.value["resource"]
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "empty_dir" {
                for_each = volume.value.empty_dir
                  content {
                    medium     = empty_dir.value["medium"]
                    size_limit = empty_dir.value["size_limit"]
                  }
              }
              dynamic "persistent_volume_claim" {
                for_each = volume.value.persistent_volume_claim
                  content {
                    claim_name = persistent_volume_claim.value["claim_name"]
                    read_only  = persistent_volume_claim.value["read_only"]
                  }
              }
              dynamic "secret" {
                for_each = volume.value.secret
                  content {
                    default_mode   = secret.value["default_mode"]
                    optional       = secret.value["optional"]
                    secret_name    = secret.value["secret_name"]
                    dynamic "items" {
                      for_each = secret.value.items
                        content {
                          key   = items.value["key"]
                          mode  = items.value["mode"]
                          path  = items.value["path"]
                        }
                    }
                 }
              }
              dynamic "projected" {
                for_each = volume.value.projected
                  content {
                    default_mode   = projected.value["default_mode"]
                    dynamic "sources" {
                      for_each = projected.value.sources
                        content {
                          dynamic "config_map" {
                            for_each = sources.value.config_map
                              content  {
                                name     = config_map.value["name"]
                                optional = config_map.value["optional"]
                                dynamic "items"  {
                                  for_each = config_map.value.items
                                    content {
                                      key  = items.value["key"]
                                      path = items.value["path"]
                                      mode = items.value["mode"]
                                    }
                                }
                              }
                          }
                          dynamic "downward_api" {
                             for_each = sources.value.downward_api
                               content {
                                 dynamic "items" {
                                   for_each = downward_api.value.items
                                     content {
                                       path   = items.value["path"]
                                       mode   = items.value["mode"]
                                       dynamic "field_ref" {
                                         for_each = items.value["field_ref"]
                                           content {
                                             field_path  = field_ref.value["field_path"]
                                             api_version = field_ref.value["api_version"]
                                           }
                                       }
                                       dynamic "resource_field_ref" {
                                         for_each = items.value.resource_field_ref
                                           content {
                                             resource       = resource_field_ref.value["resource"]
                                             container_name = resource_field_ref.value["container_name"]
                                             divisor        = resource_field_ref.value["divisor"]
                                           }
                                       }
                                     }
                                 }
                               }
                          }
                          dynamic "secret" {
                            for_each = sources.value.secret
                              content {
                                name     = secret.value["name"]
                                optional = secret.value["optional"]
                                dynamic "items" {
                                  for_each = secret.value.items
                                    content {
                                      key   = items.value["key"]
                                      path  = items.value["path"]
                                      mode  = items.value["mode"]
                                    }
                                }
                              }
                          }  
                          dynamic "service_account_token" {
                            for_each = sources.value.service_account_token
                              content {
                                path               = service_account_token.value["path"]
                                audience           = service_account_token.value[audience]
                                expiration_seconds = service_account_token.value["expiration_seconds"]
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

