variable "sleep_create_duration" {
  description = "Time duration to delay resource creation. For example, 30s for 30 seconds or 5m for 5 minutes. Updating this value by itself will not trigger a delay"
  type        = string
  default     = ""

}
variable "sleep_destroy_duration" {
  description = "Time duration to delay resource destroy. For example, 30s for 30 seconds or 5m for 5 minutes. Updating this value by itself will not trigger a delay"
  type        = string
  default     = null
}
variable "sleep_triggers" {
  description = "Arbitrary map of values that, when changed, will run any creation or destroy delays again"
  type        = map(string)
  default     = {}
}
