resource "kubernetes_service_v1" "service" {

  metadata {
    annotations = var.service_metadata_annotations
    labels      = var.service_metadata_labels
    name        = var.service_metadata_name
    namespace   = var.service_metadata_namespace
  }
  wait_for_load_balancer = var.service_wait_for_load_balancer

  spec {
    allocate_load_balancer_node_ports = var.service_spec_allocate_load_balancer_node_ports
    cluster_ip                        = var.service_spec_cluster_ip
    cluster_ips                       = var.service_spec_cluster_ips
    external_ips                      = var.service_spec_external_ips
    external_name                     = var.service_spec_external_name
    external_traffic_policy           = var.service_spec_external_traffic_policy
    ip_families                       = var.service_spec_ip_families
    ip_family_policy                  = var.service_spec_ip_family_policy
    internal_traffic_policy           = var.service_spec_internal_traffic_policy
    load_balancer_class               = var.service_spec_load_balancer_class
    load_balancer_ip                  = var.service_spec_load_balancer_ip
    load_balancer_source_ranges       = var.service_spec_load_balancer_source_ranges
    publish_not_ready_addresses       = var.service_spec_publish_not_ready_addresses
    session_affinity                  = var.service_spec_session_affinity
    type                              = var.service_spec_type
    health_check_node_port            = var.service_spec_health_check_node_port
    selector                          = var.service_spec_selector

    dynamic "port" {
      for_each   = var.service_spec_port
        content {
          app_protocol = port.value["app_protocol"]
          name         = port.value["name"]
          node_port    = port.value["node_port"]
          port         = port.value["port"]
          protocol     = port.value["protocol"]
          target_port  = port.value["target_port"]
        }
    }
    dynamic "session_affinity_config" {
      for_each  = var.service_spec_session_affinity_config
        content {
          dynamic "client_ip" {
            for_each = session_affinity_config.value.client_ip
              content {
                timeout_seconds = client_ip.value["timeout_seconds"]
              }
          }
        }
    }
  }
  lifecycle {
    ignore_changes = all
    #ignore_changes = [
      #spec[0].cluster_ip,
      #spec[0].cluster_ips,
      #spec[0].external_ips,
      #status[0].load_balancer[0].ingress[0].hostname
    #]
  }
}
