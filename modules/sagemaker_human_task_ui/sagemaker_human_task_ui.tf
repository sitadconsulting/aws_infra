resource "aws_sagemaker_human_task_ui" "sagemaker_human_task_ui" {
  human_task_ui_name = var.sagemaker_human_task_ui_human_task_ui_name
  tags               = var.sagemaker_human_task_ui_tags

  dynamic "ui_template" {
    for_each = var.sagemaker_human_task_ui_ui_template
      content {
        content        = ui_template.value["content"]
      }
  }
}
