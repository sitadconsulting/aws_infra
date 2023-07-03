resource "aws_iam_access_key" "iam_access_key" {
  pgp_key = var.iam_access_key_pgp_key
  status  = var.iam_access_key_status
  user    = var.iam_access_key_user
}
