resource "aws_cloudwatchomni_view" "cloudwatchomni_view" {
  definition  = var.cloudwatchomni_view_definition
  description = var.cloudwatchomni_view_description
  name        = var.cloudwatchomni_view_name
  tags        = var.cloudwatchomni_view_tags 
}
