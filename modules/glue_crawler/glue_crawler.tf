resource "aws_glue_crawler" "glue_crawler" {
  classifiers            = var.glue_crawler_classifiers
  configuration          = var.glue_crawler_configuration
  database_name          = var.glue_crawler_database_name
  description            = var.glue_crawler_description
  name                   = var.glue_crawler_name
  role                   = var.glue_crawler_role
  schedule               = var.glue_crawler_schedule
  security_configuration = var.glue_crawler_security_configuration
  table_prefix           = var.glue_crawler_table_prefix
  tags                   = var.glue_crawler_tags

  dynamic "catalog_target" {
    for_each = var.glue_crawler_catalog_target
      content {
        connection_name     = catalog_target.value["connection_name"]
        database_name       = catalog_target.value["database_name"]
        dlq_event_queue_arn = catalog_target.value["dlq_event_queue_arn"]
        event_queue_arn     = catalog_target.value["event_queue_arn"]
        tables              = catalog_target.value["tables"]
      }
  }
  dynamic "delta_target" {
    for_each = var.glue_crawler_delta_target
      content {
        connection_name           = delta_target.value["connection_name"]
        create_native_delta_table = delta_target.value["create_native_delta_table"]
        delta_tables              = delta_target.value["delta_tables"]
        write_manifest            = delta_target.value["write_manifest"]
      }
  }
  dynamic "dynamodb_target" {
    for_each = var.glue_crawler_dynamodb_target
      content {
        path      = dynamodb_target.value["path"]
        scan_all  = dynamodb_target.value["scan_all"]
        scan_rate = dynamodb_target.value["scan_rate"]
      }
  }
  dynamic "jdbc_target" {
    for_each = var.glue_crawler_jdbc_target
      content {
        connection_name            = jdbc_target.value["connection_name"]
        enable_additional_metadata = jdbc_target.value["enable_additional_metadata"]
        exclusions                 = jdbc_target.value["exclusions"]
        path                       = jdbc_target.value["path"]
      }
  }
  dynamic "lake_formation_configuration" {
    for_each = var.glue_crawler_lake_formation_configuration
      content {
        account_id                     = lake_formation_configuration.value["account_id"]
        use_lake_formation_credentials = lake_formation_configuration.value["use_lake_formation_credentials"]
      }
  }
  dynamic "lineage_configuration" {
    for_each = var.glue_crawler_lineage_configuration
      content {
        crawler_lineage_settings = lineage_configuration.value["crawler_lineage_settings"]
      }
  }
  dynamic "mongodb_target" {
    for_each = var.glue_crawler_mongodb_target
      content {
        connection_name = mongodb_target.value["connection_name"]
        path            = mongodb_target.value["path"]
        scan_all        = mongodb_target.value["scan_all"]
      }
  }
  dynamic "recrawl_policy" {
    for_each = var.glue_crawler_recrawl_policy
      content {
        recrawl_behavior = recrawl_policy.value["recrawl_behavior"]
      }
  }
  dynamic "s3_target" {
    for_each = var.glue_crawler_s3_target
      content {
        connection_name     = s3_target.value["connection_name"]
        dlq_event_queue_arn = s3_target.value["dlq_event_queue_arn"]
        event_queue_arn     = s3_target.value["event_queue_arn"]
        exclusions          = s3_target.value["exclusions"]
        path                = s3_target.value["path"]
        sample_size         = s3_target.value["sample_size"]
      }
  }
  dynamic "schema_change_policy" {
    for_each = var.glue_crawler_schema_change_policy
      content {
        delete_behavior = schema_change_policy.value["delete_behavior"]
        update_behavior = schema_change_policy.value["update_behavior"]
      }
  }
}
