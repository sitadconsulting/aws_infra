resource "aws_rds_reserved_instance" "rds_reserved_instance" {
  offering_id    = var.rds_reserved_instance_offering_id
  instance_count = var.rds_reserved_instance_instance_count
  reservation_id = var.rds_reserved_instance_reservation_id
  tags           = var.rds_reserved_instance_tags
}
