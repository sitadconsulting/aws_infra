output "vpclattice_auth_policy_state" {
  description = "The state of the auth policy. The auth policy is only active when the auth type is set to AWS_IAM"
  value       = element(concat(aws_vpclattice_auth_policy.vpclattice_auth_policy.*.state, [""]), 0)
}
