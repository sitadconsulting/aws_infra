output "customerprofiles_profile_id" {
  description = "The identifier of the Customer Profiles Profile"
  value       = element(concat(aws_customerprofiles_profile.customerprofiles_profile.*.id, [""]), 0)
}
