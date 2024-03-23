variable "eks_node_group_ami_type" {
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group. See the AWS documentation for valid values"
  type        = string 
  default     = null
}
variable "eks_node_group_capacity_type" {
  description = "Type of capacity associated with the EKS Node Group. Valid values: ON_DEMAND, SPOT"
  type        = string 
  default     = null
}
variable "eks_node_group_cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string 
}
variable "eks_node_group_disk_size" {
  description = "Disk size in GiB for worker nodes. Defaults to 50 for Windows, 20 all other node groups"
  type        = number 
  default     =  null
}
variable "eks_node_group_force_update_version" {
  description = "Force version update if existing pods are unable to be drained due to a pod disruption budget issue"
  type        = bool
  default     = false
}
variable "eks_node_group_instance_types" {
  description = "List of instance types associated with the EKS Node Group. Defaults to [\"t3.medium\"] "
  type        = list(string)
  default     = []
}
variable "eks_node_group_labels" {
  description = "Key-value map of Kubernetes labels. Only labels that are applied with the EKS API are managed by this argument. Other Kubernetes labels applied to the EKS Node Group will not be managed"
  type        = map(string) 
  default     = {}
}
variable "eks_node_group_node_group_name" {
  description = "Name of the EKS Node Group. If omitted, Terraform will assign a random, unique name. Conflicts with node_group_name_prefix. The node group name can't be longer than 63 characters. It must start with a letter or digit, but can also include hyphens and underscores for the remaining characters"
  type        = string
  default     = null 
}
variable "eks_node_group_node_group_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with node_group_name"
  type        = string
  default     = null
}
variable "eks_node_group_node_role_arn" {
  description = "ARN of the IAM Role that provides permissions for the EKS Node Group"
  type        = string
}
variable "eks_node_group_release_version" {
  description = "AMI version of the EKS Node Group. Defaults to latest version for Kubernetes version"
  type        = string 
  default     = null
}
variable "eks_node_group_subnet_ids" {
  description = "Identifiers of EC2 Subnets to associate with the EKS Node Group"
  type        = list(string)
}
variable "eks_node_group_tags" {
  description = "Key-value map of resource tag "
  type        = map(string)
  default     = {}
}
variable "eks_node_group_launch_template" {
  description = "Launch Template settings"
  type        = list(object({
    id      = optional(string)
    name    = optional(string)
    version = string    
  }))
  default     = []
}
variable "eks_node_group_remote_access" {
  description = "Remote access settings"
  type        = list(object({
    ec2_ssh_key               = optional(string)
    source_security_group_ids = oprional(list(string))
  }))  
  default     = []
}
variable "eks_node_group_scaling_config" {
  description = "Scaling settings"
  type        = list(object({
    desired_size = number
    max_size     = number
    min_size     = number
  }))
}
variable "eks_node_group_taint" {
  description = "The Kubernetes taints to be applied to the nodes in the node group. Maximum of 50 taints per node group"
  type        = list(object({
    key    = string
    value  = optional(string)
    effect = string
  }))
  default     = []
}
variable "eks_node_group_update_config" {
  description = "Update settings"
  type        = list(object({
    max_unavailable            = optional(number)
    max_unavailable_percentage = optional(number)
  }))
  default     = []
}
