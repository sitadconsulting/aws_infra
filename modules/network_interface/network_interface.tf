resource "aws_network_interface" "network_interface" {
  description     = var.network_interface_description
  subnet_id       = var.network_interface_subnet_id
  security_groups = var.network_interface_security_groups


  tags = merge(
    {
      "Name" = format(
        "%s-%s-%s",
        var.name,
        var.network_interface_description,
        var.environment,
      )
    },
    var.tags,
    var.network_interface_tags,
  )
}
