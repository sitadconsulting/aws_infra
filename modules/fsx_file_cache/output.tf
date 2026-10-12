output "fsx_file_cache_arn" {
  description = "File cache ARN"
  value       = element(concat(aws_fsx_file_cache.fsx_file_cache.*.arn, [""]), 0)
}
output "fsx_file_cache_data_repository_association_ids" {
  description = "A list of IDs of data repository associations that are associated with this cache"
  value       = element(concat(aws_fsx_file_cache.fsx_file_cache.*.data_repository_association_ids, [""]), 0)
}
output "fsx_file_cache_dns_name" {
  description = "File cache DNS Name"
  value       = element(concat(aws_fsx_file_cache.fsx_file_cache.*.dns_name, [""]), 0)
}
output "fsx_file_cache_file_cache_id" {
  description = "File cache System-generated Unique ID"
  value       = element(concat(aws_fsx_file_cache.fsx_file_cache.*.file_cache_id, [""]), 0)
}
output "fsx_file_cache_id" {
  description = "File cache System-generated Unique ID"
  value       = element(concat(aws_fsx_file_cache.fsx_file_cache.*.id, [""]), 0)
}
output "fsx_file_cache_network_interface_ids" {
  description = "File cache List of Network Interface IDs"
  value       = element(concat(aws_fsx_file_cache.fsx_file_cache.*.network_interface_ids, [""]), 0)
}
output "fsx_file_cache_vpc_id" {
  description = "File cache VPC ID"
  value       = element(concat(aws_fsx_file_cache.fsx_file_cache.*.vpc_id, [""]), 0)
}
