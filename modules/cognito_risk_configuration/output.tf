output "cognito_risk_configuration_id" {
  description = "The user pool ID or the user pool ID and Client Id separated by a : if the configuration is client specific"
  value       = element(concat(aws_cognito_risk_configuration.cognito_risk_configuration.*.id, [""]), 0)
}
