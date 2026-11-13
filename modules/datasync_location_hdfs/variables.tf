variable "datasync_location_hdfs_agent_arns" {
  description = "(Required) A list of DataSync Agent ARNs with which this location will be associated"
  type        = list(string)
}
variable "datasync_location_hdfs_authentication_type" {
  description = "(Required) The type of authentication used to determine the identity of the user. Valid values are SIMPLE and KERBEROS"
  type        = string
}
variable "datasync_location_hdfs_block_size" {
  description = "(Optional) The size of data blocks to write into the HDFS cluster. The block size must be a multiple of 512 bytes. The default block size is 128 mebibytes (MiB)"
  type        = number
  default     = null
}
variable "datasync_location_hdfs_kerberos_keytab" {
  description = "(Optional) The Kerberos key table (keytab) that contains mappings between the defined Kerberos principal and the encrypted keys. Use kerberos_keytab_base64 instead whenever the value is not a valid UTF-8 string. If KERBEROS is specified for authentication_type, this parameter (or kerberos_keytab_base64) is required "
  type        = string
  default     = null
}
variable "datasync_location_hdfs_kerberos_keytab_base64" {
  description = "(Optional) Use instead of kerberos_keytab to pass base64-encoded binary data directly. If KERBEROS is specified for authentication_type, this parameter (or kerberos_keytab) is required"
  type        = string
  default     = null
}
variable "datasync_location_hdfs_kerberos_krb5_conf" {
  description = "(Optional) The krb5.conf file that contains the Kerberos configuration information. Use kerberos_krb5_conf_base64 instead whenever the value is not a valid UTF-8 string. If KERBEROS is specified for authentication_type, this parameter (or kerberos_krb5_conf_base64) is required"
  type        = string
  default     = null
}
variable "datasync_location_hdfs_kerberos_krb5_conf_base64" {
  description = "(Optional) Use instead of kerberos_krb5_conf to pass base64-encoded binary data directly. If KERBEROS is specified for authentication_type, this parameter (or kerberos_krb5_conf) is required"
  type        = string
  default     = null
}
variable "datasync_location_hdfs_kerberos_principal" {
  description = "(Optional) The Kerberos principal with access to the files and folders on the HDFS cluster. If KERBEROS is specified for authentication_type, this parameter is required"
  type        = string
  default     = null
}
variable "datasync_location_hdfs_kms_key_provider_uri" {
  description = "(Optional) The URI of the HDFS cluster's Key Management Server (KMS)"
  type        = string
  default     = null
}
variable "datasync_location_hdfs_replication_factor" {
  description = "(Optional) The number of DataNodes to replicate the data to when writing to the HDFS cluster. By default, data is replicated to three DataNodes"
  type        = number
  default     = null
}
variable "datasync_location_hdfs_simple_user" {
  description = "(Optional) The user name used to identify the client on the host operating system. If SIMPLE is specified for authentication_type, this parameter is required"
  type        = string
  default     = null
}
variable "datasync_location_hdfs_subdirectory" {
  description = "(Optional) A subdirectory in the HDFS cluster. This subdirectory is used to read data from or write data to the HDFS cluster. If the subdirectory isn't specified, it will default to /"
  type        = string
  default     = null
}
variable "datasync_location_hdfs_tags" {
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Location"
  type        = map(string)
  default     = {}
}
variable "datasync_location_hdfs_name_node" {
  description = "(Required) The NameNode that manages the HDFS namespace. The NameNode performs operations such as opening, closing, and renaming files and directories. The NameNode contains the information to map blocks of data to the DataNodes. You can use only one NameNode"
  type        = list(object({
    hostname = string
    port     = number
  }))
}
variable "datasync_location_hdfs_qop_configuration" {
  description = "(Optional) The Quality of Protection (QOP) configuration specifies the Remote Procedure Call (RPC) and data transfer protection settings configured on the Hadoop Distributed File System (HDFS) cluster. If qop_configuration isn't specified, rpc_protection and data_transfer_protection default to PRIVACY. If you set RpcProtection or DataTransferProtection, the other parameter assumes the same value"
  type        = list(object({
    data_transfer_protection = optional(string)
    rpc_protection           = optional(string)
  }))
  default     = []
}
