output "route53_zone_arn" {
  description = "The Amazon Resource Name (ARN) of the Hosted Zone"
  value       = element(concat(aws_route53_zone.route53_zone.*.arn, [""]), 0)
}
output "route53_zone_id" {
  description = "The Hosted Zone ID"
  value       = element(concat(aws_route53_zone.route53_zone.*.zone_id, [""]), 0)
}
output "route53_zone_name_servers" {
  description = "A list of name servers in associated (or default) delegation set"
  value       = element(concat(aws_route53_zone.route53_zone.*.name_servers, [""]), 0)
}
output "route53_zone_primary_name_server" {
  description = "The Route 53 name server that created the SOA record"
  value       = element(concat(aws_route53_zone.route53_zone.*.primary_name_server, [""]), 0)
}
