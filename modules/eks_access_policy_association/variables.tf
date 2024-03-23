variable "eks_access_policy_association_cluster_name" {
  description = "Name of the EKS Cluster" 
  type        = string
}
variable "eks_access_policy_association_policy_arn" {
  description = "ARN of the access policy that you're associating" 
  type        = string 
}
variable "eks_access_policy_association_principal_arn" {
  description = "The IAM Principal ARN which requires Authentication access to the EKS cluster" 
  type        = string
}
variable "eks_access_policy_association_access_scope" {
  description = "Access scope"
  type        = list(object({
    namespaces = optional(list(string))
    type       = string
  })) 
}
