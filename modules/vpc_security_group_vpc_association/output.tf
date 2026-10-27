output "vpc_security_group_vpc_association_state" {
  description = "State of the VPC association"
  value       = element(concat(aws_vpc_security_group_vpc_association.vpc_security_group_vpc_association.*.state, [""]), 0)
}
