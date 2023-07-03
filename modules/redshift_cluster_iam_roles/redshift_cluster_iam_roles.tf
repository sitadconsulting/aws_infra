resource "aws_redshift_cluster_iam_roles" "redshift_cluster_iam_roles" {
  cluster_identifier   = var.redshift_cluster_iam_roles_cluster_identifier 
  iam_role_arns        = var.redshift_cluster_iam_roles_iam_role_arns
  default_iam_role_arn = var.redshift_cluster_iam_roles_default_iam_role_arn
}
