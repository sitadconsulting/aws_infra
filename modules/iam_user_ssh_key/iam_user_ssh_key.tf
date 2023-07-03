resource "aws_iam_user_ssh_key" "iam_user_ssh_key" {
  encoding   = var.iam_user_ssh_key_encoding
  public_key = var.iam_user_ssh_key_public_key
  status     = var.iam_user_ssh_key_status
  username   = var.iam_user_ssh_key_username
}
