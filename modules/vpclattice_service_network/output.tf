output "vpclattice_service_network_arn" {
  description = "ARN of the target group"
  value       = element(concat(aws_vpclattice_service_network.vpclattice_service_network.*.arn, [""]), 0)
}

