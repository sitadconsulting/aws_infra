resource "aws_codebuild_source_credential" "codebuild_source_credential" {
  auth_type   = var.codebuild_source_credential_auth_type
  server_type = var.codebuild_source_credential_server_type
  token       = var.codebuild_source_credential_token
  user_name   = var.codebuild_source_credential_user_name
}
