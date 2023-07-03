resource "aws_vpclattice_auth_policy" "vpclattice_auth_policy" {
  policy              = var.vpclattice_auth_policy_policy
  resource_identifier = var.vpclattice_auth_policy_resource_identifier
}
