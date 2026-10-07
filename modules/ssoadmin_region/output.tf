output "ssoadmin_region_status" {
  description = "Current Region status. Valid values are ACTIVE, ADDING, and REMOVING"
  value       = element(concat(aws_ssoadmin_region.ssoadmin_region.*.status, [""]), 0)
}
