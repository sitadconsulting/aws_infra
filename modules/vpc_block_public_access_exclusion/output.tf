output "vpc_block_public_access_exclusion_id" {
  description = "ID of the VPC Block Public Access Exclusion"
  value       = element(concat(aws_vpc_block_public_access_exclusion.vpc_block_public_access_exclusion.*.id, [""]), 0)
}
output "vpc_block_public_access_exclusion_resource_arn" {
  description = "ARN the excluded resource"
  value       = element(concat(aws_vpc_block_public_access_exclusion.vpc_block_public_access_exclusion.*.resource_arn, [""]), 0)
}
