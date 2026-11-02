resource "aws_oam_link" "oam_link" {
  label_template  = var.oam_link_label_template
  resource_types  = var.oam_link_resource_types
  sink_identifier = var.oam_link_sink_identifier
  tags            = var.oam_link_tags

  dynamic "link_configuration" {
    for_each = var.oam_link_link_configuration
      content {
        dynamic "log_group_configuration" {
          for_each = link_configuration.value.log_group_configuration
            content {
              filter = log_group_configuration.value["filter"]      
            }
        }
        dynamic "metric_configuration" {
          for_each = link_configuration.value.metric_configuration
            content {
              filter = metric_configuration.value["filter"]
            }
        }
      }
  }
}
