resource "aws_rds_cluster_parameter_group" "rds_cluster_parameter_group" {
  description = var.rds_cluster_parameter_group_description
  family      = var.rds_cluster_parameter_group_family
  name        = var.rds_cluster_parameter_group_name
  name_prefix = var.rds_cluster_parameter_group_name_prefix
  tags        = var.rds_cluster_parameter_group_tags

  dynamic "parameter" {
    for_each = var.rds_cluster_parameter_group_parameter
      content {
        apply_method = parameter.value["apply_method"]
        name         = parameter.value["name"]
        value        = parameter.value["value"]
      }
  }
}
