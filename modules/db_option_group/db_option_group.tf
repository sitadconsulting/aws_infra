resource "aws_db_option_group" "db_option_group" {
  name                     = var.db_option_group_name
  name_prefix              = var.db_option_group_name_prefix
  option_group_description = var.db_option_group_option_group_description
  engine_name              = var.db_option_group_engine_name
  major_engine_version     = var.db_option_group_major_engine_version
  tags                     = var.db_option_group_tags

  dynamic "option" {
    for_each = var.db_option_group_option
      content {
        option_name                    = option.value["option_name"]
        port                           = option.value["port"]
        version                        = option.value["version"]
        db_security_group_memberships  = option.value["db_security_group_memberships"] 
        vpc_security_group_memberships = option.value["vpc_security_group_memberships"]
        dynamic "option_settings" {
          for_each = option.value.option_settings
            content {
              name  = option_settings.value["name"]
              value = option_settings.value["value"]
            }
         }
     }
  }
}
