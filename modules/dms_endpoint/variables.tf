variable "dms_endpoint_certificate_arn" {
  description = "(Optional, Default: empty string) ARN for the certificate"
  type        = string
  default     = null
}
variable "dms_endpoint_database_name" {
  description = "(Optional) Name of the endpoint database"
  type        = string
  default     = null
}
variable "dms_endpoint_extra_connection_attributes" {
  description = "(Optional) Additional attributes associated with the connection"
  type        = string
  default     = null
}
variable "dms_endpoint_endpoint_id" {
  description = "(Required) Database endpoint identifier. Identifiers must contain from 1 to 255 alphanumeric characters or hyphens, begin with a letter, contain only ASCII letters, digits, and hyphens, not end with a hyphen, and not contain two consecutive hyphens"
  type        = string
}
variable "dms_endpoint_endpoint_type" {
  description = "(Required) Type of endpoint. Valid values are source, target"
  type        = string
}
variable "dms_endpoint_engine_name" {
  description = "(Required) Type of engine for the endpoint. Valid values are aurora, aurora-postgresql, aurora-serverless, aurora-postgresql-serverless,azuredb, azure-sql-managed-instance, babelfish, db2, db2-zos, docdb, dynamodb, elasticsearch, kafka, kinesis, mariadb, mongodb, mysql, opensearch, oracle, postgres, redshift,redshift-serverless, sqlserver, neptune ,sybase. Please note that some of engine names are available only for target endpoint type (e.g. redshift)"
  type        = string
}
variable "dms_endpoint_kms_key_arn" {
  description = "(Required when engine_name is mongodb, optional otherwise) ARN for the KMS key that will be used to encrypt the connection parameters. If you do not specify a value for kms_key_arn, then AWS DMS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS region. When engine_name is redshift, kms_key_arn is the KMS Key for the Redshift target and the parameter redshift_settings.server_side_encryption_kms_key_id encrypts the S3 intermediate storage"
  type        = string
}
variable "dms_endpoint_password" {
  description = "(Optional) Password to be used to login to the endpoint database"
  type        = string
  default     = null
}
variable "dms_endpoint_pause_replication_tasks" {
  description = "(Optional) Whether to pause associated running replication tasks, regardless if they are managed by Terraform, prior to modifying the endpoint. Only tasks paused by the resource will be restarted after the modification completes. Default is false"
  type        = bool
  default     = false
}
variable "dms_endpoint_port" {
  description = "(Optional) Port used by the endpoint database"
  type        = number
  default     = null
}
variable "dms_endpoint_secrets_manager_access_role_arn" {
  description = " (Optional) ARN of the IAM role that specifies AWS DMS as the trusted entity and has the required permissions to access the value in the Secrets Manager secret referred to by secrets_manager_arn. The role must allow the iam:PassRole action."
  type        = string
  default     = null
}
variable "dms_endpoint_secrets_manager_arn" {
  description = "(Optional) Full ARN, partial ARN, or friendly name of the Secrets Manager secret that contains the endpoint connection details. Supported only when engine_name is aurora, aurora-postgresql, mariadb, mongodb, mysql, oracle, postgres, redshift, or sqlserver"
  type        = string
  default     = null
}
variable "dms_endpoint_server_name" {
  description = "(Optional) Host name of the server"
  type        = string
  default     = null
}
variable "dms_endpoint_service_access_role" {
  description = "(Optional) ARN used by the service access IAM role for DynamoDB endpoints"
  type        = string
  default     = null
}
variable "dms_endpoint_ssl_mode" {
  description = "(Optional, Default: none) SSL mode to use for the connection. Valid values are none, require, verify-ca, verify-full"
  type        = string
  default     = null
}
variable "dms_endpoint_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "dms_endpoint_username" {
  description = "(Optional) User name to be used to login to the endpoint database"
  type        = string
  default     = null
}
variable "dms_endpoint_elasticsearch_settings" {
  description = "(Optional) Configuration block for OpenSearch settings"
  type        = list(object({
    endpoint_uri               = string
    error_retry_duration       = optional(number)
    full_load_error_percentage = optional(number)
    service_access_role_arn    = string
    use_new_mapping_type       = optional(bool)
  }))
  default     = []
}
variable "dms_endpoint_kafka_settings" {
  description = "(Optional) Configuration block for Kafka settings"
  type        = list(object({
    broker                         = string
    include_control_details        = optional(bool)
    include_null_and_empty         = optional(bool)
    include_partition_value        = optional(bool)
    include_table_alter_operations = optional(bool) 
    include_transaction_details    = optional(bool)
    message_format                 = optional(string)
    message_max_bytes              = optional(number)
    no_hex_prefix                  = optional(bool)
    partition_include_schema_table = optional(bool)
    sasl_mechanism                 = optional(string)
    sasl_password                  = optional(string)
    sasl_username                  = optional(string)
    security_protocol              = optional(string)
    ssl_ca_certificate_arn         = optional(string)
    ssl_client_certificate_arn     = optional(string)
    ssl_client_key_arn             = optional(string)
    ssl_client_key_password        = optional(string)
    topic                          = optional(string)
  }))
  default     = []
}
variable "dms_endpoint_kinesis_settings" {
  description = "(Optional) Configuration block for Kinesis settings"
  type        = list(object({
    include_control_details        = optional(bool)
    include_null_and_empty         = optional(bool)
    include_partition_value        = optional(bool)
    include_table_alter_operations = optional(bool)
    include_transaction_details    = optional(bool)
    message_format                 = optional(string)
    partition_include_schema_table = optional(bool)
    service_access_role_arn        = optional(string)
    stream_arn                     = optional(string)
    use_large_integer_value        = optional(bool)
  }))
  default     = []
}
variable "dms_endpoint_mongodb_settings" {
  description = "(Optional) Configuration block for MongoDB settings"
  type        = list(object({
    auth_mechanism      = optional(string)
    auth_source         = optional(string)
    auth_type           = optional(string)
    docs_to_investigate = optional(string)
    extract_doc_id      = optional(string)
    nesting_level       = optional(string)
    use_update_lookup   = optional(bool)
  }))
  default     = []
}
variable "dms_endpoint_mysql_settings" {
  description = "(Optional) Configuration block for MySQL settings"
  type        = list(object({
    after_connect_script              = optional(string)
    authentication_method             = optional(string)
    clean_source_metadata_on_mismatch = optional(bool)
    events_poll_interval              = optional(number)
    execute_timeout                   = optional(number)
    max_file_size                     = optional(number)
    parallel_load_threads             = optional(number)
    server_timezone                   = optional(string)
    service_access_role_arn           = optional(string)
    target_db_type                    = optional(string)
  }))
  default     = []
}
variable "dms_endpoint_oracle_settings" {
  description = "(Optional) Configuration block for Oracle settings"
  type        = list(object({
    access_alternate_directly                     = optional(bool)
    add_supplemental_logging                      = optional(bool)
    additional_archived_log_dest_id               = optional(number)
    allow_selected_nested_tables                  = optional(bool)
    archived_log_dest_id                          = optional(number)
    archived_logs_only                            = optional(bool)
    asm_password                                  = optional(string)
    asm_server                                    = optional(string)
    asm_user                                      = optional(string)
    authentication_method                         = optional(string)
    char_length_semantics                         = optional(string)
    convert_timestamp_with_zone_to_utc            = optional(bool)
    direct_path_no_log                            = optional(bool)
    direct_path_parallel_load                     = optional(bool)
    enable_homogenous_tablespace                  = optional(bool)
    extra_archived_log_dest_ids                   = optional(list(number))
    fail_task_on_lob_truncation                   = optional(bool)
    number_datatype_scale                         = optional(number)
    open_transaction_window                       = optional(number)
    oracle_path_prefix                            = optional(string)
    parallel_asm_read_threads                     = optional(number)
    read_ahead_blocks                             = optional(number)
    read_table_space_name                         = optional(bool)
    replace_path_prefix                           = optional(bool)
    retry_interval                                = optional(number)
    secrets_manager_oracle_asm_access_role_arn    = optional(string)
    secrets_manager_oracle_asm_secret_id          = optional(string)
    security_db_encryption                        = optional(string)
    security_db_encryption_name                   = optional(string)
    spatial_data_option_to_geo_json_function_name = optional(string)
    standby_delay_time                            = optional(number)
    trim_space_in_char                            = optional(bool)
    use_alternate_folder_for_online               = optional(bool)
    use_bfile                                     = optional(bool)
    use_direct_path_full_load                     = optional(bool)
    use_logminer_reader                           = optional(bool)
    use_path_prefix                               = optional(string)
  }))
  default     = []
}
variable "dms_endpoint_postgres_settings" {
  description = "(Optional) Configuration block for Postgres settings"
  type        = list(object({
    after_connect_script         = optional(string)
    authentication_method        = optional(string)
    babelfish_database_name      = optional(string)
    capture_ddls                 = optional(bool)
    database_mode                = optional(string)
    ddl_artifacts_schema         = optional(string)
    execute_timeout              = optional(number)
    fail_tasks_on_lob_truncation = optional(bool)
    heartbeat_enable             = optional(bool)
    heartbeat_frequency          = optional(number)
    heartbeat_schema             = optional(string)
    map_boolean_as_boolean       = optional(bool)
    map_jsonb_as_clob            = optional(bool)
    map_long_varchar_as          = optional(string)
    max_file_size                = optional(number)
    plugin_name                  = optional(string)
    service_access_role_arn      = optional(string)
    slot_name                    = optional(string)
  }))
  default     = []
}
variable "dms_endpoint_redis_settings" {
  description = "(Optional) Configuration block for Redis settings"
  type        = list(object({
    auth_password          = optional(string)
    auth_type              = string
    auth_user_name         = optional(string)
    port                   = number
    server_name            = string
    ssl_ca_certificate_arn = optional(string)
    ssl_security_protocol  = optional(string)
  }))
  default     = []
}
variable "dms_endpoint_redshift_settings" {
  description = "(Optional) Configuration block for Redshift settings"
  type        = list(object({
    bucket_folder                     = optional(string)
    bucket_name                       = optional(string)
    encryption_mode                   = optional(string) 
    server_side_encryption_kms_key_id = optional(string)
    service_access_role_arn           = optional(string)
  }))
  default     = []
}
