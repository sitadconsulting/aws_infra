resource "aws_connect_contact_flow_module" "connect_contact_flow_module" {
  content      = var.connect_contact_flow_module_content
  content_hash = var.connect_contact_flow_module_content_hash
  description  = var.connect_contact_flow_module_description
  filename     = var.connect_contact_flow_module_filename
  instance_id  = var.connect_contact_flow_module_instance_id
  name         = var.connect_contact_flow_module_name
  tags         = var.connect_contact_flow_module_tags
}
