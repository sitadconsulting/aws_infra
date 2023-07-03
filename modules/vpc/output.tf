output "vpc_id" {
  description = "The ID of the VPC"
  value       = element(concat(aws_vpc.vpc.*.id, [""]), 0)
}
output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = element(concat(aws_vpc.vpc.*.enable_dns_support, [""]), 0)
}
output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = element(concat(aws_vpc.vpc.*.enable_dns_hostnames, [""]), 0)
}
