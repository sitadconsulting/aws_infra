variable "eks_fargate_profile_cluster_name" {
  decription = "(Required) Name of the EKS Cluster"
  type       = string
}
variable "eks_fargate_profile_fargate_profile_name" {
  decription = "(Required) Name of the EKS Fargate Profile"
  type       = string
}
variable "eks_fargate_profile_pod_execution_role_arn" {
  decription = "(Required) ARN of the IAM Role that provides permissions for the EKS Fargate Profile"
  type       = string
}
variable "eks_fargate_profile_subnet_ids" {
  decription = "(Required) Identifiers of private EC2 Subnets to associate with the EKS Fargate Profile. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER_NAME (where CLUSTER_NAME is replaced with the name of the EKS Cluster)"
  type       = list(string)
}
variable "eks_fargate_profile_tags" {
  decription = "(Optional) Key-value map of resource tags"
  type       = map(string)
  default    = {}
}
variable "eks_fargate_profile_selector" {
  decription = "(Required) Configuration block(s) for selecting Kubernetes Pods to execute with this EKS Fargate Profile"
  type       = list(object({
    namespace  = string
    labels     = optional(map(string))
    region     = optional(string)
  }))
}
