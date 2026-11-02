output "oam_sink_arn" {
  description = "ARN of the Sink"
  value       = element(concat(aws_oam_sink.oam_sink.*.arn, [""]), 0)
}
output "oam_sink_id" {
  description = "ARN of the Sink. Use arn instead"
  value       = element(concat(aws_oam_sink.oam_sink.*.id, [""]), 0)
}
output "oam_sink_sink_id" {
  description = "ID string that AWS generated as part of the sink ARN"
  value       = element(concat(aws_oam_sink.oam_sink.*.sink_id, [""]), 0)
}
