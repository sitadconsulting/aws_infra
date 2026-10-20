resource "aws_iam_role_policies_exclusive" "iam_role_policies_exclusive" {
  role_name    = var.iam_role_policies_exclusive_role_name 
  policy_names = var.iam_role_policies_exclusive_policy_names
}
