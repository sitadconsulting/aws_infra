variable "lb_listener_certificate_listener_arn" {
  description = "The ARN of the listener to which to attach the certificate"
  type        = string
}
variable "lb_listener_certificate_certificate_arn" {
  description = "The ARN of the certificate to attach to the listener"
  type        = string
}
