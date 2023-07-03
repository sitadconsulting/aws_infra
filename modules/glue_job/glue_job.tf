resource "aws_glue_job" "glue_job" {
  connections               = var.glue_job_connections
  default_arguments         = var.glue_job_default_arguments
  description               = var.glue_job_description
  execution_class           = var.glue_job_execution_class
  glue_version              = var.glue_job_glue_version
  max_capacity              = var.glue_job_max_capacity
  max_retries               = var.glue_job_max_retries
  name                      = var.glue_job_name
  non_overridable_arguments = var.glue_job_non_overridable_arguments
  number_of_workers         = var.glue_job_number_of_workers
  role_arn                  = var.glue_job_role_arn
  security_configuration    = var.glue_job_security_configuration
  tags                      = var.glue_job_tags
  timeout                   = var.glue_job_timeout
  worker_type               = var.glue_job_worker_type

  dynamic "command" {
    for_each = var.glue_job_command
      content {
        name            = command.value["name"]
        script_location = command.value["script_location"]
        python_version  = command.value["python_version"]
      }
  }
  dynamic "execution_property" {
    for_each = var.glue_job_execution_property
      content {
        max_concurrent_runs = execution_property.value["max_concurrent_runs"]
      }
  }
  dynamic "notification_property" {
    for_each = var.glue_job_notification_property
      content {
        notify_delay_after = notification_property.value["notify_delay_after"]
      }
  }
}
