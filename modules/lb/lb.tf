resource "aws_lb" "lb" {

  customer_owned_ipv4_pool                    = var.lb_customer_owned_ipv4_pool
  desync_mitigation_mode                      = var.lb_desync_mitigation_mode
  drop_invalid_header_fields                  = var.lb_drop_invalid_header_fields
  enable_cross_zone_load_balancing            = var.lb_enable_cross_zone_load_balancing
  enable_deletion_protection                  = var.lb_enable_deletion_protection
  enable_http2                                = var.lb_enable_http2
  enable_tls_version_and_cipher_suite_headers = var.lb_enable_tls_version_and_cipher_suite_headers  
  enable_xff_client_port                      = var.lb_enable_xff_client_port
  enable_waf_fail_open                        = var.lb_enable_waf_fail_open
  idle_timeout                                = var.lb_idle_timeout
  internal                                    = var.lb_internal
  ip_address_type                             = var.lb_ip_address_type
  load_balancer_type                          = var.lb_load_balancer_type
  name                                        = var.lb_name
  security_groups                             = var.lb_security_groups
  preserve_host_header                        = var.lb_preserve_host_header
  subnets                                     = var.lb_subnets
  xff_header_processing_mode                  = var.lb_xff_header_processing_mode
  tags                                        = var.lb_tags

  dynamic "access_logs" {
    for_each = var.lb_access_logs
      content {
        bucket  = access_logs.value["bucket"]
        enabled = access_logs.value["enabled"]
        prefix  = access_logs.value["prefix"]
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
