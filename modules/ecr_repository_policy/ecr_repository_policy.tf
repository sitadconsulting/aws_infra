resource "aws_ecr_repository_policy" "ecr_repository_policy" {
  repository = var.ecr_repository_policy_repository
  policy     = var.ecr_repository_policy_policy
}
