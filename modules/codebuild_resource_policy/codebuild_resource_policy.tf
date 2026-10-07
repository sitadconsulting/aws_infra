resource "aws_codebuild_resource_policy" "codebuild_resource_policy" {
  policy       = var.codebuild_resource_policy_policy
  resource_arn = var.codebuild_resource_policy_resource_arn
}
