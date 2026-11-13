resource "aws_datasync_agent" "datasync_agent" {
  activation_key        = var.datasync_agent_activation_key
  ip_address            = var.datasync_agent_ip_address
  name                  = var.datasync_agent_name
  private_link_endpoint = var.datasync_agent_private_link_endpoint
  security_group_arns   = var.datasync_agent_security_group_arns
  subnet_arns           = var.datasync_agent_subnet_arns
  tags                  = var.datasync_agent_tags
  vpc_endpoint_id       = var.datasync_agent_vpc_endpoint_id
}
