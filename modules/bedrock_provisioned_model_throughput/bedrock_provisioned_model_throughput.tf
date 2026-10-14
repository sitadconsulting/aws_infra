resource "aws_bedrock_provisioned_model_throughput" "bedrock_provisioned_model_throughput" {
  commitment_duration    = var.bedrock_provisioned_model_throughput_commitment_duration
  model_arn              = var.bedrock_provisioned_model_throughput_model_arn
  model_units            = var.bedrock_provisioned_model_throughput_model_units
  provisioned_model_name = var.bedrock_provisioned_model_throughput_provisioned_model_name
  tags                   = var.bedrock_provisioned_model_throughput_tags
}
