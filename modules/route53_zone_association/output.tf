output "id" {
  description = "The calculated unique identifier for the association"
  value       = element(concat(aws_route53_zone_association.route53_zone_association.*.id, [""]), 0)
}
output "owning_account" {
  description = "The account ID of the account that created the hosted"
  value       = element(concat(aws_route53_zone_association.route53_zone_association.*.owning_account, [""]), 0)
}

