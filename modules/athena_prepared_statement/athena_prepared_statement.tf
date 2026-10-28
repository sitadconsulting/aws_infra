resource "aws_athena_prepared_statement" "athena_prepared_statement" {
  description     = var.athena_prepared_statement_description
  name            = var.athena_prepared_statement_name
  query_statement = var.athena_prepared_statement_query_statement
  workgroup       = var.athena_prepared_statement_workgroup
}
