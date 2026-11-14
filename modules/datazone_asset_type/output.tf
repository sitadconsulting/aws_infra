output "datazone_asset_type_created_at" {
  description = "The timestamp when the custom asset type was created"
  value       = element(concat(aws_datazone_asset_type.datazone_asset_type.*.created_at, [""]), 0)
}
output "datazone_asset_type_created_by" {
  description = "The user who created the custom asset type"
  value       = element(concat(aws_datazone_asset_type.datazone_asset_type.*.created_by, [""]), 0)
}
output "datazone_asset_type_revision" {
  description = "The revision of the asset type"
  value       = element(concat(aws_datazone_asset_type.datazone_asset_type.*.revision, [""]), 0)
}
