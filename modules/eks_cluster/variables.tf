variable "eks_cluster_bootstrap_self_managed_addons" {
  description = "(Optional) Install default unmanaged add-ons, such as aws-cni, kube-proxy, and CoreDNS during cluster creation. If false, you must manually install desired add-ons. Changing this value will force a new cluster to be created. Defaults to true"
  type        = bool
  default     = false
}
variable "eks_cluster_deletion_protection" {
  description = "(Optional) Whether to enable deletion protection for the cluster. When enabled, the cluster cannot be deleted unless deletion protection is first disabled. Default: false"
  type        = bool
  default     = false
}
variable "eks_cluster_force_update_version" {
  description = "(Optional) Force version update by overriding upgrade-blocking readiness checks when updating a cluster"
  type        = bool
  default     = false
}
variable "eks_cluster_enabled_cluster_log_types" {
  description = "(Optional) List of the desired control plane logging to enable"
  type        = list(string)
  default     = []
}
variable "eks_cluster_name" {
  description = "(Required) Name of the cluster. Must be between 1-100 characters in length. Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores (^[0-9A-Za-z][A-Za-z0-9\-_]*$)"
  type        = string
}
variable "eks_cluster_role_arn" {
  description = "(Required) ARN of the IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations on your behalf. Ensure the resource configuration includes explicit dependencies on the IAM Role permissions by adding depends_on if using the aws_iam_role_policy resource or aws_iam_role_policy_attachment resource, otherwise EKS cannot delete EKS managed EC2 infrastructure such as Security Groups on EKS Cluster deletion"
  type        = string
}
variable "eks_cluster_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "eks_cluster_version" {
  description = "(Optional) Desired Kubernetes master version. If you do not specify a value, the latest available version at resource creation is used and no upgrades will occur except those automatically triggered by EKS. The value must be configured and increased to upgrade the version when desired. Downgrades are not supported by EKS"
  type        = string
  default     = null
}
variable "eks_cluster_access_config" {
  description = "(Optional) Configuration block for the access config associated with your cluster"
  type        = list(object({
    authentication_mode                         = optional(string)
    bootstrap_cluster_creator_admin_permissions = optional(bool)
  }))
  default     = []
}
variable "eks_cluster_compute_config" {
  description = "(Optional) Configuration block with compute configuration for EKS Auto Mode"
  type        = list(object({
    enabled       = optional(bool)
    node_pools    = optional(string)
    node_role_arn = optional(string)
  }))
  default     = []
}
variable "eks_cluster_control_plane_scaling_config" {
  description = "(Optional) Configuration block for the control plane scaling tier"
  type        = list(object({
    tier = optional(string)
  }))
  default     = []
}
variable "eks_cluster_encryption_config" {
  description = "(Optional) Configuration block with encryption configuration for the cluster"
  type        = list(object({
    resources = list(string)
    provider = list(object({
      key_arn = string 
    }))
  }))
  default     = []
}
variable "eks_cluster_kubernetes_network_config" {
  description = "(Optional) Configuration block with kubernetes network configuration for the cluster"
  type        = list(object({
    ip_family         = optional(string)
    service_ipv4_cidr = optional(string)
    service_ipv6_cidr = optional(string)
    elastic_load_balancing = optional(list(object({
      enabled = optional(bool)
    })), [])
  }))
  default     = []
}
variable "eks_cluster_kube_api_server_config" {
  description = "(Optional) Configuration block for customizing the Kubernetes API server"
  type        = list(object({
    event_ttl               = optional(string)
    service_node_port_range = optional(list(object({
      min_port = optional(number)
      max_port = optional(number)
    })), [])
  }))
  default     = []
}
variable "eks_cluster_kube_controller_manager_config" {
  description = "(Optional) Configuration block for customizing the Kubernetes controller manager"
  type        = list(object({
    horizontal_pod_autoscaler_controller_config = optional(list(object({
      horizontal_pod_autoscaler_sync_period = optional(string)
    })), [])
    pod_gc_controller_config                    = optional(list(object({
      terminated_pod_gc_threshold = optional(number)
    })), [])
  }))
  default     = []
}
variable "eks_cluster_kube_scheduler_config" {
  description = "(Optional) Configuration block for customizing the Kubernetes scheduler"
  type        = list(object({
    node_resources_fit = optional(list(object({
      scoring_strategy = optional(list(object({
        type     = optional(string)
        resource = optional(list(object({
          name   = optional(string)
          weight = optional(number)
        })), [])
      })), [])
    })), [])
  }))
  default     = []
}
variable "eks_cluster_outpost_config" {
  description = "(Optional) Configuration block representing the configuration of your local Amazon EKS cluster on an AWS Outpost. This block isn't available for creating Amazon EKS clusters on the AWS cloud"
  type        = list(object({
    control_plane_instance_type = string
    etcd_instance_type          = optional(string)
    outpost_arns                = list(string)
    control_plane_placement     = optional(list(object({
      group_name   = optional(string)
      spread_level = optional(string)
    })), [])
    
  }))
  default     = []
}
variable "eks_cluster_remote_network_config" {
  description = "(Optional) Configuration block with remote network configuration for EKS Hybrid Nodes"
  type        = list(object({
    remote_node_networks = optional(list(object({
      cidrs = optional(list(string))
    })), [])
    remote_pod_networks = optional(list(object({
      cidrs = optional(list(string))
    })), [])
  }))
  default     = []
}
variable "eks_cluster_storage_config" {
  description = "(Optional) Configuration block with storage configuration for EKS Auto Mode"
  type        = list(object({
    block_storage = optional(list(object({
      enabled = optional(bool)
    })), [])
  }))
  default     = []
}
variable "eks_cluster_upgrade_policy" {
  description = "(Optional) Configuration block for the support policy to use for the cluster"
  type        = list(object({
    support_type = optional(string)
  }))
  default     = []
}
variable "eks_cluster_vpc_config" {
  description = "(Required) Configuration block for the VPC associated with your cluster. Amazon EKS VPC resources have specific requirements to work properly with Kubernetes"
  type        = list(object({
    control_plane_egress_mode = optional(string)
    endpoint_private_access   = optional(bool)
    endpoint_public_access    = optional(bool)
    public_access_cidrs       = optional(list(string))
    security_group_ids        = optional(list(string))
    subnet_ids                = list(string)
  }))
}
variable "eks_cluster_zonal_shift_config" {
  description = "(Optional) Configuration block with zonal shift configuration for the cluster"
  type        = list(object({
    enabled = optional(bool)
  }))
  default     = []
}
