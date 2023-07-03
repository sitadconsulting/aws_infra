resource "aws_security_group" "security_group" {
  description            = var.security_group_description
  name_prefix            = var.security_group_name_prefix
  name                   = var.security_group_name
  revoke_rules_on_delete = var.security_group_revoke_rules_on_delete
  tags                   = var.security_group_tags
  vpc_id                 = var.security_group_vpc_id

  dynamic "egress" {
    for_each = var.security_group_egress
      content {
        cidr_blocks      = egress.value["cidr_blocks"]
        description      = egress.value["description"]
        from_port        = egress.value["from_port"]
        ipv6_cidr_blocks = egress.value["ipv6_cidr_blocks"]
        prefix_list_ids  = egress.value["prefix_list_ids"]
        protocol         = egress.value["protocol"]
        security_groups  = egress.value["security_groups"]
        self             = egress.value["self"]
        to_port          = egress.value["to_port"]
      }
  }   
  dynamic "ingress" {
    for_each = var.security_group_ingress
      content {
        cidr_blocks      = egress.value["cidr_blocks"]
        description      = egress.value["description"]
        from_port        = egress.value["from_port"]
        ipv6_cidr_blocks = egress.value["ipv6_cidr_blocks"]
        prefix_list_ids  = egress.value["prefix_list_ids"]
        protocol         = egress.value["protocol"]
        security_groups  = egress.value["security_groups"]
        self             = egress.value["self"]
        to_port          = egress.value["to_port"]
      }
  }
  lifecycle {
    ignore_changes = all
  } 
}
