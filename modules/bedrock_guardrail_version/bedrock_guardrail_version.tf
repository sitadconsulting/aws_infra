resource "aws_bedrock_guardrail_version" "bedrock_guardrail_version" {
  description   = var.bedrock_guardrail_version_description
  guardrail_arn = var.bedrock_guardrail_version_guardrail_arn
  skip_destroy  = var.bedrock_guardrail_version_skip_destroy
}
