resource "aws_glue_workflow" "glue_workflow" {
  description            = var.glue_workflow_description
  default_run_properties = var.glue_workflow_default_run_properties
  max_concurrent_runs    = var.glue_workflow_max_concurrent_runs
  name                   = var.glue_workflow_name
  tags                   = var.glue_workflow_tags
}

