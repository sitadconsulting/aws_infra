resource "aws_quicksight_ingestion" "quicksight_ingestion" {
  aws_account_id = var.quicksight_ingestion_aws_account_id
  data_set_id    = var.quicksight_ingestion_data_set_id
  ingestion_id   = var.quicksight_ingestion_ingestion_id
  ingestion_type = var.quicksight_ingestion_ingestion_type
}
