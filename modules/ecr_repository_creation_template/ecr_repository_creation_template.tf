resource "aws_ecr_repository_creation_template" "ecr_repository_creation_template" {
  applied_for          = var.ecr_repository_creation_template_applied_for
  custom_role_arn      = var.ecr_repository_creation_template_custom_role_arn
  description          = var.ecr_repository_creation_template_description
  image_tag_mutability = var.ecr_repository_creation_template_image_tag_mutability
  lifecycle_policy     = var.ecr_repository_creation_template_lifecycle_policy
  prefix               = var.ecr_repository_creation_template_prefix
  repository_policy    = var.ecr_repository_creation_template_repository_policy
  resource_tags        = var.ecr_repository_creation_template_resource_tags

  dynamic "encryption_configuration" {
    for_each = var.ecr_repository_creation_template_encryption_configuration
      content {
        encryption_type = encryption_configuration.value["encryption_type"]
        kms_key         = encryption_configuration.value["kms_key"]
      }
  }
  dynamic "image_tag_mutability_exclusion_filter" {
    for_each = var.ecr_repository_creation_template_image_tag_mutability_exclusion_filter
      content {
        filter      = image_tag_mutability_exclusion_filter.value["filter"]
        filter_type = image_tag_mutability_exclusion_filter.value["filter_type"]
      }
  }
}
