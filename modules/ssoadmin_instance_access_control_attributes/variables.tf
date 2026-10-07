variable "ssoadmin_instance_access_control_attributes_instance_arn" {
 description = "ARN of the SSO Instance"
 type        = string
}
variable "ssoadmin_instance_access_control_attributes_attribute" {
 description = "Set of access control attributes"
 type        =  list(object({
   key   = string
   value = list(object({
     source = list(string)
   }))
 }))
}
