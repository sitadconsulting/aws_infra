resource "aws_appsync_source_api_association" "appsync_source_api_association" {
  description    = var.appsync_source_api_association_description
  merged_api_arn = var.appsync_source_api_association_merged_api_arn
  merged_api_id  = var.appsync_source_api_association_merged_api_id
  source_api_arn = var.appsync_source_api_association_source_api_arn
  source_api_id  = var.appsync_source_api_association_source_api_id
  
  dynamic "source_api_association_config" {
    for_each = var.appsync_source_api_association_source_api_association_config
      content {
        merge_type = source_api_association_config.value["merge_type"]
      }
  }
}
