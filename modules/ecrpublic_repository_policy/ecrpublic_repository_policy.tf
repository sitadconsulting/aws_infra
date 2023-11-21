resource "aws_ecrpublic_repository_policy" "ecrpublic_repository_policy" {
  policy          = var.ecrpublic_repository_policy_policy
  repository_name = var.ecrpublic_repository_policy_repository_name
}
