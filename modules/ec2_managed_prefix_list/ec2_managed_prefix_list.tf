resource "aws_ec2_managed_prefix_list" "ec2_managed_prefix_list" {
  address_family = var.ec2_managed_prefix_list_address_family
  max_entries    = var.ec2_managed_prefix_list_max_entries
  name           = var.ec2_managed_prefix_list_name
  tags           = var.ec2_managed_prefix_list_tags

  dynamic "entry" {
    for_each = var.ec2_managed_prefix_list_entry
      content {
        cidr        = entry.value["cidr"]
        description = entry.value["description"]
      }
  }
}
