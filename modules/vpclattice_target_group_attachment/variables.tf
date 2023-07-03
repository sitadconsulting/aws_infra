variable "vpclattice_target_group_attachment_target_group_identifier" {
  description = "The ID or Amazon Resource Name (ARN) of the target group"
  type        = string
}
variable "vpclattice_target_group_attachment_target" {
  description = "The target"
  type        = list(object({
    id   = string
    port = optional(number)
  }))
  default  = []
}
