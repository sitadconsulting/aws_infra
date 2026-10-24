resource "aws_network_interface" "network_interface" {
  description               = var.network_interface_description
  enable_primary_ipv6       = var.network_interface_enable_primary_ipv6
  interface_type            = var.network_interface_interface_type
  ipv4_prefix_count         = var.network_interface_ipv4_prefix_count
  ipv4_prefixes             = var.network_interface_ipv4_prefixes
  ipv6_address_count        = var.network_interface_ipv6_address_count
  ipv6_address_list_enabled = var.network_interface_ipv6_address_list_enabled
  ipv6_address_list         = var.network_interface_ipv6_address_list
  ipv6_addresses            = var.network_interface_ipv6_addresses
  ipv6_prefix_count         = var.network_interface_ipv6_prefix_count   
  ipv6_prefixes             = var.network_interface_ipv6_prefixes
  private_ip_list           = var.network_interface_private_ip_list
  private_ip_list_enabled   = var.network_interface_private_ip_list_enabled
  private_ips               = var.network_interface_private_ips
  private_ips_count         = var.network_interface_private_ips_count
  security_groups           = var.network_interface_security_groups
  source_dest_check         = var.network_interface_source_dest_check
  subnet_id                 = var.network_interface_subnet_id
  tags                      = var.network_interface_tags

  dynamic "attachment" {
    for_each = var.network_interface_attachment
      content {
        instance           = attachment.value["instance"]
        device_index       = attachment.value["device_index"]
        network_card_index = attachment.value["network_card_index"]
      }
  }
  dynamic "connection_tracking_specification" {
    for_each = var.network_interface_connection_tracking_specification
      content {
        tcp_established_timeout = connection_tracking_specification.value["tcp_established_timeout"]
        udp_stream_timeout      = connection_tracking_specification.value["udp_stream_timeout"]
        udp_timeout             = connection_tracking_specification.value["udp_timeout"]
      }
  }
  dynamic "ena_srd_specification" {
    for_each = var.network_interface_ena_srd_specification
      content {
        ena_srd_enabled = ena_srd_specification.value["ena_srd_enabled"]
        dynamic "ena_srd_udp_specification" {
          for_each = ena_srd_specification.value.ena_srd_udp_specification
            content {
              ena_srd_udp_enabled = ena_srd_udp_specification.value["ena_srd_udp_enabled"]
            }
        }
      }
  }
}
