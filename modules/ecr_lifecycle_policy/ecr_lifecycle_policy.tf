resource "aws_ecr_lifecycle_policy" "ecr_lifecycle_policy" {
  repository = var.ecr_lifecycle_policy_repository
  policy     = var.ecr_lifecycle_policy_policy
}
