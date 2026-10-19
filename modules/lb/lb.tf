resource "aws_lb" "lb" {
  client_keep_alive                                            = var.lb_client_keep_alive 
  customer_owned_ipv4_pool                                     = var.lb_customer_owned_ipv4_pool
  desync_mitigation_mode                                       = var.lb_desync_mitigation_mode
  dns_record_client_routing_policy                             = var.lb_dns_record_client_routing_policy
  drop_invalid_header_fields                                   = var.lb_drop_invalid_header_fields
  enable_cross_zone_load_balancing                             = var.lb_enable_cross_zone_load_balancing
  enable_deletion_protection                                   = var.lb_enable_deletion_protection
  enable_http2                                                 = var.lb_enable_http2
  enable_prefix_for_ipv6_source_nat                            = var.lb_enable_prefix_for_ipv6_source_nat
  enable_tls_version_and_cipher_suite_headers                  = var.lb_enable_tls_version_and_cipher_suite_headers  
  enable_xff_client_port                                       = var.lb_enable_xff_client_port
  enable_waf_fail_open                                         = var.lb_enable_waf_fail_open
  enable_zonal_shift                                           = var.lb_enable_zonal_shift 
  enforce_security_group_inbound_rules_on_private_link_traffic = var.lb_enforce_security_group_inbound_rules_on_private_link_traffic
  idle_timeout                                                 = var.lb_idle_timeout
  internal                                                     = var.lb_internal
  ip_address_type                                              = var.lb_ip_address_type
  ipam_pools                                                   = var.lb_ipam_pools 
  load_balancer_type                                           = var.lb_load_balancer_type
  name                                                         = var.lb_name
  name_prefix                                                  = var.lb_name_prefix
  security_groups                                              = var.lb_security_groups
  preserve_host_header                                         = var.lb_preserve_host_header
  secondary_ips_auto_assigned_per_subnet                       = var.lb_secondary_ips_auto_assigned_per_subnet 
  subnets                                                      = var.lb_subnets
  tags                                                         = var.lb_tags
  xff_header_processing_mode                                   = var.lb_xff_header_processing_mode

  dynamic "access_logs" {
    for_each = var.lb_access_logs
      content {
        bucket  = access_logs.value["bucket"]
        enabled = access_logs.value["enabled"]
        prefix  = access_logs.value["prefix"]
      }
  }
  dynamic "connection_logs" {
    for_each = var.lb_connection_logs
      content {
        bucket  = connection_logs.value["bucket"]
        enabled = connection_logs.value["enabled"]
        prefix  = connection_logs.value["prefix"]
      }
  }
  dynamic "health_check_logs" {
    for_each = var.lb_health_check_logs
      content {
        bucket  = health_check_logs.value["bucket"]
        enabled = health_check_logs.value["enabled"]
        prefix  = health_check_logs.value["prefix"]
      }
  }
  dynamic "ipam_pools" {
    for_each = var.lb_ipam_pools
      content {
        ipv4_ipam_pool_id = ipam_pools.value["ipv4_ipam_pool_id"]
      }
  }
  dynamic "minimum_load_balancer_capacity" {
    for_each = var.lb_minimum_load_balancer_capacity
      content {
        capacity_units = minimum_load_balancer_capacity.value["capacity_units"]
      }
  }
  dynamic "subnet_mapping" {
    for_each = var.lb_subnet_mapping
      content {
        subnet_id            = subnet_mapping.value["subnet_id"]
        allocation_id        = subnet_mapping.value["allocation_id"]
        ipv6_address         = subnet_mapping.value["ipv6_address"]
        private_ipv4_address = subnet_mapping.value["private_ipv4_address"] 
      }
  }
}
