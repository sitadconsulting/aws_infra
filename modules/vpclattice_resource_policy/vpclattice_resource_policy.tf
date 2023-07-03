resource "aws_vpclattice_resource_policy" "vpclattice_resource_policy" {
  policy       = var.vpclattice_resource_policy_policy
  resource_arn = var.vpclattice_resource_policy_resource_arn
}
