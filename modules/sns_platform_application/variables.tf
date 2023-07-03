variable "sns_platform_application_apple_platform_team_id" {
  description = "The identifier that's assigned to your Apple developer account team. Must be 10 alphanumeric characters"
  type        = string
  default     = ""
}
variable "sns_platform_application_apple_platform_bundle_id" {
  description = "The bundle identifier that's assigned to your iOS app. May only include alphanumeric characters, hyphens (-), and periods (.)."
  type        = string
  default     = ""
}
variable "sns_platform_application_event_delivery_failure_topic_arn" {
  description = "The ARN of the SNS Topic triggered when a delivery to any of the platform endpoints associated with your platform application encounters a permanent failure"
  type        = string
  default     = ""
}
variable "sns_platform_application_event_endpoint_created_topic_arn" {
  description = "The ARN of the SNS Topic triggered when a new platform endpoint is added to your platform application"
  type        = string
  default     = ""
}
variable "sns_platform_application_event_endpoint_deleted_topic_arn" {
  description = "The ARN of the SNS Topic triggered when an existing platform endpoint is deleted from your platform application"
  type        = string
  default     = ""
}
variable "sns_platform_application_event_endpoint_updated_topic_arn" {
  description = "The ARN of the SNS Topic triggered when an existing platform endpoint is changed from your platform application"
  type        = string
  default     = ""
}
variable "sns_platform_application_failure_feedback_role_arn" {
  description = "The IAM role ARN permitted to receive failure feedback for this application and give SNS write access to use CloudWatch logs on your behalf"
  type        = string
  default     = ""
}
variable "sns_platform_application_name" {
  description = "The friendly name for the SNS platform application"
  type        = string
}
variable "sns_platform_application_platform" {
  description = "The platform that the app is registered with"
  type        = string
}
variable "sns_platform_application_platform_credential" {
  description = "Application Platform credential"
  type        = string
}
variable "sns_platform_application_platform_principal" {
  description = "Application Platform principal"
  type        = string
  default     = ""
}
variable "sns_platform_application_success_feedback_role_arn" {
  description = "The IAM role ARN permitted to receive success feedback for this application and give SNS write access to use CloudWatch logs on your behalf"
  type        = string
  default     = ""
}
variable "sns_platform_application_success_feedback_sample_rate" {
  description = "The sample rate percentage (0-100) of successfully delivered messages"
  type        = string
  default     = ""
}
