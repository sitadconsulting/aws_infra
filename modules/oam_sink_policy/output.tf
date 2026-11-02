output "oam_sink_policy_arn" {
  description = "ARN of the Sink"
  value       = element(concat(aws_oam_sink_policy.oam_sink_policy.*.arn, [""]), 0)
}
output "oam_sink_policy_sink_id" {
  description = "ID string that AWS generated as part of the sink ARN"
  value       = element(concat(aws_oam_sink_policy.oam_sink_policy.*.sink_id, [""]), 0)
}
