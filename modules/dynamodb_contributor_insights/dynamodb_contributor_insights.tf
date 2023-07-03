resource "aws_dynamodb_contributor_insights" "dynamodb_contributor_insights" {
  index_name = var.dynamodb_contributor_insights_index_name
  table_name = var.dynamodb_contributor_insights_table_name
}
