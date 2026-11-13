resource "aws_datasync_location_hdfs" "datasync_location_hdfs" {
  agent_arns                = var.datasync_location_hdfs_agent_arns
  authentication_type       = var.datasync_location_hdfs_authentication_type
  block_size                = var.datasync_location_hdfs_block_size
  kerberos_keytab           = var.datasync_location_hdfs_kerberos_keytab
  kerberos_keytab_base64    = var.datasync_location_hdfs_kerberos_keytab_base64
  kerberos_krb5_conf        = var.datasync_location_hdfs_kerberos_krb5_conf
  kerberos_krb5_conf_base64 = var.datasync_location_hdfs_kerberos_krb5_conf_base64
  kerberos_principal        = var.datasync_location_hdfs_kerberos_principal
  kms_key_provider_uri      = var.datasync_location_hdfs_kms_key_provider_uri
  replication_factor        = var.datasync_location_hdfs_replication_factor
  simple_user               = var.datasync_location_hdfs_simple_user
  subdirectory              = var.datasync_location_hdfs_subdirectory
  tags                      = var.datasync_location_hdfs_tags
  
  dynamic "name_node" {
    for_each = var.datasync_location_hdfs_name_node
      content {
        hostname = name_node.value["hostname"]
        port     =  name_node.value["port"]
      }
  }
  dynamic "qop_configuration" {
    for_each = var.datasync_location_hdfs_qop_configuration
      content {
        data_transfer_protection = qop_configuration.value["data_transfer_protection"]
        rpc_protection           = qop_configuration.value["rpc_protection"]
      }
  }
}
