resource "aws_connect_hours_of_operation" "connect_hours_of_operation" {
  description = var.connect_hours_of_operation_description
  instance_id = var.connect_hours_of_operation_instance_id
  name        = var.connect_hours_of_operation_name
  tags        = var.connect_hours_of_operation_tags
  time_zone   = var.connect_hours_of_operation_time_zone

  dynamic "config" {
    for_each = var.connect_hours_of_operation_config
      content {
        day = config.value["day"]
        dynamic "end_time" {
          for_each = config.value.end_time
            content {
              hours   = end_time.value["hours"] 
              minutes = end_time.value["minutes"]
            }
        }
        dynamic "start_time" {
          for_each = config.value.start_time
            content {
              hours   = start_time.value["hours"]
              minutes = start_time.value["minutes"]
            }
        }
      }
  }
}
