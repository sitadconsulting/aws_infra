resource "aws_dynamodb_tag" "dynamodb_tag" {
  resource_arn = var.dynamodb_tag_resource_arn
  key          = var.dynamodb_tag_key
  value        = var.dynamodb_tag_value
}
