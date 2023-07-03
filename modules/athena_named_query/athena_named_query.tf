resource "aws_athena_named_query" "athena_named_query" {
  database    = var.athena_named_query_database
  description = var.athena_named_query_description
  name        = var.athena_named_query_name
  query       = var.athena_named_query_query
  workgroup   = var.athena_named_query_workgroup
}
