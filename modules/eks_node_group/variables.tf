variable "eks_node_group_ami_type" {
  description = "(Optional) Type of AMI associated with the EKS Node Group"
  type        = string 
  default     = null
}
variable "eks_node_group_capacity_type" {
  description = "(Optional) Type of capacity associated with the EKS Node Group. Valid values: ON_DEMAND, SPOT. Terraform will only perform drift detection if a configuration value is provided"
  type        = string 
  default     = null
}
variable "eks_node_group_cluster_name" {
  description = "(Required) Name of the EKS Cluster"
  type        = string 
}
variable "eks_node_group_disk_size" {
  description = "(Optional) Disk size in GiB for worker nodes. Defaults to 50 for Windows, 20 all other node groups. Terraform will only perform drift detection if a configuration value is provided"
  type        = number 
  default     =  null
}
variable "eks_node_group_force_update_version" {
  description = "(Optional) Force version update if existing pods are unable to be drained due to a pod disruption budget issue"
  type        = bool
  default     = false
}
variable "eks_node_group_instance_types" {
  description = "(Optional) List of instance types associated with the EKS Node Group. Defaults to [\"t3.medium\"]. Terraform will only perform drift detection if a configuration value is provided"
  type        = list(string)
  default     = []
}
variable "eks_node_group_labels" {
  description = "(Optional) Key-value map of Kubernetes labels. Only labels that are applied with the EKS API are managed by this argument. Other Kubernetes labels applied to the EKS Node Group will not be managed"
  type        = map(string) 
  default     = {}
}
variable "eks_node_group_node_group_name" {
  description = "(Optional) Name of the EKS Node Group. If omitted, Terraform will assign a random, unique name. Conflicts with node_group_name_prefix. The node group name can't be longer than 63 characters. It must start with a letter or digit, but can also include hyphens and underscores for the remaining characters"
  type        = string
  default     = null 
}
variable "eks_node_group_node_group_name_prefix" {
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with node_group_name"
  type        = string
  default     = null
}
variable "eks_node_group_node_role_arn" {
  description = "(Required) ARN of the IAM Role that provides permissions for the EKS Node Group"
  type        = string
}
variable "eks_node_group_release_version" {
  description = "(Optional) AMI version of the EKS Node Group. Defaults to latest version for Kubernetes version"
  type        = string 
  default     = null
}
variable "eks_node_group_subnet_ids" {
  description = "(Required) Identifiers of EC2 Subnets to associate with the EKS Node Group"
  type        = list(string)
}
variable "eks_node_group_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "eks_node_group_version" {
  description = "(Optional) Kubernetes version. Defaults to EKS Cluster Kubernetes version. Terraform will only perform drift detection if a configuration value is provided"
  type        = string
  default     = null
}
variable "eks_node_group_launch_template" {
  description = "(Optional) Configuration block with Launch Template settings"
  type        = list(object({
    id      = optional(string)
    name    = optional(string)
    version = string    
  }))
  default     = []
}
variable "eks_node_group_node_repair_config" {
  description = "(Optional) The node auto repair configuration for the node group"
  type        = list(object({
    enabled                                 = optional(bool)
    max_parallel_nodes_repaired_count       = optional(number)
    max_parallel_nodes_repaired_percentage  = optional(number)
    max_unhealthy_node_threshold_count      = optional(number)
    max_unhealthy_node_threshold_percentage = optional(number)
    node_repair_config_overrides            = optional(list(object({
      min_repair_wait_time_mins = number
      node_monitoring_condition = string
      node_unhealthy_reason     = string
      repair_action             = string
    })), [])
  }))
  default     = []
}
variable "eks_node_group_remote_access" {
  description = "(Optional) Configuration block with remote access settings"
  type        = list(object({
    ec2_ssh_key               = optional(string)
    source_security_group_ids = optional(list(string))
  }))  
  default     = []
}
variable "eks_node_group_scaling_config" {
  description = "(Required) Configuration block with scaling settings"
  type        = list(object({
    desired_size = number
    max_size     = number
    min_size     = number
  }))
}
variable "eks_node_group_taint" {
  description = "(Optional) The Kubernetes taints to be applied to the nodes in the node group. Maximum of 50 taints per node group"
  type        = list(object({
    key    = string
    value  = optional(string)
    effect = string
  }))
  default     = []
}
variable "eks_node_group_update_config" {
  description = "(Optional) Configuration block with update settings"
  type        = list(object({
    max_unavailable            = optional(number)
    max_unavailable_percentage = optional(number)
    update_strategy            = optional(string)
  }))
  default     = []
}
variable "eks_node_group_warm_pool_config" {
  description = "(Optional) Configuration block with EC2 Auto Scaling warm pool settings. Including this block enables the warm pool; removing it disables and removes the warm pool"
  type        = list(object({
    max_group_prepared_capacity = optional(number)
    min_size                    = optional(number)
    pool_state                  = optional(string)
    reuse_on_scale_in           = optional(bool)
  }))
  default     = []
}
