resource "aws_vpclattice_access_log_subscription" "vpclattice_access_log_subscription" {
  destination_arn     = var.vpclattice_access_log_subscription_destination_arn
  resource_identifier = var.vpclattice_access_log_subscription_resource_identifier
}
