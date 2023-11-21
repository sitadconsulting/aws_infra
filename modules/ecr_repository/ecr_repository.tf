resource "aws_ecr_repository" "ecr_repository" {
  force_delete         = var.ecr_repository_force_delete
  image_tag_mutability = var.ecr_repository_image_tag_mutability
  name                 = var.ecr_repository_name
  tags                 = var.ecr_repository_tags

  dynamic "encryption_configuration" {
    for_each = var.ecr_repository_encryption_configuration
      content {
        encryption_type = encryption_configuration.value["encryption_type"]
        kms_key         = encryption_configuration.value["kms_key"]
      }
  }
  dynamic "image_scanning_configuration" {
    for_each = var.ecr_repository_image_scanning_configuration
      content {
        scan_on_push = image_scanning_configuration.value["scan_on_push"]
      }
  }
}
