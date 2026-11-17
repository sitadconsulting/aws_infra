resource "aws_docdb_cluster_instance" "docdb_cluster_instance" {
  apply_immediately               = var.docdb_cluster_instance_apply_immediately
  auto_minor_version_upgrade      = var.docdb_cluster_instance_auto_minor_version_upgrade
  availability_zone               = var.docdb_cluster_instance_availability_zone
  ca_cert_identifier              = var.docdb_cluster_instance_ca_cert_identifier
  certificate_rotation_restart    = var.docdb_cluster_instance_certificate_rotation_restart
  cluster_identifier              = var.docdb_cluster_instance_cluster_identifier
  copy_tags_to_snapshot           = var.docdb_cluster_instance_copy_tags_to_snapshot
  enable_performance_insights     = var.docdb_cluster_instance_enable_performance_insights
  engine                          = var.docdb_cluster_instance_engine
  identifier_prefix               = var.docdb_cluster_instance_identifier_prefix
  identifier                      = var.docdb_cluster_instance_identifier
  instance_class                  = var.docdb_cluster_instance_instance_class
  performance_insights_kms_key_id = var.docdb_cluster_instance_performance_insights_kms_key_id
  preferred_maintenance_window    = var.docdb_cluster_instance_preferred_maintenance_window
  promotion_tier                  = var.docdb_cluster_instance_promotion_tier
  tags                            = var.docdb_cluster_instance_tags
}
