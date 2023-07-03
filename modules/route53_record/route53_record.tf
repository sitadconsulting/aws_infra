resource "aws_route53_record" "route53_record" {
  zone_id                          = var.route53_record_zone_id
  name                             = var.route53_record_name
  type                             = var.route53_record_type
  ttl                              = var.route53_record_ttl
  records                          = var.route53_record_records
  set_identifier                   = var.route53_record_set_identifier
  health_check_id                  = var.route53_record_health_check_id
  multivalue_answer_routing_policy = var.route53_record_multivalue_answer_routing_policy
  allow_overwrite                  = var.route53_record_allow_overwrite 
  
  dynamic "alias" {
    for_each = var.route53_record_alias
      content {
        name                   = alias.value["name"]
        zone_id                = alias.value["zone_id"]
        evaluate_target_health = alias.value["evaluate_target_health"]
      }
  }
  #dynamic "cidr_routing_policy" {
  #  for_each = var.route53_record_cidr_routing_policy
  #    content {
  #      collection_id = cidr_routing_policy.value["collection_id"]
  #      location_name = cidr_routing_policy.value["location_name"]
  #    }
  #}
  dynamic "failover_routing_policy" {
    for_each = var.route53_record_failover_routing_policy
      content {
        type = failover_routing_policy.value["failover_routing_policy"]
      }
  }
  dynamic "geolocation_routing_policy" {
    for_each = var.route53_record_geolocation_routing_policy
      content {
        continent   = geolocation_routing_policy.value["continent"]
        country     = geolocation_routing_policy.value["country"]
        subdivision = geolocation_routing_policy.value["subdivision"]
      }
  }
  dynamic "latency_routing_policy" {
    for_each = var.route53_record_latency_routing_policy
      content {
        region = latency_routing_policy.value["region"]
      }
  }
  dynamic "weighted_routing_policy" {
    for_each = var.route53_record_weighted_routing_policy
      content {
        weight = weighted_routing_policy.value["weight"]
      }
  }
}
