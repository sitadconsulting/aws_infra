resource "aws_lambdacore_network_connector" "lambdacore_network_connector" {
  name          = var.lambdacore_network_connector_name
  operator_role = var.lambdacore_network_connector_operator_role

  dynamic "configuration" {
    for_each = var.lambdacore_network_connector_configuration
      content {
        dynamic "vpc_egress_configuration" {
          for_each = var.lambdacore_network_connector_vpc_egress_configuration
            content {
              associated_compute_resource_types = vpc_egress_configuration.value["associated_compute_resource_types"]
              network_protocol                  = vpc_egress_configuration.value["network_protocol"]
              security_group_ids                = vpc_egress_configuration.value["security_group_ids"]
              subnet_ids                        = vpc_egress_configuration.value["subnet_ids"]
            }
        }
      }
  }
}
