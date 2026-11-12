resource "aws_dms_replication_instance" "dms_replication_instance" {
  allocated_storage            = var.dms_replication_instance_allocated_storage
  allow_major_version_upgrade  = var.dms_replication_instance_allow_major_version_upgrade
  apply_immediately            = var.dms_replication_instance_apply_immediately
  auto_minor_version_upgrade   = var.dms_replication_instance_auto_minor_version_upgrade
  availability_zone            = var.dms_replication_instance_availability_zone
  dns_name_servers             = var.dms_replication_instance_dns_name_servers
  engine_version               = var.dms_replication_instance_engine_version
  kms_key_arn                  = var.dms_replication_instance_kms_key_arn
  multi_az                     = var.dms_replication_instance_multi_az
  network_type                 = var.dms_replication_instance_network_type
  preferred_maintenance_window = var.dms_replication_instance_preferred_maintenance_window 
  publicly_accessible          = var.dms_replication_instance_publicly_accessible
  replication_instance_class   = var.dms_replication_instance_replication_instance_class
  replication_instance_id      = var.dms_replication_instance_replication_instance_id
  replication_subnet_group_id  = var.dms_replication_instance_replication_subnet_group_id
  tags                         = var.dms_replication_instance_tags
  vpc_security_group_ids       = var.dms_replication_instance_vpc_security_group_ids


  dynamic "kerberos_authentication_settings" {
    for_each = var.dms_replication_instance_kerberos_authentication_settings
      content {
        key_cache_secret_iam_arn = kerberos_authentication_settings.value["key_cache_secret_iam_arn"]
        key_cache_secret_id      = kerberos_authentication_settings.value["key_cache_secret_id"]
        krb5_file_contents       = kerberos_authentication_settings.value["krb5_file_contents"]
      }
  }


}
