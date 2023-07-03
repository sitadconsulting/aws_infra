resource "aws_quicksight_refresh_schedule" "quicksight_refresh_schedule" {
  aws_account_id = var.quicksight_refresh_schedule_aws_account_id
  data_set_id    = var.quicksight_refresh_schedule_data_set_id
  schedule_id    = var.quicksight_refresh_schedule_schedule_id

  dynamic "schedule" {
    for_each = var.quicksight_refresh_schedule_schedule
      content {
        refresh_type          = schedule.value["refresh_type"]
        start_after_date_time = schedule.value["start_after_date_time"]
        dynamic "schedule_frequency" {
          for_each = schedule.value.schedule_frequency
            content {
              interval        = schedule_frequency.value["interval"]
              time_of_the_day = schedule_frequency.value["time_of_the_day"]
              timezone        = schedule_frequency.value["timezone"]
              dynamic "refresh_on_day" {
                for_each = schedule_frequency.value.refresh_on_day
                  content {
                    day_of_month = refresh_on_day.value["day_of_month"]
                    day_of_week  = refresh_on_day.value["day_of_week"]
                  }
              }
            }
        }
      }
  }
}
