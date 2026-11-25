resource "aws_lambdaweb_resource_policy" "lambdaweb_resource_policy" {
  policy       = var.lambdaweb_resource_policy_policy
  resource_arn = var.lambdaweb_resource_policy_resource_arn
}
