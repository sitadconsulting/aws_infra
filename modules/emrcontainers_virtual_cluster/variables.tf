variable "emrcontainers_virtual_cluster_name" {
  description = "(Required) Name of the virtual cluster"
  type        = string
}
variable "emrcontainers_virtual_cluster_tags" {
  description = "(Optional) Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
variable "emrcontainers_virtual_cluster_container_provider" {
  description = "(Required) Configuration block for the container provider associated with your cluster"
  type        = list(object({
    info = list(object({
      eks_info = list(object({
        namespace = optional(string)
      }))
    }))
  }))
}
