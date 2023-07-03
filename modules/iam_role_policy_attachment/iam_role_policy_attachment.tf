resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  policy_arn = var.iam_role_policy_attachment_policy_arn
  role       = var.iam_role_policy_attachment_role 
  
  lifecycle {
    ignore_changes = [
      id,
      policy_arn,
      role
    ]
  }  
}
