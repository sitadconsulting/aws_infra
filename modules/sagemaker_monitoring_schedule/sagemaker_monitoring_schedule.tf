resource "aws_sagemaker_monitoring_schedule" "sagemaker_monitoring_schedule" {
  name = var.sagemaker_monitoring_schedule_name
  tags = var.sagemaker_monitoring_schedule_tags
  
  dynamic "monitoring_schedule_config" {
    for_each = var.sagemaker_monitoring_schedule_monitoring_schedule_config
      content {
        monitoring_job_definition_name = monitoring_schedule_config.value["monitoring_job_definition_name"]
        monitoring_type                = monitoring_schedule_config.value["monitoring_type"]
        dynamic "schedule_config" {
          for_each = monitoring_schedule_config.value.schedule_config
            content {
              schedule_expression = schedule_config.value["schedule_expression"]
            }
        }
      }
  }
}
