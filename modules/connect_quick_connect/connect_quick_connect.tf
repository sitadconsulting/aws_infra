resource "aws_connect_quick_connect" "connect_quick_connect" {
  description = var.connect_quick_connect_description
  instance_id = var.connect_quick_connect_instance_id
  name        = var.connect_quick_connect_name
  tags        = var.connect_quick_connect_tags

  dynamic "quick_connect_config" {
    for_each = var.connect_quick_connect_quick_connect_config
      content {
        quick_connect_type = quick_connect_config.value["quick_connect_type"]      
        dynamic "phone_config" {
          for_each = quick_connect_config.value.phone_config
            content {
              phone_number = phone_config.value["phone_number"]
            }
        }
        dynamic "queue_config" {
          for_each = quick_connect_config.value.queue_config
            content {
              contact_flow_id = queue_config.value["contact_flow_id"]
              queue_id        = queue_config.value["queue_id"]
            }
        }
        dynamic "user_config" {
          for_each = quick_connect_config.value.user_config
            content {
              contact_flow_id = user_config.value["contact_flow_id"]
              user_id         = user_config.value["user_id"]
            }
        }
      }
  }
}
