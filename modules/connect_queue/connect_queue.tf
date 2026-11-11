resource "aws_connect_queue" "connect_queue" {
  description           = var.connect_queue_description
  hours_of_operation_id = var.connect_queue_hours_of_operation_id
  instance_id           = var.connect_queue_instance_id
  max_contacts          = var.connect_queue_max_contacts
  name                  = var.connect_queue_name
  quick_connect_ids     = var.connect_queue_quick_connect_ids
  status                = var.connect_queue_status 
  tags                  = var.connect_queue_tags

  dynamic "outbound_caller_config" {
    for_each = var.connect_queue_outbound_caller_config
      content {
        outbound_caller_id_name      = outbound_caller_config.value["outbound_caller_id_name"]
        outbound_caller_id_number_id = outbound_caller_config.value["outbound_caller_id_number_id"] 
        outbound_flow_id             = outbound_caller_config.value["outbound_flow_id"]
      }
  }
}
