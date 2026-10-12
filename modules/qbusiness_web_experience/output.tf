output "qbusiness_web_experience_created_at" {
  description = "The Unix timestamp when the Amazon Q Business application was last updated"
  value       = element(concat(awscc_qbusiness_web_experience.qbusiness_web_experience.*.created_at, [""]), 0)
}
output "qbusiness_web_experience_default_endpoint" {
  description = "The endpoint URLs for your Amazon Q Business web experience. The URLs are unique and fully hosted by AWS"
  value       = element(concat(awscc_qbusiness_web_experience.qbusiness_web_experience.*.default_endpoint, [""]), 0)
}
output "qbusiness_web_experience_status" {
  description = "The status of your Amazon Q Business web experience"
  value       = element(concat(awscc_qbusiness_web_experience.qbusiness_web_experience.*.status, [""]), 0)
}
output "qbusiness_web_experience_updated_at" {
  description = "The Unix timestamp when your Amazon Q Business web experience was updated"
  value       = element(concat(awscc_qbusiness_web_experience.qbusiness_web_experience.*.updated_at, [""]), 0)
}
output "qbusiness_web_experience_web_experience_arn" {
  description = "ARN of an Amazon Q Business web experience"
  value       = element(concat(awscc_qbusiness_web_experience.qbusiness_web_experience.*.web_experience_arn, [""]), 0)
}
output "qbusiness_web_experience_web_experience_id" {
  description = "The identifier of your Amazon Q Business web experience"
  value       = element(concat(awscc_qbusiness_web_experience.qbusiness_web_experience.*.web_experience_id, [""]), 0)
}
