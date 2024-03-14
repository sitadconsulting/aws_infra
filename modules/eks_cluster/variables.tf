variable "eks_cluster_enabled_cluster_log_types" {
  description = "List of the desired control plane logging to enable"
  type        = list(string)
  default     = []
}
variable "eks_cluster_name" {
  description = "Name of the cluster. Must be between 1-100 characters in length. Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores"
  type        = string
}
variable "eks_cluster_role_arn" {
  description = "ARN of the IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations on your behalf. Ensure the resource configuration includes explicit dependencies on the IAM Role permissions by adding depends_on if using the aws_iam_role_policy resource or aws_iam_role_policy_attachment resource, otherwise EKS cannot delete EKS managed EC2 infrastructure such as Security Groups on EKS Cluster deletion"
  type        = string
}
variable "eks_cluster_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "eks_cluster_version" {
  description = "Desired Kubernetes master version. If you do not specify a value, the latest available version at resource creation is used and no upgrades will occur except those automatically triggered by EKS. The value must be configured and increased to upgrade the version when desired. Downgrades are not supported by EKS"
  type        = string
  default     = ""
}
variable "eks_cluster_encryption_config" {
  description = "Configuration block with encryption configuration for the cluster"
  type        = list(object({
    provider = list(object({
      key_arn = string 
    }))
    resources = list(string)
  }))
  default     = []
}
variable "eks_cluster_outpost_config" {
  description = "Configuration block representing the configuration of your local Amazon EKS cluster on an AWS Outpost"
  type        = list(object({
    control_plane_instance_type = string
    outpost_arns                = list(string)
    control_plane_placement     = optional(list(object({
      group_name = string
    })), [])
  }))
  default     = []
}
variable "eks_cluster_vpc_config" {
  description = "Configuration block for the VPC associated with your cluster"
  type        = list(object({
    endpoint_private_access = optional(bool)
    endpoint_public_access  = optional(bool)
    public_access_cidrs     = optional(list(string))
    security_group_ids      = optional(list(string))
    subnet_ids              = list(string)
  }))
}
