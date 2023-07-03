resource "local_file" "file" {
  content              = var.file_content
  filename             = var.file_filename
  directory_permission = var.file_directory_permission
  file_permission      = var.file_file_permission

  lifecycle {
    ignore_changes = all
  }
}
