resource "aws_docdb_cluster_parameter_group" "docdb_cluster_parameter_group" {
  description = var.docdb_cluster_parameter_group_description
  family      = var.docdb_cluster_parameter_group_family
  name        = var.docdb_cluster_parameter_group_name
  name_prefix = var.docdb_cluster_parameter_group_name_prefix
  tags        = var.docdb_cluster_parameter_group_tags
 
  dynamic "parameter" {
    for_each = var.docdb_cluster_parameter_group_parameter
      content {
        name         = parameter.value["name"]
        value        = parameter.value["value"]
        apply_method = parameter.value["apply_method"]
      }
  }
}
