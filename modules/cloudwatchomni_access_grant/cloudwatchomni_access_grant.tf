resource "aws_cloudwatchomni_access_grant" "cloudwatchomni_access_grant" {
  domain_id  = var.cloudwatchomni_access_grant_domain_id
  name       = var.cloudwatchomni_access_grant_name
  permission = var.cloudwatchomni_access_grant_permission
  space_id   = var.cloudwatchomni_access_grant_space_id
  tags       = var.cloudwatchomni_access_grant_tags

  dynamic "principal" {
    for_each = var.cloudwatchomni_access_grant_principal
      content {
        principal_id   = principal.value["principal_id"]
        principal_type = principal.value["principal_type"]
        dynamic "principal_attribute" {
          for_each = principal.value.principal_attribute
            content {
              key   = principal_attribute.value["key"]
              value = principal_attribute.value["value"]
            }
        }
      }
  }
  dynamic "scoped_action" {
    for_each = var.cloudwatchomni_access_grant_scoped_action
      content {
        actions = scoped_action.value["actions"]
        dynamic "resource" {
          for_each = scoped_action.value.resource
            content {
              resource_arns = resource.value["resource_arns"]
              resource_type = resource.value["resource_type"]
              signal_types  = resource.value["signal_types"]
              tags          = resource.value["tags"]
              dynamic "row_scope_group" {
                for_each = resource.value.row_scope_group
                  content {
                    dynamic "row_scope" {
                      for_each = row_scope_group.value.row_scope
                        content {
                          field    = row_scope.value["field"]
                          operator = row_scope.value["operator"]
                          values   = row_scope.value["values"]
                        }
                    }
                  }
              }
            }
        }
      }
  }
}
