variable "datazone_policy_grant_domain_identifier" {
  description = "(Required) Identifier of the domain where the policy grant is created"
  type        = string
}
variable "datazone_policy_grant_entity_identifier" {
  description = "(Required) Identifier of the entity to which the policy grant applies"
  type        = string
}
variable "datazone_policy_grant_entity_type" {
  description = "(Required) Type of entity to which the policy grant applies. Valid values: ASSET_TYPE, DOMAIN_UNIT, ENVIRONMENT_BLUEPRINT_CONFIGURATION, ENVIRONMENT_PROFILE"
  type        = string
}
variable "datazone_policy_grant_policy_type" {
  description = "(Required) Type of the managed policy. Valid values: ADD_TO_PROJECT_MEMBER_POOL, CREATE_ASSET_TYPE, CREATE_DOMAIN_UNIT, CREATE_ENVIRONMENT, CREATE_ENVIRONMENT_FROM_BLUEPRINT, CREATE_ENVIRONMENT_PROFILE, CREATE_FORM_TYPE, CREATE_GLOSSARY, CREATE_PROJECT, CREATE_PROJECT_FROM_PROJECT_PROFILE, DELEGATE_CREATE_ENVIRONMENT_PROFILE, OVERRIDE_DOMAIN_UNIT_OWNERS, OVERRIDE_PROJECT_OWNERS, USE_ASSET_TYPE"
  type        = string
}
variable "datazone_policy_grant_detail" {
  description = "(Required) Policy grant detail. Exactly one sub-block must be specified"
  type        = list(object({
    add_to_project_member_pool          = optional(list(object({
      include_child_domain_units = optional(bool)
    })), [])
    create_asset_type                   = optional(list(object({
      include_child_domain_units = optional(bool)
    })), [])
    create_domain_unit                  = optional(list(object({
      include_child_domain_units = optional(bool)
    })), [])
    create_environment                  = optional(list(object({
    })), [])
    create_environment_from_blueprint   = optional(list(object({
    })), [])
    create_environment_profile          = optional(list(object({
      include_child_domain_units = optional(bool)
    })), [])
    create_form_type                    = optional(list(object({
      include_child_domain_units = optional(bool)
    })), [])
    create_glossary                     = optional(list(object({
      include_child_domain_units = optional(bool)
    })), [])
    create_project                      = optional(list(object({
      include_child_domain_units = optional(bool)
    })), [])
    create_project_from_project_profile = optional(list(object({
      include_child_domain_units = optional(bool)
      project_profiles           = optional(list(string))
    })), [])
    delegate_create_environment_profile = optional(list(object({
    })), [])
    override_domain_unit_owners         = optional(list(object({
      include_child_domain_units = optional(bool)
    })), [])
    override_project_owners             = optional(list(object({
      include_child_domain_units = optional(bool)
    })), [])
    use_asset_type                      = optional(list(object({
      domain_unit_id = optional(string)
    })), [])
  }))
}
variable "datazone_policy_grant_principal" {
  description = "(Required) Principal to which the policy grant applies. Exactly one sub-block must be specified"
  type        = list(object({
    domain_unit = optional(list(object({
      domain_unit_designation       = string
      domain_unit_identifier        = optional(string)
      all_domain_units_grant_filter = optional(list(object({
      })),[])
    })), [])
    group       = optional(list(object({
      group_identifier = string

    })), [])
    project     = optional(list(object({
      project_designation = string
      project_identifier  = optional(string)
      domain_unit_filter  = optional(list(object({
        domain_unit                = string
        include_child_domain_units = optional(bol)
      })), [])
    })), [])
    user        = optional(list(object({
      user_identifier         = optional(string)
      all_users_grant_filter  = optional(list(object({
      })), [])
    })), [])

  }))
}
