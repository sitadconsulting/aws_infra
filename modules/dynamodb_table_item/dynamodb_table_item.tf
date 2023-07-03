resource "aws_dynamodb_table_item" "dynamodb_table_item" {
  hash_key   = var.dynamodb_table_item_hash_key
  item       = var.dynamodb_table_item_item
  range_key  = var.dynamodb_table_item_range_key
  table_name = var.dynamodb_table_item_table_name
}
