output "bedrock_provisioned_model_throughput_provisioned_model_arn" {
  description = "The ARN of the Provisioned Throughput"
  value       = element(concat(aws_bedrock_provisioned_model_throughput.bedrock_provisioned_model_throughput.*.provisioned_model_arn, [""]), 0)
}
