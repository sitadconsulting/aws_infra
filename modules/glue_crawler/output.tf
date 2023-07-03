output "glue_crawler_id" {
  description = "Crawler name"
  value       = element(concat(aws_glue_crawler.glue_crawler.*.id, [""]), 0)
}
output "glue_crawler_arn" {
  description = "ARN of the crawler"
  value       = element(concat(aws_glue_crawler.glue_crawler.*.arn, [""]), 0)
}
