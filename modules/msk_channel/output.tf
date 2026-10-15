output "msk_channel_arn" {
  description = "ARN of the Channel"
  value       = element(concat(aws_msk_channel.msk_channel.*.arn, [""]), 0)
}
output "msk_channel_destination_type" {
  description = "Type of destination configured for the channel"
  value       = element(concat(aws_msk_channel.msk_channel.*.destination_type, [""]), 0)
}
