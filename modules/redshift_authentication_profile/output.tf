output "redshift_authentication_profile_id" {
  description = "The name of the authentication profile"
  value       = element(concat(aws_redshift_authentication_profile.redshift_authentication_profile.*.id, [""]), 0)
}
