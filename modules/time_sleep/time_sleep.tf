resource "time_sleep" "sleep" {

  create_duration  = var.sleep_create_duration
  destroy_duration = var.sleep_destroy_duration
  triggers         = var.sleep_triggers
}
