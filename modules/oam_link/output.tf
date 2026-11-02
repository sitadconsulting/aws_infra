output "oam_link_arn" {
  description = "ARN of the link"
  value       = element(concat(aws_oam_link.oam_link.*.arn, [""]), 0)
}
output "oam_link_id" {
  description = "ARN of the link. Use arn instead"
  value       = element(concat(aws_oam_link.oam_link.*.id, [""]), 0)
}
output "oam_link_label" {
  description = "Label that is assigned to this link"
  value       = element(concat(aws_oam_link.oam_link.*.label, [""]), 0)
}
output "oam_link_link_id" {
  description = " ID string that AWS generated as part of the link ARN"
  value       = element(concat(aws_oam_link.oam_link.*.link_id, [""]), 0)
}
output "oam_link_sink_arn" {
  description = " ARN of the sink that is used for this link"
  value       = element(concat(aws_oam_link.oam_link.*.sink_arn, [""]), 0)
}
