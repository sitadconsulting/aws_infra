output "devopsagent_asset_asset_id" {
  description = "Identifier of the asset"
  value       = element(concat(aws_devopsagent_asset.devopsagent_asset.*.asset_id, [""]), 0)
}
output "devopsagent_asset_created_at" {
  description = "Creation timestamp in RFC 3339 format"
  value       = element(concat(aws_devopsagent_asset.devopsagent_asset.*.created_at, [""]), 0)
}
output "devopsagent_asset_metadata_actual" {
  description = "Full JSON metadata returned by AWS, including retained fields and service-provided defaults"
  value       = element(concat(aws_devopsagent_asset.devopsagent_asset.*.metadata_actual, [""]), 0)
}
output "devopsagent_asset_updated_at" {
  description = "Last update timestamp in RFC 3339 format"
  value       = element(concat(aws_devopsagent_asset.devopsagent_asset.*.updated_at, [""]), 0)
}
output "devopsagent_asset_version" {
  description = "Current asset version"
  value       = element(concat(aws_devopsagent_asset.devopsagent_asset.*.version, [""]), 0)
}
