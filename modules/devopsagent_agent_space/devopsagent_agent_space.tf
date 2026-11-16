resource "aws_devopsagent_agent_space" "devopsagent_agent_space" {
  description = var.devopsagent_agent_space_description
  kms_key_arn = var.devopsagent_agent_space_kms_key_arn
  locale      = var.devopsagent_agent_space_locale
  name        = var.devopsagent_agent_space_name
  tags        = var.devopsagent_agent_space_tags
}
