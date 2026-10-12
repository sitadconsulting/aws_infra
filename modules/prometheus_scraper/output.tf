output "prometheus_scraper_arn" {
  description = "ARN of the new scraper"
  value       = element(concat(aws_prometheus_scraper.prometheus_scraper.*.arn, [""]), 0)
}
output "prometheus_scraper_role_arn" {
  description = "ARN of the IAM role that provides permissions for the scraper to discover, collect, and produce metrics"
  value       = element(concat(aws_prometheus_scraper.prometheus_scraper.*.role_arn, [""]), 0)
}
#output "prometheus_scraper_status" {
#  description = "Status of the scraper. One of ACTIVE, CREATING, DELETING, CREATION_FAILED, DELETION_FAILED"
#  value       = element(concat(aws_prometheus_scraper.prometheus_scraper.*.status, [""]), 0)
#}
