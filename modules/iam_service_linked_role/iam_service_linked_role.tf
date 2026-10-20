resource "aws_iam_service_linked_role" "iam_service_linked_role" {
  aws_service_name = var.iam_service_linked_role_aws_service_name
  custom_suffix    = var.iam_service_linked_role_custom_suffix
  description      = var.iam_service_linked_role_description
  tags             = var.iam_service_linked_role_tags
}
