resource "aws_ec2_transit_gateway_policy_table" "ec2_transit_gateway_policy_table" {
  transit_gateway_id = var.ec2_transit_gateway_policy_table_transit_gateway_id
  tags               = var.ec2_transit_gateway_policy_table_tags 
}
