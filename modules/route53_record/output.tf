output "route53_record_name" {
  description = "The name of the record"
  value       = element(concat(aws_route53_record.route53_record.*.name, [""]), 0)
}
output "route53_record_fqdn" {
  description = "FQDN built using the zone domain and name"
  value       = element(concat(aws_route53_record.route53_record.*.fqdn, [""]), 0)
}

