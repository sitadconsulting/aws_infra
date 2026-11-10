resource "aws_connect_contact_flow" "connect_contact_flow" {
  content      = var.connect_contact_flow_content
  content_hash = var.connect_contact_flow_content_hash
  description  = var.connect_contact_flow_description
  filename     = var.connect_contact_flow_filename
  instance_id  = var.connect_contact_flow_instance_id
  name         = var.connect_contact_flow_name
  tags         = var.connect_contact_flow_tags
  type         = var.connect_contact_flow_type
}
