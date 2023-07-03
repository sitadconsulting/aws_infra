variable "quicksight_refresh_schedule_aws_account_id" {
  description = "AWS account ID"
  type        = string
  default     = ""
}
variable "quicksight_refresh_schedule_data_set_id" {
  description = "The ID of the dataset"
  type        = string
}
variable "quicksight_refresh_schedule_schedule_id" {
  description = "The ID of the refresh schedule"
  type        = string
}
variable "quicksight_refresh_schedule_schedule" {
  description = "The refresh schedule"
  type        = list(object({
    refresh_type          = string
    start_after_date_time = optional(string)
    schedule_frequency    = list(object({
      interval        = string
      time_of_the_day = optional(string)
      timezone        = optional(string)
      refresh_on_day      = optional(list(object({
        day_of_month = optional(string)
        day_of_week  = optional(string)
      })))
    }))
  }))
}
