output "vpc_endpoint_id" {
  description = "The ID of the VPC endpoint"
  value       = element(concat(aws_vpc_endpoint_policy.vpc_endpoint_policy.*.id, [""]), 0)
}
