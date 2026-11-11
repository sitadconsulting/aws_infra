output "connect_security_profile_arn" {
  description = "ARN of the Security Profile"
  value       = element(concat(aws_connect_security_profile.connect_security_profile.*.arn, [""]), 0)
}
output "connect_security_profile_organization_resource_id" {
  description = "The organization resource identifier for the security profile"
  value       = element(concat(aws_connect_security_profile.connect_security_profile.*.organization_resource_id, [""]), 0)
}
output "connect_security_profile_security_profile_id" {
  description = "The identifier for the Security Profile"
  value       = element(concat(aws_connect_security_profile.connect_security_profile.*.security_profile_id, [""]), 0)
}
output "connect_security_profile_id" {
  description = "The identifier of the hosting Amazon Connect Instance and identifier of the Security Profile separated by a colon (:)"
  value       = element(concat(aws_connect_security_profile.connect_security_profile.*.id, [""]), 0)
}
