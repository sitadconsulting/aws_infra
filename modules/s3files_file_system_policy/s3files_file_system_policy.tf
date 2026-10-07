resource "aws_s3files_file_system_policy" "s3files_file_system_policy" {
  file_system_id = var.s3files_file_system_policy_file_system_id
  policy         = var.s3files_file_system_policy_policy
}
