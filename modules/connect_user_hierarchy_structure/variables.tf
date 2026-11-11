variable "connect_user_hierarchy_structure_instance_id" {
  description = "(Required) Specifies the identifier of the hosting Amazon Connect Instance"
  type        = string
}
variable "connect_user_hierarchy_structure_hierarchy_structure" {
  description = "(Required) A block that defines the hierarchy structure's levels"
  type        = list(object({
    level_one   = optional(list(object({
      name = string
    })), [])
    level_two   = optional(list(object({
      name = string
    })), [])
    level_three = optional(list(object({
      name = string
    })), [])
    level_four  = optional(list(object({
      name = string
    })), [])
    level_five  = optional(list(object({
      name = string
    })), [])
  }))
}
