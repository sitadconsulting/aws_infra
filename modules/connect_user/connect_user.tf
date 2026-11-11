resource "aws_connect_user" "connect_user" {
  directory_user_id    = var.connect_user_directory_user_id
  hierarchy_group_id   = var.connect_user_hierarchy_group_id
  instance_id          = var.connect_user_instance_id
  name                 = var.connect_user_name 
  password             = var.connect_user_password
  routing_profile_id   = var.connect_user_routing_profile_id
  security_profile_ids = var.connect_user_security_profile_ids
  tags                 = var.connect_user_tags
  
  dynamic "identity_info" {
    for_each = var.connect_user_identity_info
      content {
        email           = identity_info.value["email"]
        first_name      = identity_info.value["first_name"]
        last_name       = identity_info.value["last_name"]
        secondary_email = identity_info.value["secondary_email"]
      }
  }
  dynamic "phone_config" {
    for_each = var.connect_user_phone_config
      content {
        after_contact_work_time_limit = phone_config.value["after_contact_work_time_limit"]
        auto_accept                   = phone_config.value["auto_accept"]
        desk_phone_number             = phone_config.value["desk_phone_number"]
        phone_type                    = phone_config.value["phone_type"]
      }
  }
}
