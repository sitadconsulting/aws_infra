resource "aws_sagemaker_code_repository" "sagemaker_code_repository" {
  code_repository_name = var.sagemaker_code_repository_code_repository_name
  tags                 = var.sagemaker_code_repository_code_repository_tags

  dynamic "git_config" {
    for_each = var.sagemaker_code_repository_git_config
      content {
        repository_url = git_config.value["repository_url"]
        branch         = git_config.value["branch"]
        secret_arn     = git_config.value["secret_arn"]
      }
  }
}
