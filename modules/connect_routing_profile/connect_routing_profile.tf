resource "aws_connect_routing_profile" "connect_routing_profile" {
  default_outbound_queue_id = var.connect_routing_profile_default_outbound_queue_id
  description               = var.connect_routing_profile_description
  instance_id               = var.connect_routing_profile_instance_id
  name                      = var.connect_routing_profile_name
  tags                      = var.connect_routing_profile_tags
  
  dynamic "media_concurrencies" {
    for_each = var.connect_routing_profile_media_concurrencies
      content {
        channel     = media_concurrencies.value["channel"]
        concurrency = media_concurrencies.value["concurrency"] 
        dynamic "cross_channel_behavior" {
          for_each = media_concurrencies.value.cross_channel_behavior
            content {
              behavior_type = cross_channel_behavior.value["behavior_type"]
            }
        }
      }
  }
  dynamic "queue_configs" {
    for_each = var.connect_routing_profile_queue_configs
      content {
        channel  = queue_configs.value["channel"]
        delay    = queue_configs.value["delay"]
        priority = queue_configs.value["priority"]
        queue_id = queue_configs.value["queue_id"]
      }
  }
}
