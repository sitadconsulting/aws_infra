variable "quicksight_ingestion_aws_account_id" {
  description = "AWS account ID"
  type        = string
  default     = ""
}
variable "quicksight_ingestion_data_set_id" {
  description = "ID of the dataset used in the ingestion"
  type        = string
}
variable "quicksight_ingestion_ingestion_id" {
  description = "ID for the ingestion"
  type        = string
}
variable "quicksight_ingestion_ingestion_type" {
  description = "Type of ingestion to be created. Valid values are INCREMENTAL_REFRESH and FULL_REFRESH"
  type        = string
}
