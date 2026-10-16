variable "eks_capability_capability_name" {
  description = "(Required) Name of the capability. Must be unique within the cluster"
  type        = string
}
variable "eks_capability_cluster_name" {
  description = "(Required) Name of the EKS cluster"
  type        = string
}
variable "eks_capability_delete_propagation_policy" {
  description = "(Required) Delete propagation policy for the capability. Valid values: RETAIN"
  type        = string
}
variable "eks_capability_role_arn" {
  description = "(Required) ARN of the IAM role to associate with the capability"
  type        = string
}
variable "eks_capability_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "eks_capability_type" {
  description = "(Required) Type of the capability. Valid values: ACK, KRO, ARGOCD"
  type        = string
}
variable "eks_capability_configuration" {
  description = "(Optional) Configuration for the capability"
  type        = list(object({
    argo_cd = optional(list(object({
      namespace = optional(string)
      aws_idc           = optional(list(object({
        idc_instance_arn = string
        idc_region       = optional(string)
      })), [])
      network_access    = optional(list(object({
        vpce_ids = optional(string)
      })), []) 
      rbac_role_mapping = optional(list(object({
        role     = string
        identity = list(object({
          id   = string
          type = string
        }))
      })), [])
    })), [])
  }))
  default     = []
}
