output "release_manifest" {
  description = "The rendered manifest of the release as JSON"
  value       = element(concat(helm_release.release.*.manifest, [""]), 0)
}
output "release_metadata" {
  description = "Status of the deployed release"
  value       = element(concat(helm_release.release.*.metadata, [""]), 0)
}
output "release_status" {
  description = "Status of the release"
  value       = element(concat(helm_release.release.*.status, [""]), 0)
}

