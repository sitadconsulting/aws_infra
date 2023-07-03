resource "aws_iam_user_login_profile" "iam_user_login_profile" {
  user                    = var.iam_user_login_profile_user 
  pgp_key                 = var.iam_user_login_profile_pgp_key
  password_reset_required = var.iam_user_login_profile_password_reset_required
  password_length         = var.iam_user_login_profile_password_length
}

