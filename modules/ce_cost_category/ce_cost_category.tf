resource "aws_ce_cost_category" "ce_cost_category" {
  default_value   = var.ce_cost_category_default_value
  effective_start = var.ce_cost_category_effective_start
  name            = var.ce_cost_category_name
  rule_version    = var.ce_cost_category_rule_version
  tags            = var.ce_cost_category_tags

  dyanmic "rule" {
    for_each = var.ce_cost_category_rule
      content {
        type  = rule.value["type"]
        value = rule.value["value"]
        dynamic "inherited_value" {
          for_each = rule.value.inherited_value
            content {
              dimension_key  = inherited_value.value["dimension_key"]
              dimension_name = inherited_value.value["dimension_name"]
            }
        }
        dynamic "rule" {
          for_each = rule.value.rule
            content {
              and = rule.value["and"]
              not = rule.value["not"]
              or  = rule.value["or"]
              dynamic "cost_category" {
                for_each = rule.value.cost_category
                  content {
                    key           = cost_category.value["key"]
                    match_options = cost_category.value["match_options"]
                    values        = cost_category.value["values"]
                  }
              }
              dynamic "dimension" {
                for_each = rule.value.dimension
                  content {
                    key           = cost_category.value["key"]
                    match_options = cost_category.value["match_options"]
                    values        = cost_category.value["values"]
                  }
              }
              dynamic "tags" {
                for_each = rule.value.tags
                  content {
                    key           = cost_category.value["key"]
                    match_options = cost_category.value["match_options"]
                    values        = cost_category.value["values"]
                  }
              }
            }
        }
      }
  } 
  dynamic "split_charge_rule" {
    for_each = var.ce_cost_category_split_charge_rule
      content {
        method  = split_charge_rule.value["method"]
        source  = split_charge_rule.value["source"]
        targets = split_charge_rule.value["targets"]
        dynamic "parameter" {
          for_each = split_charge_rule.value.parameter
            content {
              type   = parameter.value["type"]
              values = parameter.value["values"]
            }
        }
      }
  }
}
