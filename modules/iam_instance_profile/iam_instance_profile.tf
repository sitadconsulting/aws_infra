resource "aws_iam_instance_profile" "iam_instance_profile" {
  name         = var.iam_instance_profile_name
  name_prefix  = var.iam_instance_profile_name_prefix
  path         = var.iam_instance_profile_path
  role         = var.iam_instance_profile_role
  tags         = var.iam_instance_profile_tags
}
