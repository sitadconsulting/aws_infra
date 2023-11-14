variable "cognito_user_pool_ui_customization_client_id" {
  description = "The client ID for the client app. Defaults to ALL. If ALL is specified, the css and/or image_file settings will be used for every client that has no UI customization set previously"
  type        = string
  default     = null
}
variable "cognito_user_pool_ui_customization_css" {
  description = "The CSS values in the UI customization, provided as a String. At least one of css or image_file is required"
  type        = string
  default     = null
}
variable "cognito_user_pool_ui_customization_image_file" {
  description = " The uploaded logo image for the UI customization, provided as a base64-encoded String. Drift detection is not possible for this argument. At least one of css or image_file is required"
  type        = string
  default     = null
}
variable "cognito_user_pool_ui_customization_user_pool_id" {
  description = "The user pool ID for the user pool"
  type        = string
}
