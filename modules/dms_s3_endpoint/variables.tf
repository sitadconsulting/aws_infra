variable "dms_s3_endpoint_add_column_name" {
  description = "(Optional) Whether to add column name information to the .csv output file. Default is false"
  type        = bool 
  default     = false
}
variable "dms_s3_endpoint_add_trailing_padding_character" {
  description = "(Optional) Whether to add padding. Default is false. (Ignored for source endpoints.)"
  type        = bool
  default     = false
}
variable "dms_s3_endpoint_bucket_folder" {
  description = "(Optional) S3 object prefix"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_bucket_name" {
  description = "(Required) S3 bucket name"
  type        = string
}
variable "dms_s3_endpoint_canned_acl_for_objects" {
  description = "(Optional) Predefined (canned) access control list for objects created in an S3 bucket. Valid values include none, private, public-read, public-read-write, authenticated-read, aws-exec-read, bucket-owner-read, and bucket-owner-full-control. Default is none"
  type        = string
  default     = "none"
}
variable "dms_s3_endpoint_cdc_inserts_and_updates" {
  description = "(Optional) Whether to write insert and update operations to .csv or .parquet output files. Default is false"
  type        = bool
  default     = false
}
variable "dms_s3_endpoint_cdc_inserts_only" {
  description = "(Optional) Whether to write insert operations to .csv or .parquet output files. Default is false"
  type        = bool
  default     = false
}
variable "dms_s3_endpoint_cdc_max_batch_interval" {
  description = "(Optional) Maximum length of the interval, defined in seconds, after which to output a file to Amazon S3. (AWS default is 60.)"
  type        = number
  default     = 60
}
variable "dms_s3_endpoint_cdc_min_file_size" {
  description = "(Optional) Minimum file size condition as defined in kilobytes to output a file to Amazon S3. (AWS default is 32000 KB.)"
  type        = number
  default     = 32000
}
variable "dms_s3_endpoint_cdc_path" {
  description = "(Optional) Folder path of CDC files. If cdc_path is set, AWS DMS reads CDC files from this path and replicates the data changes to the target endpoint. Supported in AWS DMS versions 3.4.2 and later. Required for CDC"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_certificate_arn" {
  description = "(Optional, Default: empty string) ARN for the certificate"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_compression_type" {
  description = "(Optional) Set to compress target files. Valid values are GZIP and NONE. Default is NONE. (Ignored for source endpoints.)"
  type        = string
  default     = "NONE"
}
variable "dms_s3_endpoint_csv_delimiter" {
  description = "(Optional) Delimiter used to separate columns in the source files. Default is ,"
  type        = string
  default     = ","
}
variable "dms_s3_endpoint_csv_no_sup_value" {
  description = "(Optional) Only applies if output files for a CDC load are written in .csv format. If use_csv_no_sup_value is set to true, string to use for all columns not included in the supplemental log. If you do not specify a string value, DMS uses the null value for these columns regardless of use_csv_no_sup_value. (Ignored for source endpoints.)"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_csv_null_value" {
  description = "(Optional) String to as null when writing to the target. (AWS default is NULL.)"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_csv_row_delimiter" {
  description = "(Optional) Delimiter used to separate rows in the source files. Default is newline (i.e., \n)."
  type        = string
  default     = "\n"
}
variable "dms_s3_endpoint_data_format" {
  description = "(Optional) Output format for the files that AWS DMS uses to create S3 objects. Valid values are csv and parquet. (Ignored for source endpoints -- only csv is valid.)"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_data_page_size" {
  description = "(Optional) Size of one data page in bytes. (AWS default is 1 MiB, i.e., 1048576.)"
  type        = number
  default     = null
}
variable "dms_s3_endpoint_date_partition_delimiter" {
  description = " (Optional) Date separating delimiter to use during folder partitioning. Valid values are SLASH, UNDERSCORE, DASH, and NONE. (AWS default is SLASH.) (Ignored for source endpoints.)"
  type        = string
  default     = "SLASH"
}
variable "dms_s3_endpoint_date_partition_enabled" {
  description = "(Optional) Partition S3 bucket folders based on transaction commit dates. Default is false. (Ignored for source endpoints.)"
  type        = bool
  default     = false
}
variable "dms_s3_endpoint_date_partition_sequence" {
  description = "(Optional) Date format to use during folder partitioning. Use this parameter when date_partition_enabled is set to true. Valid values are YYYYMMDD, YYYYMMDDHH, YYYYMM, MMYYYYDD, and DDMMYYYY. (AWS default is YYYYMMDD.) (Ignored for source endpoints.)"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_date_partition_timezone" {
  description = "(Optional) Convert the current UTC time to a timezone. The conversion occurs when a date partition folder is created and a CDC filename is generated. The timezone format is Area/Location (e.g., Europe/Paris). Use this when date_partition_enabled is true. (Ignored for source endpoints.)"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_detach_target_on_lob_lookup_failure_parquet" {
  description = "(Optional) Undocumented argument for use as directed by AWS Support"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_dict_page_size_limit" {
  description = "(Optional) Maximum size in bytes of an encoded dictionary page of a column. (AWS default is 1 MiB, i.e., 1048576.)"
  type        = number
  default     = null
}
variable "dms_s3_endpoint_enable_statistics" {
  description = "(Optional) Whether to enable statistics for Parquet pages and row groups. Default is true"
  type        = bool
  default     = true
}
variable "dms_s3_endpoint_encoding_type" {
  description = "(Optional) Type of encoding to use. Value values are rle-dictionary, plain, and plain-dictionary. (AWS default is rle-dictionary.)"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_encryption_mode" {
  description = "(Optional) Server-side encryption mode that you want to encrypt your .csv or .parquet object files copied to S3. Valid values are SSE_S3 and SSE_KMS. (AWS default is SSE_S3.) (Ignored for source endpoints -- only SSE_S3 is valid.)"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_endpoint_id" {
  description = "(Required) Database endpoint identifier. Identifiers must contain from 1 to 255 alphanumeric characters or hyphens, begin with a letter, contain only ASCII letters, digits, and hyphens, not end with a hyphen, and not contain two consecutive hyphens"
  type        = string
}
variable "dms_s3_endpoint_endpoint_type" {
  description = "(Required) Type of endpoint. Valid values are source, target"
  type        = string
}
variable "dms_s3_endpoint_expected_bucket_owner" {
  description = "(Optional) Bucket owner to prevent sniping. Value is an AWS account ID"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_external_table_definition" {
  description = "(Optional) JSON document that describes how AWS DMS should interpret the data. Required for source endpoints"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_glue_catalog_generation" {
  description = "(Optional) Whether to integrate AWS Glue Data Catalog with an Amazon S3 target. Default is false"
  type        = bool
  default     = false
}
variable "dms_s3_endpoint_ignore_header_rows" {
  description = "(Optional, Force New) When this value is set to 1, DMS ignores the first row header in a .csv file. (AWS default is 0.)"
  type        = number
  default     = null
}
variable "dms_s3_endpoint_include_op_for_full_load" {
  description = "(Optional) Whether to enable a full load to write INSERT operations to the .csv output files only to indicate how the rows were added to the source database. Default is false"
  type        = bool
  default     = false
}
variable "dms_s3_endpoint_kms_key_arn" {
  description = "(Optional, Deprecated Use server_side_encryption_kms_key_id instead) ARN for the KMS key that will be used to encrypt the connection parameters. If you do not specify a value for kms_key_arn, then AWS DMS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS region"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_max_file_size" {
  description = "(Optional) Maximum size (in KB) of any .csv file to be created while migrating to an S3 target during full load. Valid values are from 1 to 1048576. (AWS default is 1 GB, i.e., 1048576.)"
  type        = number
  default     = null
}
variable "dms_s3_endpoint_parquet_timestamp_in_millisecond" {
  description = "(Optional) - Specifies the precision of any TIMESTAMP column values written to an S3 object file in .parquet format. Default is false. (Ignored for source endpoints.)"
  type        = bool
  default     = false
}
variable "dms_s3_endpoint_parquet_version" {
  description = "(Optional) Version of the .parquet file format. Valid values are parquet-1-0 and parquet-2-0. (AWS default is parquet-1-0.) (Ignored for source endpoints.)"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_preserve_transactions" {
  description = "(Optional) Whether DMS saves the transaction order for a CDC load on the S3 target specified by cdc_path. Default is false. (Ignored for source endpoints.)"
  type        = bool
  default     = false
}
variable "dms_s3_endpoint_rfc_4180" {
  description = "(Optional) For an S3 source, whether each leading double quotation mark has to be followed by an ending double quotation mark. Default is true"
  type        = bool
  default     = true
}
variable "dms_s3_endpoint_row_group_length" {
  description = "(Optional) Number of rows in a row group. (AWS default is 10000.)"
  type        = number
  default     = null
}
variable "dms_s3_endpoint_server_side_encryption_kms_key_id" {
  description = "(Optional) When encryption_mode is SSE_KMS, ARN for the AWS KMS key. (Ignored for source endpoints -- only SSE_S3 encryption_mode is valid.)"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_service_access_role_arn" {
  description = "(Required) ARN of the IAM role with permissions to the S3 Bucket"
  type        = string
}
variable "dms_s3_endpoint_ssl_mode" {
  description = "(Optional) SSL mode to use for the connection. Valid values are none, require, verify-ca, verify-full. (AWS default is none.)"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "dms_s3_endpoint_timestamp_column_name" {
  description = "(Optional) Column to add with timestamp information to the endpoint data for an Amazon S3 target"
  type        = string
  default     = null
}
variable "dms_s3_endpoint_use_csv_no_sup_value" {
  description = "(Optional) Whether to use csv_no_sup_value for columns not included in the supplemental log. (Ignored for source endpoints.)"
  type        = bool
  default     = null
}
variable "dms_s3_endpoint_use_task_start_time_for_full_load_timestamp" {
  description = "(Optional) When set to true, uses the task start time as the timestamp column value instead of the time data is written to target. For full load, when set to true, each row of the timestamp column contains the task start time. For CDC loads, each row of the timestamp column contains the transaction commit time.When set to false, the full load timestamp in the timestamp column increments with the time data arrives at the target. Default is false"
  type        = bool
  default     = false
}

