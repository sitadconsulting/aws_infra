output "appfabric_app_bundle_arn" {
  description = "ARN of the AppBundle"
  value       = element(concat(aws_appfabric_app_bundle.appfabric_app_bundle.*.arn, [""]), 0)
}
