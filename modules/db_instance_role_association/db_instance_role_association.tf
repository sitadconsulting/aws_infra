resource "aws_db_instance_role_association" "db_instance_role_association" {
  db_instance_identifier = var.db_instance_role_association_db_instance_identifier
  feature_name           = var.db_instance_role_association_feature_name
  role_arn               = var.db_instance_role_association_role_arn
}
