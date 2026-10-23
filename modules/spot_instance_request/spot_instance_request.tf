resource "aws_spot_instance_request" "spot_instance_request" {
  instance_interruption_behavior = var.spot_instance_request_instance_interruption_behavior
  launch_group                   = var.spot_instance_request_launch_group
  spot_price                     = var.spot_instance_request_spot_price
  spot_type                      = var.spot_instance_request_spot_type
  tags                           = var.spot_instance_request_tags
  valid_from                     = var.spot_instance_request_valid_from
  valid_until                    = var.spot_instance_request_valid_until
  wait_for_fulfillment           = var.spot_instance_request_wait_for_fulfillment
}
