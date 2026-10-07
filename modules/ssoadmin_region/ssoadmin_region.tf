resource "aws_ssoadmin_region" "ssoadmin_region" {
  instance_arn = var.ssoadmin_region_instance_arn
  region_name  = var.ssoadmin_region_region_name
}
