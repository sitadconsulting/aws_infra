resource "aws_athena_capacity_reservation" "athena_capacity_reservation" {
  name        = var.athena_capacity_reservation_name
  target_dpus = var.athena_capacity_reservation_target_dpus
  tags        = var.athena_capacity_reservation_tags
}
