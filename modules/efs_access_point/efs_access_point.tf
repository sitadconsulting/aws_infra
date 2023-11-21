resource "aws_efs_access_point" "efs_access_point" {
  file_system_id = var.efs_access_point_file_system_id
  tags           = var.efs_access_point_tags

  dynamic "posix_user" {
    for_each = var.efs_access_point_posix_user
      content {
        gid            = posix_user.value["gid"]
        uid            = posix_user.value["uid"]
        secondary_gids = posix_user.value["secondary_gids"] 
      }
  }
  dynamic "root_directory" {
    for_each = var.efs_access_point_root_directory
      content {
        path          = root_directory.value["path"]
        dynamic "creation_info" {
          for_each = root_directory.value.creation_info
            content {
              owner_gid   = creation_info.value["owner_gid"]
              owner_uid   = creation_info.value["owner_uid"]
              permissions = creation_info.value["permissions"]
            }
        } 
      }
  }
}
