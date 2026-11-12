variable "dms_data_provider_description" {
  description = "(Optional) Description of the data provider"
  type        = string
  default     = null
}
variable "dms_data_provider_engine" {
  description = "(Required) Database engine for the data provider. Valid values: aurora, aurora-postgresql, db2, db2-zos, docdb, mariadb, mongodb, mysql, oracle, postgres, redshift, sqlserver, and sybase. Use aurora for Amazon Aurora MySQL-Compatible Edition"
  type        = string
}
variable "dms_data_provider_name" {
  description = "(Optional) Name of the data provider. AWS generates a name when omitted"
  type        = string
  default     = null
}
variable "dms_data_provider_tags" {
  description = "(Optional) Map of tags assigned to the resource"
  type        = map(string)
  default     = {}
}
variable "dms_data_provider_virtual" {
  description = "(Optional) Whether to create a virtual data provider, which does not require a connection to a database. Defaults to false"
  type        = bool
  default     = false
}
variable "dms_data_provider_settings" {
  description = "(Required) Database connection settings. Configure exactly one block matching engine"
  type        = list(object({
    doc_db_settings               = optional(list(object({
      certificate_arn = optional(string)
      database_name   = optional(string)
      port            = optional(number)
      server_name     = optional(string)
      ssl_mode        = optional(string)
    })), [])
    ibm_db2_luw_settings          = optional(list(object({
      certificate_arn      = optional(string)
      database_name        = optional(string)
      encryption_algorithm = optional(string)
      port                 = optional(number)
      s3_access_role_arn   = optional(string)
      s3_path              = optional(string)
      security_mechanism   = optional(string)
      server_name          = optional(string)
      ssl_mode             = optional(string)
    })), [])
    ibm_db2_zos_settings          = optional(list(object({
      certificate_arn    = optional(string)
      database_name      = optional(string)
      port               = optional(number)
      s3_access_role_arn = optional(string)
      s3_path            = optional(string)
      server_name        = optional(string)
      ssl_mode           = optional(string)
    })), [])
    maria_db_settings             = optional(list(object({
      certificate_arn    = optional(string)
      port               = optional(number)
      s3_access_role_arn = optional(string)
      s3_path            = optional(string)
      server_name        = optional(string)
      ssl_mode           = optional(string)
    })), [])
    microsoft_sql_server_settings = optional(list(object({
      certificate_arn    = optional(string)
      database_name      = optional(string)
      port               = optional(number)
      s3_access_role_arn = optional(string)
      s3_path            = optional(string)
      server_name        = optional(string)
      ssl_mode           = optional(string)
    })), [])
    mongo_db_settings             = optional(list(object({
      auth_mechanism  = optional(string)
      auth_source     = optional(string)
      auth_type       = optional(string)
      certificate_arn = optional(string)
      database_name   = optional(string)
      port            = optional(number)
      server_name     = optional(string)
      ssl_mode        = optional(string)
    })), [])
    mysql_settings                = optional(list(object({
      certificate_arn    = optional(string)
      port               = optional(number)
      s3_access_role_arn = optional(string)
      s3_path            = optional(string)
      server_name        = optional(string)
      ssl_mode           = optional(string)
    })), [])
    oracle_settings               = optional(list(object({
      asm_server                                             = optional(string)
      certificate_arn                                        = optional(string)
      database_name                                          = optional(string)
      port                                                   = optional(number)
      s3_access_role_arn                                     = optional(string)
      s3_path                                                = optional(string)
      secrets_manager_oracle_asm_access_role_arn             = optional(string)
      secrets_manager_oracle_asm_secret_id                   = optional(string)
      secrets_manager_security_db_encryption_access_role_arn = optional(string)
      secrets_manager_security_db_encryption_secret_id       = optional(string)
      server_name                                            = optional(string)
      ssl_mode                                               = optional(string)
    })), [])
    postgresql_settings           = optional(list(object({
      certificate_arn    = optional(string)
      database_name      = optional(string)
      port               = optional(number)
      s3_access_role_arn = optional(string)
      s3_path            = optional(string)
      server_name        = optional(string)
      ssl_mode           = optional(string)
    })), [])
    redshift_settings             = optional(list(object({
      database_name      = optional(string)
      port               = optional(number)
      s3_access_role_arn = optional(string)
      s3_path            = optional(string)
      server_name        = optional(string)
    })), [])
    sybase_ase_settings           = optional(list(object({
      certificate_arn    = optional(string)
      database_name      = optional(string)
      encrypt_password   = optional(string)
      port               = optional(number)
      server_name        = optional(string)
      ssl_mode           = optional(string)
    })), [])
  }))
}
