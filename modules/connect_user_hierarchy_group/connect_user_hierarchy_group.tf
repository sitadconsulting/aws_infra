resource "aws_connect_user_hierarchy_group" "connect_user_hierarchy_group" {
  instance_id     = var.connect_user_hierarchy_group_instance_id
  name            = var.connect_user_hierarchy_group_name
  parent_group_id = var.connect_user_hierarchy_group_parent_group_id 
  tags            = var.connect_user_hierarchy_group_tags
}
