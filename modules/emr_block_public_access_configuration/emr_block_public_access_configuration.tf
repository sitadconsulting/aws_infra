resource "aws_emr_block_public_access_configuration" "emr_block_public_access_configuration" {
  block_public_security_group_rules = var.emr_block_public_access_configuration_block_public_security_group_rules

  dynamic "permitted_public_security_group_rule_range" {
    for_each = var.emr_block_public_access_configuration_permitted_public_security_group_rule_range
      content {
        min_range = permitted_public_security_group_rule_range.value["min_range"]
        max_range = permitted_public_security_group_rule_range.value["max_range"]
      }
  }
}
