resource "aws_cloudwatch_query_definition" "cloudwatch_query_definition" {
  log_group_names = var.cloudwatch_query_definition_log_group_names
  name            = var.cloudwatch_query_definition_name
  query_string    = var.cloudwatch_query_definition_query_string

}
