resource "aws_redshift_cluster" "redshift_cluster" {
  allow_version_upgrade                = var.redshift_cluster_allow_version_upgrade
  apply_immediately                    = var.redshift_cluster_apply_immediately
  aqua_configuration_status            = var.redshift_cluster_aqua_configuration_status
  automated_snapshot_retention_period  = var.redshift_cluster_automated_snapshot_retention_period
  availability_zone                    = var.redshift_cluster_availability_zone
  availability_zone_relocation_enabled = var.redshift_cluster_availability_zone_relocation_enabled
  cluster_identifier                   = var.redshift_cluster_cluster_identifier
  cluster_parameter_group_name         = var.redshift_cluster_cluster_parameter_group_name
  cluster_security_groups              = var.redshift_cluster_cluster_security_groups
  cluster_subnet_group_name            = var.redshift_cluster_cluster_subnet_group_name
  cluster_type                         = var.redshift_cluster_cluster_type
  cluster_version                      = var.redshift_cluster_cluster_version
  database_name                        = var.redshift_cluster_database_name
  default_iam_role_arn                 = var.redshift_cluster_default_iam_role_arn
  elastic_ip                           = var.redshift_cluster_elastic_ip
  encrypted                            = var.redshift_cluster_encrypted
  enhanced_vpc_routing                 = var.redshift_cluster_enhanced_vpc_routing
  final_snapshot_identifier            = var.redshift_cluster_final_snapshot_identifier
  iam_roles                            = var.redshift_cluster_iam_roles
  kms_key_id                           = var.redshift_cluster_kms_key_id
  maintenance_track_name               = var.redshift_cluster_maintenance_track_name
  manual_snapshot_retention_period     = var.redshift_cluster_manual_snapshot_retention_period
  master_password                      = var.redshift_cluster_master_password
  master_username                      = var.redshift_cluster_master_username
  node_type                            = var.redshift_cluster_node_type
  number_of_nodes                      = var.redshift_cluster_number_of_nodes
  owner_account                        = var.redshift_cluster_owner_account
  port                                 = var.redshift_cluster_port
  preferred_maintenance_window         = var.redshift_cluster_preferred_maintenance_window
  publicly_accessible                  = var.redshift_cluster_publicly_accessible
  skip_final_snapshot                  = var.redshift_cluster_skip_final_snapshot
  snapshot_cluster_identifier          = var.redshift_cluster_snapshot_cluster_identifier
  snapshor_identifier                  = var.redshift_cluster_snapshor_identifier
  vpc_security_group_ids               = var.redshift_cluster_vpc_security_group_ids
  tags                                 = var.redshift_cluster_tags
  
  dynamic "logging" {
    for_each = var.redshift_cluster_logging
      content {
        bucket_name          = logging.value["bucket_name"]
        enable               = logging.value["enable"]
        log_destination_type = logging.value["log_destination_type"]
        log_exports          = logging.value["log_exports"]
        s3_key_prefix        = logging.value["s3_key_prefix"] 
      }
  }
  dynamic "snapshot_copy" {
    for_each = var.redshift_cluster_snapshot_copy
      content {
        destionation_region = snapshot_copy.value["destination_region"]
        grant_name          = snapshot_copy.value["grant_name"]
        retention_period    = snapshot_copy.value["retention_period"]
      }
  }
  timeouts {
    create = "75m"
    delete = "30m"
    update = "75m"
  }
}
