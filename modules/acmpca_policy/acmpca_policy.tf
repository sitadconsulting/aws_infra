resource "aws_acmpca_policy" "acmpca_policy" {
  resource_arn = var.acmpca_policy_resource_arn
  policy       = var.acmpca_policy_policy
}
