variable "qbusiness_retriever_application_id" {
  description = "The identifier of the Amazon Q Business application using the retriever"
  type        = string
}
variable "qbusiness_retriever_display_name" {
  description = "The name of your retriever"
  type        = string
}
variable "qbusiness_retriever_role_arn" {
  description = "ARN of an IAM role used by Amazon Q Business to access the basic authentication credentials stored in a Secrets Manager"
  type        = string
  default     = null
}
variable "qbusiness_retriever_tags" {
  description = "A list of key-value pairs that identify or categorize the retriever"
  type        = list(object({
    key   = optional(string)
    value = optional(string) 
  }))
  default     = []
}
variable "qbusiness_retriever_type" {
  description = "The type of your retriever, allowed values: NATIVE_INDEX | KENDRA_INDEX"
  type        = string
}
variable "qbusiness_retriever_configuration" {
  description = "Provides information on how the retriever used for your Amazon Q Business application is configured"
  type        = object({
    kendra_index_configuration = optional(object({
      index_id = optional(string)
    }))
    native_index_configuration = optional(object({
      index_id = optional(string)
    }))
  })
}
