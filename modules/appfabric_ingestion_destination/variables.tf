variable "appfabric_ingestion_destination_app_bundle_arn" {
  description = "(Required) ARN of the app bundle to use for the request"
  type        = string
}
variable "appfabric_ingestion_destination_ingestion_arn" {
  description = "(Required) ARN of the ingestion to use for the request"
  type        = string
}
variable "appfabric_ingestion_destination_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "appfabric_ingestion_destination_destination_configuration" {
  description = "(Required) Configuration for the destination of ingested data"
  type        = list(object({
    audit_log = list(object({
      destination = list(object({
        firehose_stream = optional(list(object({
          stream_name = string
        })), [])
        s3_bucket       = optional(list(object({
          bucket_name = string
          prefix      = optional(string)
        })), [])
      }))
    }))
  }))
}
variable "appfabric_ingestion_destination_processing_configuration" {
  description = "(Required) Configuration for how ingested data is processed"
  type        = list(object({
    audit_log = list(object({
      format = string
      schema = string
    }))
  }))
}
