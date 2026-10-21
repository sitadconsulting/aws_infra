output "lakeformation_resource_last_modified" {
  description = "Date and time the resource was last modified in RFC 3339 format"
  value       = element(concat(aws_lakeformation_resource.lakeformation_resource.*.last_modified, [""]), 0)
}
