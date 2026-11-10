output "config_conformance_pack_arn" {
  description = "ARN of the conformance pack"
  value       = element(concat(aws_config_conformance_pack.config_conformance_pack.*.arn, [""]), 0)
}
