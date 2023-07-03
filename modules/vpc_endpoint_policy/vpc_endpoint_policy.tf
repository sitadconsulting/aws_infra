resource "aws_vpc_endpoint_policy" "vpc_endpoint_policy" {
  policy          = var.vpc_endpoint_policy_policy
  vpc_endpoint_id = var.vpc_endpoint_policy_vpc_endpoint_id
}
