variable "bedrock_evaluation_job_application_type" {
  description = "(Optional) Whether the evaluation job evaluates a model or a knowledge base. Valid values: ModelEvaluation, RagEvaluation"
  type        = string
  default     = null
}
variable "bedrock_evaluation_job_customer_encryption_key_id" {
  description = "(Optional) ARN of the customer managed KMS key to use to encrypt the evaluation job"
  type        = string
  default     = null
}
variable "bedrock_evaluation_job_job_description" {
  description = "(Optional) Description of the evaluation job"
  type        = string
  default     = null
}
variable "bedrock_evaluation_job_skip_destroy" {
  description = "(Optional) Whether to leave the evaluation job in its current state when destroying the resource, instead of stopping it"
  type        = bool
  default     = true
}
variable "bedrock_evaluation_job_job_name" {
  description = "(Required) Name for the evaluation job. Must be unique within your AWS account and Region, and consist of lowercase letters, numbers, and hyphens"
  type        = string
}
variable "bedrock_evaluation_job_role_arn" {
  description = "(Required) ARN of an IAM service role that Amazon Bedrock can assume to perform tasks on your behalf"
  type        = string
}
variable "bedrock_evaluation_job_tags" {
  description = "(Optional) Map of tags to assign to the evaluation job"
  type        = map(string)
  default     = {}
}
variable "bedrock_evaluation_job_evaluation_config" {
  description = "(Required) Configuration for either an automated or human-based evaluation job"
  type        = list(object({
    automated = optional(list(object({
      custom_metric_config = optional(list(object({
        custom_metric = list(object({
          custom_metric_definition = list(object({
            instructions = string
            name         = string
            rating_scale = optional(list(object({
              definition = string
              value      = list(object({
                float_value  = optional(number)
                string_value = optional(string)
              }))
            })), [])
          }))
        }))
        evaluator_model_config = list(object({
          bedrock_evaluator_model = list(object({
            model_identifier = string
          }))
        }))
      })), [])
      dataset_metric_config = list(object({
        metric_names = string
        task_type    = string
        dataset      = list(object({
          name             = string
          dataset_location = optional(list(object({
            s3_uri = string
          })), [])
        }))
      }))
      evaluator_model_config = optional(list(object({
        bedrock_evaluator_model = list(object({
          model_identifier = string
        }))
      })), [])
    })), [])
    human     = optional(list(object({
      custom_metric         = optional(list(object({
        description   = optional(string)
        name          = string
        rating_method = string
      })), [])
      dataset_metric_config = list(object({
        metric_names = string
        task_type    = string
        dataset      = list(object({
          name             = string
          dataset_location = optional(list(object({
            s3_uri = string
          })), [])
        }))
      }))
      human_workflow_config = optional(list(object({
        flow_definition_arn = string
        instructions        = optional(string)
      })), [])
    })), [])
  }))
}
variable "bedrock_evaluation_job_inference_config" {
  description = "(Required) Configuration for the inference model, or models, used for the evaluation job"
  type        = list(object({
    model      = optional(list(object({
      bedrock_model = optional(list(object({
        inference_params   = optional(string)
        model_identifier   = string
        performance_config = optional(list(object({
          latency = optional(string)
        })), [])
      })), [])
      precomputed_inference_source = optional(list(object({
        inference_source_identifier = string
      })), [])
    })), [])
    rag_config = optional(list(object({
      knowledge_base_config         = optional(list(object({
        retrieve_and_generate_config = optional(list(object({
          knowledge_base_id       = string
          model_arn               = string
          retrieval_configuration = optional(list(object({
            vector_search_configuration = list(object({
              number_of_results = optional(number)
            }))
          })), []) 
        })), [])
        retrieve_config              = optional(list(object({
          knowledge_base_id                      = string
          knowledge_base_retrieval_configuration = optional(list(object({
            vector_search_configuration = list(object({
              number_of_results = optional(number)
            }))
          })), [])
        })), [])
      })), [])
      precomputed_rag_source_config = optional(list(object({
        retrieve_and_generate_source_config = optional(list(object({
          rag_source_identifier = string
        })), [])
        retrieve_source_config              = optional(list(object({
          rag_source_identifier = string
        })), [])
      })), []) 
    })), [])
  }))
}
variable "bedrock_evaluation_job_output_data_config" {
  description = "(Required) Configuration for the Amazon S3 location where the results of the evaluation job are stored"
  type        = list(object({
    s3_uri = string
  }))
}
