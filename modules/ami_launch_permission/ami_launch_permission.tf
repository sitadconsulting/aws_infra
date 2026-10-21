resource "aws_ami_launch_permission" "ami_launch_permission" {
  account_id              = var.ami_launch_permission_account_id
  group                   = var.ami_launch_permission_group
  image_id                = var.ami_launch_permission_image_id
  organization_arn        = var.ami_launch_permission_organization_arn
  organizational_unit_arn = var.ami_launch_permission_organizational_unit_arn 
}
