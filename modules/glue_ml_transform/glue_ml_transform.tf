resource "aws_glue_ml_transform" "glue_ml_transform" {
  description       = var.glue_ml_transform_description
  glue_version      = var.glue_ml_transform_glue_version
  max_capacity      = var.glue_ml_transform_max_capacity
  max_retries       = var.glue_ml_transform_max_retries
  name              = var.glue_ml_transform_name
  number_of_workers = var.glue_ml_transform_number_of_workers
  role_arn          = var.glue_ml_transform_role_arn
  tags              = var.glue_ml_transform_tags
  timeout           = var.glue_ml_transform_timeout
  worker_type       = var.glue_ml_transform_worker_type


  dynamic "input_record_tables" {
    for_each = var.glue_ml_transform_input_record_tables
      content {
        database_name   = input_record_tables.value["database_name"]
        table_name      = input_record_tables.value["table_name"]
        catalog_id      = input_record_tables.value["catalog_id"]
        connection_name = input_record_tables.value["connection_name"]
      } 
  }
  dynamic "parameters" {
    for_each = var.glue_ml_transform_parameters
      content {
        transform_type = parameters.value["transform_type"]
        dynamic "find_matches_parameters" {
          for_each = parameters.value.find_matches_parameters
            content {
              accuracy_cost_trade_off    = find_matches_parameters.value["accuracy_cost_trade_off"]
              enforce_provided_labels    = find_matches_parameters.value["enforce_provided_labels"]
              precision_recall_trade_off = find_matches_parameters.value["precision_recall_trade_off"]
              primary_key_column_name    = find_matches_parameters.value["primary_key_column_name"]
            }
        }
      }
  }
}
