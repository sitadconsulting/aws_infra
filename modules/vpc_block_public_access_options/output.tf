output "vpc_block_public_access_options_aws_account_id" {
  description = "AWS account ID to which these options apply"
  value       = element(concat(aws_vpc_block_public_access_options.vpc_block_public_access_options.*.aws_account_id, [""]), 0)
}
output "vpc_block_public_access_options_aws_region" {
  description = "AWS region to which these options apply"
  value       = element(concat(aws_vpc_block_public_access_options.vpc_block_public_access_options.*.aws_region, [""]), 0)
}
