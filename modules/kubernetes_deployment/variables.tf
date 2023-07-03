variable "deployment_metadata_annotations" {
  description = "An unstructured key value map stored with the Deployment that may be used to store arbitrary metadata"
  type        = map(string)
  default     = {}
}
variable "deployment_metadata_labels" {
  description = "Map of string keys and values that can be used to organize and categorize (scope and select) the Deployment"
  type        = map(string)
  default     = {}
}
variable "deployment_metadata_name" {
  description = "Name of the Deployment, must be unique. Cannot be updated"
  type        = string
  default     = ""
}
variable "deployment_metadata_namespace" {
  description = "Namespace defines the space within which name of the Deployment must be unique"
  type        = string
  default     = ""
}
variable "deployment_wait_for_rollout" {
  description = "Wait for the deployment to successfully roll out"
  type        = bool
  default     = true
}
variable "deployment_spec_min_ready_seconds" {
  description = "Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available"
  type        = number
  default     = null
}
variable "deployment_spec_paused" {
  description = "Indicates that the deployment is paused"
  type        = bool
  default     = false
}
variable "deployment_spec_progress_deadline_seconds" {
  description = "The maximum time in seconds for a deployment to make progress before it is considered to be failed"
  type        = number
  default     = null
}
variable "deployment_spec_replicas" {
  description = "The number of desired replicas"
  type        = number
  default     = 1
}
variable "deployment_spec_revision_history_limit" {
  description = "The number of old ReplicaSets to retain to allow rollback"
  type        = number 
  default     = 10
}
variable "deployment_spec_strategy" {
  description = "The deployment strategy to use to replace existing pods with new ones"
  type        = map(object({
    type            = string
    rolling_update  = map(object({
      max_surge       = string
      max_unavailable = string
    }))
  }))
  default = {}
}
variable "deployment_spec_selector" {
  description = "Label selector for pods. Existing ReplicaSets whose pods are selected by this will be the ones affected by this deployment. It must match the pod template's labels"
  type        = map(object({
    match_labels      = map(string)
    match_expressions = optional(list(object({
      key          = string
      operator     = string
      values       = list(string)
    })))
  }))
  default = {}
}
variable "deployment_spec_template_metadata_annotations" {
  description = "An unstructured key value map stored with the deployment that may be used to store arbitrary metadata"
  type        = map(string)
  default     = {}
}
variable "deployment_spec_template_metadata_labels" {
  description = "Map of string keys and values that can be used to organize and categorize (scope and select) the pod"
  type        = map(string)
  default     = {}
}
variable "deployment_spec_template_metadata_name" {
  description = "Name of the pod, must be unique. Cannot be updated"
  type        = string
  default     = ""
}
variable "deployment_spec_template_metadata_namespace" {
  description = "Namepace of the pod, must be unique. Cannot be updated"
  type        = string
  default     = ""
}
variable "deployment_spec_template_spec_active_deadline_seconds" {
  description = "Optional duration in seconds the pod may be active on the node relative to StartTime before the system will actively try to mark it failed and kill associated containers"
  type         = number
  default      = null
}
variable "deployment_spec_template_spec_automount_service_account_token" {
  description = "Indicates whether a service account token should be automatically mounted"
  type        = bool
  default     = false
}
variable "deployment_spec_template_spec_enable_service_links" {
  description = "Enables generating environment variables for service discovery"
  type        = bool
  default     = true
}
variable "deployment_spec_template_spec_host_ipc" {
  description = "Use the host's ipc namespace. Optional: Defaults to false"
  type        = bool
  default     = false
}
variable "deployment_spec_template_spec_host_network" {
  description = "Host networking requested for this pod. Use the host's network namespace. If this option is set, the ports that will be used must be specified"
  type        = bool
  default     = false
}
variable "deployment_spec_template_spec_host_pid" {
  description = "Use the host's pid namespace"
  type        = bool
  default     = false
}
variable "deployment_spec_template_spec_hostname" {
  description = "Specifies the hostname of the Pod If not specified"
  type       = string
  default    = ""
}
variable "deployment_spec_template_spec_node_name" {
  description = "NodeName is a request to schedule this pod onto a specific node"
  type       = string
  default    = ""
}
variable "deployment_spec_template_spec_node_selector" {
  description = "NodeSelector is a selector which must be true for the pod to fit on a node. Selector which must match a node's labels for the pod to be scheduled on that node"
  type       = map(string)
  default    = {}
}
variable "deployment_spec_template_spec_priority_class_name" {
  description = "If specified, indicates the pod's priority"
  type        = string
  default     = ""
}
variable "deployment_spec_template_spec_restart_policy" {
  description = "Restart policy for all containers within the pod. One of Always, OnFailure, Never"
  type        = string
  default     = ""
}
variable "deployment_spec_template_spec_runtime_class_name" {
  description = "RuntimeClassName is a feature for selecting the container runtime configuration"
  type        = string
  default     = ""
}
variable "deployment_spec_template_spec_scheduler_name" {
  description = "If specified, the pod will be dispatched by specified scheduler. If not specified, the pod will be dispatched by default scheduler"
  type        = string
  default     = ""
}
variable "deployment_spec_template_spec_service_account_name" {
  description = "ServiceAccountName is the name of the ServiceAccount to use to run this pod"
  type        = string
  default     = ""
}
variable "deployment_spec_template_spec_share_process_namespace" {
  description = "Share a single process namespace between all of the containers in a pod. When this is set containers will be able to view and signal processes from other containers in the same pod, and the first process in each container will not be assigned PID 1. HostPID and ShareProcessNamespace cannot both be set. Optional: Defaults to false"
  type        = bool
  default     = false
}
variable "deployment_spec_template_spec_subdomain" {
  description = "If specified, the fully qualified Pod hostname will be \"<hostname>.<subdomain>.<pod namespace>.svc.<cluster domain>\""
  type        = string
  default     = ""
}
variable "deployment_spec_template_spec_termination_grace_period_seconds" {
  description = "Optional duration in seconds the pod needs to terminate gracefully upon probe failure"
  type        = number
  default     = null
}
variable "deployment_spec_template_spec_affinity_node_affinity_preferred" {
  description = "The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field"
  type        = list(object({
    weight     = number
    preference = object({
      match_expressions = list(object({
        key      = string
        operator = string
        values   = optional(list(string))
      }))
    })
  }))  
  default = []
}
variable "deployment_spec_template_spec_affinity_node_affinity_required_match_expressions" {
  description = "A list of node selector requirements by node's labels"
  type        = list(object({
    key       = string
    operator  = string
    values    = optional(list(string))
  }))
  default  = []
}
variable "deployment_spec_template_spec_affinity_pod_affinity_preferred" {
  description = "The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field"
  type        = list(object({
    weight            = number
    pod_affinity_term = object({
        namespaces    = optional(list(string))
        topology_key  = string
        label_selector = object({
          match_labels = map(string)
          match_expressions = list(object({
            key       = string
            operator  = string
            values    = optional(list(string))
          }))
        })
    })
  }))
  default = []
}
variable "deployment_spec_template_spec_affinity_pod_affinity_required" {
  description = "The pod will be scheduled onto the node If the affinity requirements specified by this field are met at scheduling time"
  type        = list(object({
    namespaces    = optional(list(string))
    topology_key  = string
    label_selector = object({
      match_labels      = map(string)
      match_expressions = list(object({
        key      = string
        operator = string
        values   = optional(list(string))
      }))
    })
  }))
  default  = []
}
variable "deployment_spec_template_spec_affinity_pod_anti_affinity_preferred" {
  description = "The scheduler will prefer to schedule pods to nodes that satisfy the anti-affinity expressions specified by this field"
  type        = list(object({
    weight             = number
    pod_affinity_term  = object({
      namespaces   = optional(list(string))
      topology_key = string
      label_selector = object({
        match_labels      = map(string)
        match_expressions = list(object({
          key      = string
          operator = string
          values   = optional(list(string))
        }))
      })
    })
  }))
  default = []
}
variable "deployment_spec_template_spec_affinity_pod_anti_affinity_required" {
  description = "The pod will be scheduled onto the node, If the anti-affinity requirements specified by this field are met at scheduling time"
  type        = list(object({
    namespaces    = optional(list(string))
    topology_key  = string
    label_selector = optional(object({
      match_labels      = map(string)
      match_expressions = list(object({
        key      = string
        operator = string
        values   = optional(list(string))
      }))
    }))
  }))
  default = [] 
}
variable "deployment_spec_template_spec_container" {
  description = "List of containers belonging to the pod"
  type        = list(object({
    args                           = optional(list(string))
    command                        = optional(list(string))
    name                           = string
    image                          = optional(string)
    image_pull_policy              = optional(string, "IfNotPresent") 
    stdin                          = optional(bool, true)
    stdin_once                     = optional(bool, false)
    termination_message_path       = optional(string)
    termination_message_policy     = optional(string) 
    tty                            = optional(bool)
    working_dir                    = optional(string)
    env                            = optional(list(object({
      name                         = string
      value                        = optional(string)
      value_from                   = object({
        config_map_key_ref         = object({
          key                      = string
          name                     = optional(string)
          optional                 = optional(bool, false)
        })
        field_ref                  = object({
          api_version              = optional(string)
          field_path               = string
        })
        resource_field_ref         = object({
          container_name           = optional(string)
          resource                 = string
          divisor                  = optional(string, "1") 
        })
        secret_key_ref             = object({
          key                      = string
          name                     = optional(string)
          optional                 = optional(bool, false)
        })
     })
    })), [])
    env_from                       = optional(list(object({
      config_map_ref               = object({
        name                       = optional(string)
        optional                   = optional(bool, false)
      })
      prefix                       = optional(string)
      secret_ref                   = object({
        name                       = string
        optional                   = optional(bool, false)  
      })
    })), []) 
    lifecycle                     = optional(list(object({
      post_start                   = optional(object({
        exec                       = object({
          command                  = list(string)
        })
        http_get                   = object({
          port    = string
          host    = optional(string)
          path    = optional(string)
          scheme  = optional(string)
          http_header             = object({
            name  = string
            value = string
          })
        })
        tcp_socket                 = object({
          port                     = string
        })
      }))
      pre_stop                     = optional(object({
        exec                       = object({
          command                  = list(string)
        })
        http_get                   = object({
          port    = string
          host    = optional(string)
          path    = optional(string)
          scheme  = optional(string)
          http_header             = object({
            name  = string
            value = string
          })
        }) 
        tcp_socket                 = object({
          port                     = string
        })
      }))
    })), [])
    liveness_probe                   = optional(list(object({
      failure_threshold              = optional(number)
      initial_delay_seconds          = optional(number)
      period_seconds                 = optional(number)
      timeout_seconds                = optional(number)
      success_threshold              = optional(number)
      exec                         = optional(object({
        command                    = optional(list(string))
      }))
      grpc                         = optional(object({
        port                       = number
        service                    = optional(string)
      }))
      http_get                     = optional(object({
        port                       = string
        host                       = optional(string)
        path                       = optional(string)
        scheme                     = optional(string)
        http_header                = object({
          name                     = string
          value                    = string
        })
      }))
      tcp_socket                   = optional(object({
        port                       = string
      }))
      gprc                         = optional(object({
        port                       = number
        service                    = optional(string)
      }))
    })), [])
    port                           = optional(list(object({
      container_port               = number
      host_ip                      = optional(string)
      host_port                    = optional(number)
      name                         = optional(string)
      protocol                     = optional(string)
    })))
    readiness_probe                  = optional(list(object({
      failure_threshold              = optional(number)
      initial_delay_seconds          = optional(number)
      period_seconds                 = optional(number)
      timeout_seconds                = optional(number)
      success_threshold              = optional(number)
      exec                           = object({
        command                      = optional(list(string))
      })
      grpc                           = object({
        port                         = number
        service                      = optional(string)
      })
      http_get                       = object({
         port                        = string
         host                        = optional(string)
         path                        = optional(string)
         scheme                      = optional(string)
         http_header                 = object({
           name                      = string
           value                     = string
         })
      })
      tcp_socket                     = object({
        port                         = string
      })
    })), [])
    resources                    = optional(list(object({
      limits     = optional(map(string))
      requests   = optional(map(string))
    })),[])
    security_context                 = optional(list(object({
      allow_privilege_escalation = optional(bool)
      privileged                 = optional(bool)
      read_only_root_filesystem  = optional(bool)
      run_as_group               = optional(number)
      run_as_non_root            = optional(bool)
      run_as_user                = optional(number)
      capabilities               = optional(object({
        add                      = optional(list(string))
        drop                     = optional(list(string))
      }))
      seccomp_profile            = optional(object({
        localhost_profile        = optional(string)
        type                     = string
      }))
      se_linux_options           = optional(object({
        level                    = optional(string) 
        role                     = optional(string)
        type                     = optional(string)
        user                     = optional(string)
      }))
    })), [])
    startup_probe                    = optional(list(object({
      failure_threshold              = optional(number)
      initial_delay_seconds          = optional(number)
      period_seconds                 = optional(number)
      timeout_seconds                = optional(number)
      success_threshold              = optional(number)
      exec                           = object({
        command                      = optional(list(string))
      })
      grpc                           = object({
        port                         = number
        service                      = optional(string)
      })
      http_get                       = object({
         port                        = string
         host                        = optional(string)
         path                        = optional(string)
         scheme                      = optional(string)
         http_header                 = object({
           name                      = string
           value                     = string
         })
      })
      tcp_socket                     = object({
        port                         = string
      })
    })),[])
    volume_mount                   = optional(list(object({
      mount_path                   = string
      name                         = string
      read_only                    = optional(bool, false)
      sub_path                     = optional(string)
      mount_propagation            = optional(string)
    })), [])
  }))
  default = []
}
variable "deployment_spec_template_spec_readiness_gate" {
  description = "If specified, all readiness gates will be evaluated for pod readiness"
  type        = list(object({
    condition_type = optional(string)
  }))
  default  = []
}
variable "deployment_spec_template_spec_init_container" {
  description = "List of containers belonging to the pod"
  type        = list(object({
    args                           = optional(list(string))
    command                        = optional(list(string))
    name                           = string
    image                          = optional(string)
    image_pull_policy              = optional(string, "IfNotPresent") 
    stdin                          = optional(bool, true)
    stdin_once                     = optional(bool, false)
    termination_message_path       = optional(string)
    termination_message_policy     = optional(string) 
    tty                            = optional(bool)
    working_dir                    = optional(string)
    env                            = optional(list(object({
      name                         = string
      value                        = optional(string)
      value_from                   = object({
        config_map_key_ref         = object({
          key                      = string
          name                     = optional(string)
          optional                 = optional(bool, false)
        })
        field_ref                  = object({
          api_version              = optional(string)
          field_path               = string
        })
        resource_field_ref         = object({
          container_name           = optional(string)
          resource                 = string
          divisor                  = optional(string, "1") 
        })
        secret_key_ref             = object({
          key                      = string
          name                     = optional(string)
          optional                 = optional(bool, false)
        })
     })
    })), [])
    env_from                       = optional(list(object({
      config_map_ref               = object({
        name                       = optional(string)
        optional                   = optional(bool, false)
      })
      prefix                       = optional(string)
      secret_ref                   = object({
        name                       = string
        optional                   = optional(bool, false)  
      })
    })), []) 
    lifecycle                     = optional(list(object({
      post_start                   = optional(object({
        exec                       = object({
          command                  = list(string)
        })
        http_get                   = object({
          port    = string
          host    = optional(string)
          path    = optional(string)
          scheme  = optional(string)
          http_header             = object({
            name  = string
            value = string
          })
        })
        tcp_socket                 = object({
          port                     = string
        })
      }))
      pre_stop                     = optional(object({
        exec                       = object({
          command                  = list(string)
        })
        http_get                   = object({
          port    = string
          host    = optional(string)
          path    = optional(string)
          scheme  = optional(string)
          http_header             = object({
            name  = string
            value = string
          })
        }) 
        tcp_socket                 = object({
          port                     = string
        })
      }))
    })), [])
    liveness_probe                   = optional(list(object({
      failure_threshold              = optional(number)
      initial_delay_seconds          = optional(number)
      period_seconds                 = optional(number)
      timeout_seconds                = optional(number)
      success_threshold              = optional(number)
      exec                         = optional(object({
        command                    = optional(list(string))
      }))
      grpc                         = optional(object({
        port                       = number
        service                    = optional(string)
      }))
      http_get                     = optional(object({
        port                       = string
        host                       = optional(string)
        path                       = optional(string)
        scheme                     = optional(string)
        http_header                = object({
          name                     = string
          value                    = string
        })
      }))
      tcp_socket                   = optional(object({
        port                       = string
      }))
      gprc                         = optional(object({
        port                       = number
        service                    = optional(string)
      }))
    })), [])
    port                           = optional(list(object({
      container_port               = number
      host_ip                      = optional(string)
      host_port                    = optional(number)
      name                         = optional(string)
      protocol                     = optional(string)
    })))
    readiness_probe                  = optional(list(object({
      failure_threshold              = optional(number)
      initial_delay_seconds          = optional(number)
      period_seconds                 = optional(number)
      timeout_seconds                = optional(number)
      success_threshold              = optional(number)
      exec                           = object({
        command                      = optional(list(string))
      })
      grpc                           = object({
        port                         = number
        service                      = optional(string)
      })
      http_get                       = object({
         port                        = string
         host                        = optional(string)
         path                        = optional(string)
         scheme                      = optional(string)
         http_header                 = object({
           name                      = string
           value                     = string
         })
      })
      tcp_socket                     = object({
        port                         = string
      })
    })), [])
    resources                    = optional(list(object({
      limits     = optional(map(string))
      requests   = optional(map(string))
    })),[])
    security_context             = optional(list(object({
      allow_privilege_escalation = optional(bool)
      privileged                 = optional(bool)
      read_only_root_filesystem  = optional(bool)
      run_as_group               = optional(number)
      run_as_non_root            = optional(bool)
      run_as_user                = optional(number)
      capabilities               = optional(object({
        add                      = optional(list(string))
        drop                     = optional(list(string))
      }))
      seccomp_profile            = optional(object({
        localhost_profile        = optional(string)
        type                     = string
      }))
      se_linux_options           = optional(object({
        level                    = optional(string) 
        role                     = optional(string)
        type                     = optional(string)
        user                     = optional(string)
      }))
    })), [])
    startup_probe                    = optional(list(object({
      failure_threshold              = optional(number)
      initial_delay_seconds          = optional(number)
      period_seconds                 = optional(number)
      timeout_seconds                = optional(number)
      success_threshold              = optional(number)
      exec                           = object({
        command                      = optional(list(string))
      })
      grpc                           = object({
        port                         = number
        service                      = optional(string)
      })
      http_get                       = object({
         port                        = string
         host                        = optional(string)
         path                        = optional(string)
         scheme                      = optional(string)
         http_header                 = object({
           name                      = string
           value                     = string
         })
      })
      tcp_socket                     = object({
        port                         = string
      })
    })),[])
    volume_mount                   = optional(list(object({
      mount_path                   = string
      name                         = string
      read_only                    = optional(bool, false)
      sub_path                     = optional(string)
      mount_propagation            = optional(string)
    })), [])
  }))
  default = []
}
variable "deployment_spec_template_spec_dns_policy" {
  description = "Set DNS policy for containers within the pod. Valid values are 'ClusterFirstWithHostNet', 'ClusterFirst', 'Default' or 'None'"
  type        = string
  default     = "ClusterFirst"
}
variable "deployment_spec_template_spec_dns_config" {
  description = "Specifies the DNS parameters of a pod. Parameters specified here will be merged to the generated DNS configuration based on DNSPolicy. Optional: Defaults to empty"
  type        = list(object({
    nameservers = optional(list(string))
    searches    = optional(list(string))
    option      = optional(list(object({
      name  = string
      value = optional(string)
    })))
  }))
  default     = []
}
variable "deployment_spec_template_spec_host_aliases" {
  description = "An optional list of hosts and IPs that will be injected into the pod's hosts file if specified. This is only valid for non-hostNetwork pods"
  type        = list(object({
    hostnames  = optional(string)
    ip         = optional(string)
  }))
  default      = [] 
}
variable "deployment_spec_template_spec_image_pull_secrets" {
  description = "ImagePullSecrets is an optional list of references to secrets in the same namespace to use for pulling any of the images used by this PodSpec"
  type        = list(object({
    name      = optional(string)
  }))
  default     = [] 
}
variable "deployment_spec_template_spec_security_context" {
  description = "SecurityContext holds pod-level security attributes and common container settings. Optional: Defaults to empty"
  type        = list(object({
    fs_group               = optional(number)
    run_as_group           = optional(number)
    run_as_non_root        = optional(bool)
    run_as_user            = optional(number)
    fs_group_change_policy = optional(string)
    supplemental_groups    = optional(list(number))
    seccomp_profile        = optional(object({
      localhost_profile    = optional(string)
      type                 = string
    }))
    se_linux_options       = optional(object({
      level = optional(string)
      role  = optional(string)
      type  = optional(string)
      user  = optional(string)
    }))
    sysctl                 = optional(list(object({
      name  = string
      value = string
    })))
  }))
  default     = []
}
variable "deployment_spec_template_spec_toleration" {
  description = "If specified, the pod's toleration. Optional: Defaults to empty"
  type        = list(object({
    effect             = optional(string)
    key                = optional(string)
    operator           = optional(string)
    toleration_seconds = optional(number)
    value              = optional(string)
  }))
  default    = []
}
variable "deployment_spec_template_spec_topology_spread_constraint" {
  description = "describes how a group of pods ought to spread across topology domains. Scheduler will schedule pods in a way which abides by the constraints"
  type        = list(object({
    max_skew           = number
    topology_key       = string
    when_unsatisfiable = string
    label_selector     = optional(list(object({
      match_labels      = optional(map(string))
      match_expressions = optional(list(object({
        key      = optional(string)
        operator = optional(string)
        values   = optional(list(string))
      }))) 
    })))
  }))
  default     = []
}
variable "deployment_spec_template_spec_volume" {
  description = "List of volumes that can be mounted by containers belonging to the pod"
  type        = list(object({
    name                    = string
    config_map    = optional(list(object({
      default_mode = optional(number)
      optional     = optional(bool, false)
      name         = optional(string)
      items        = optional(list(object({
        key    =  optional(string)
        mode   =  optional(number)
        path   =  optional(string)
      })), [])
    })), [])
    csi        = optional(list(object({
      driver                  = string
      fs_type                 = optional(string)
      read_only               = optional(bool, false)
      volume_attributes       = optional(map(string))
      node_publish_secret_ref = optional(list(object({
        name  = optional(string)
      })), [])
    })), [])
    host_path = optional(list(object({
      path = optional(string)
      type = optional(string)
    })), [])
    local     = optional(list(object({
      path  = optional(string)
    })), [])
    aws_elastic_block_store = optional(list(object({
      fs_type   = optional(string)
      partition = optional(number)
      read_only = optional(bool)
      volume_id = string
    })), [])
    azure_disk = optional(list(object({
      caching_mode  = string
      data_disk_uri = string
      disk_name     = string
      fs_type       = optional(string)
      kind          = optional(string)
      read_only     = optional(bool)
    })), [])
    azure_file  = optional(list(object({
      read_only        = optional(bool)
      secret_name      = string
      secret_namespace = optional(string)
      share_name       = string
    })), [])
    fc       = optional(list(object({
     fs_type      = string
     lun          = optional(string)
     read_only    = optional(bool, false)
     target_ww_ns = optional(list(string))
    })), [])
    gce_persistent_disk = optional(list(object({
      fs_type   = optional(string)
      partition = optional(number)
      pd_name   = string
      read_only = optional(bool)
    })), [])
    iscsi    = optional(list(object({
      fs_type         = optional(string)
      iqn             = string
      iscsi_interface = optional(string)
      lun             = string
      read_only       = optional(bool, false)
      target_portal   = optional(list(string))
   })), [])
   nfs       = optional(list(object({
     path      = string
     read_only = optional(bool, false)
     server    = string
   })), [])
   downward_api = optional(list(object({
     default_mode = optional(number)
     items = optional(list(object({
       mode = optional(number)
       path = string
       field_ref = list(object({
         api_version = optional(string)
         field_path  = string
       }))
       resource_field_ref = optional(list(object({
         container_name = optional(string)
         divisor        = optional(string)
         resource       = string
       })))
     })), [])
   })),[])
   empty_dir = optional(list(object({
     medium     = optional(string)
     size_limit = optional(string)
   })), [])
   persistent_volume_claim = optional(list(object({
     claim_name  = optional(string)
     read_only   = optional(bool, false)
   })), [])
   secret    = optional(list(object({
     default_mode   = optional(number)
     optional       = optional(bool)
     secret_name    = optional(string)
     items          = optional(list(object({
       key    =  string
       mode   =  optional(number)
       path   =  string
     })), [])
   })), [])
   projected  = optional(list(object({
     default_mode  = optional(number)
     sources       = optional(list(object({
       config_map  = optional(list(object({
         name      = string
         optional  = optional(bool)
         items     = optional(list(object({
           key     = string
           path    = string
           mode    = optional(number)
         })), [])
       })), [])
       downward_api = optional(list(object({
         items      = optional(list(object({
           path     = string
           mode     = optional(number)
           field_ref = optional(list(object({
             field_path  = string
             api_version = optional(string)
           })), [])
           resource_ref  = optional(list(object({
             resource       = string
             container_name = optional(string)
             divisor        = optional(number)
           })), [])
         })), [])
       })), [])
       secret  = optional(list(object({
         name     = optional(string)
         optional = optional(bool)
         items    = optional(list(object({
           key    = string
           path   = string
           mode   = optional(number)
         })), [])
       })), [])
       service_account_token = optional(list(object({
         path               = string
         audience           = optional(string)
         expiration_seconds = optional(number)
       })), [])
     })), [])
   })), [])
 }))
 default    = []
}
