resource "aws_cloudwatchomni_access_profile" "cloudwatchomni_access_profile" {
  description = var.cloudwatchomni_access_profile_description
  name        = var.cloudwatchomni_access_profile_name
  space_id    = var.cloudwatchomni_access_profile_space_id
}
