resource "aws_dynamodb_global_table" "dynamodb_global_table" {
  name = var.dynamodb_global_table_name

  dynamkic "replica" {
    for_each = var.dynamodb_global_table_replica
      content {
        region_name = replica.value["region_name"]
      }
  }
}
