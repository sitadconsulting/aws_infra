variable "appflow_connector_profile_connection_mode" {
  description = "(Required) Connection mode and specifies whether it is public or private. Private flows use AWS PrivateLink to route data over AWS infrastructure without exposing it to the public internet. One of: Public, Private"
  type        = string
}
variable "appflow_connector_profile_connector_label" {
  description = "(Optional) Label of the connector. The label is unique for each ConnectorRegistration in your AWS account. Only needed if calling for the CustomConnector connector type"
  type        = string
  default     = null
}
variable "appflow_connector_profile_connector_type" {
  description = "(Required) Type of connector. One of: Amplitude, CustomConnector, CustomerProfiles, Datadog, Dynatrace, EventBridge, Googleanalytics, Honeycode, Infornexus, LookoutMetrics, Marketo, Redshift, S3, Salesforce, SAPOData, Servicenow, Singular, Slack, Snowflake, Trendmicro, Upsolver, Veeva, Zendesk"
  type        = string
}
variable "appflow_connector_profile_kms_arn" {
  description = "(Optional) ARN of the KMS key you provide for encryption. This is required if you do not want to use the Amazon AppFlow-managed KMS key. If you don't provide anything here, Amazon AppFlow uses the Amazon AppFlow-managed KMS key"
  type        = string
  default     = null
}
variable "appflow_connector_profile_name" {
  description = "(Required) Name of the connector profile. The name is unique for each ConnectorProfile in your AWS account"
  type        = string
}
variable "appflow_connector_profile_connector_profile_config" {
  description = "(Required) Connector-specific configuration and credentials"
  type        = list(object({
    connector_profile_credentials = list(object({
      amplitude        = optional(list(object({
        api_key    = string
        secret_key = string
      })), [])
      custom_connector = optional(list(object({ 
        authentication_type = string
        api_key             = optional(list(object({
          api_key        = string
          api_secret_key = optional(string)
        })), [])
        basic               = optional(list(object({
          password = string
          username = string
        })), [])
        custom              = optional(list(object({
          credentials_map            = optional(map(string))
          custom_authentication_type = string
        })), [])
        oauth2              = optional(list(object({
          access_token  = optional(string)
          client_id     = optional(string)
          client_secret = optional(string)
          refresh_token = optional(string)
          oauth_request = optional(list(object({
            auth_code    = optional(string)
            redirect_uri = optional(string)
          })), [])
        })), [])
      })), [])
      datadog          = optional(list(object({
        api_key         = string
        application_key = string
      })), [])
      dynatrace        = optional(list(object({
        api_token = string
      })), [])
      google_analytics = optional(list(object({
        access_token  = optional(string)
        client_id     = string
        client_secret = string
        refresh_token = optional(string)
        oauth_request = optional(list(object({
          auth_code    = optional(string)
          redirect_uri = optional(string)
        })), [])
      })), [])
      honeycode        = optional(list(object({
        access_token  = optional(string)
        refresh_token = optional(string)
        oauth_request = optional(list(object({
          auth_code    = optional(string)
          redirect_uri = optional(string)
        })), [])
      })), [])
      infor_nexus      = optional(list(object({
        access_key_id     = string
        datakey           = string
        secret_access_key = string
        user_id           = string
      })), [])
      marketo          = optional(list(object({
        access_token  = optional(string)
        client_id     = string
        client_secret = string
        oauth_request = optional(list(object({
          auth_code    = optional(string)
          redirect_uri = optional(string)
        })), [])
      })), [])
      redshift         = optional(list(object({
        password = string
        username = string
      })), [])
      salesforce       = optional(list(object({
         access_token           = optional(string)
         client_credentials_arn = optional(string)
         jwt_token              = optional(string)
         oauth2_grant_type      = optional(string)
         refresh_token          = optional(string)
         oauth_request          = optional(list(object({
           auth_code    = optional(string)
           redirect_uri = optional(string)
         })), [])
      })), [])
      sapo_data        = optional(list(object({
        basic_auth_credentials = optional(list(object({
          password = string
          username = string
        })), [])
        oauth_credentials      =  optional(list(object({
          access_token  = optional(string)
          client_id     = string
          client_secret = string
          refresh_token = optional(string)
          oauth_request = optional(list(object({
            auth_code    = optional(string)
            redirect_uri = optional(string)
          })), [])
        })), [])
      })), [])
      service_now      = optional(list(object({
        password = string
        username = string
      })), [])
      singular         = optional(list(object({
        api_key = string 
      })), [])
      slack            = optional(list(object({
        access_token  = optional(string)
        client_id     = string
        client_secret = string
        oauth_request = optional(list(object({
          auth_code    = optional(string)
          redirect_uri = optional(string)
        })), [])
      })), [])
      snowflake        = optional(list(object({
        password = string
        username = string
      })), [])
      trendmicro       = optional(list(object({
        api_secret_key = string
      })), [])
      veeva            = optional(list(object({
        password = string
        username = string
      })), [])
      zendesk          = optional(list(object({
        access_token  = optional(string)
        client_id     = string
        client_secret = string
        oauth_request = optional(list(object({
          auth_code    = optional(string)
          redirect_uri = optional(string)
        })), [])
      })), [])
    }))
    connector_profile_properties  = list(object({
      custom_connector = optional(list(object({
        profile_properties = optional(map(string))
        oauth2_properties  = optional(list(object({
          oauth2_grant_type           = string
          token_url                   = string
          token_url_custom_properties = optional(map(string))
        })), [])
      })), [])
      datadog          = optional(list(object({
        instance_url = string
      })), [])
      dynatrace        = optional(list(object({
        instance_url = string
      })), [])
      infor_nexus      = optional(list(object({
        instance_url = string
      })), [])
      marketo          = optional(list(object({
        instance_url = string
      })), [])
      redshift         = optional(list(object({
        bucket_name        = string
        bucket_prefix      = optional(string)
        cluster_identifier = optional(string)
        data_api_role_arn  = optional(string)
        database_name      = optional(string)
        database_url       = optional(string)
        role_arn           = string
      })), [])
      salesforce       = optional(list(object({
        instance_url                                   = optional(string)
        is_sandbox_environment                         = optional(bool)
        use_privatelink_for_metadata_and_authorization = optional(bool)
      })), [])
      sapo_data        = optional(list(object({
        application_host_url      = string
        application_service_path  = string
        client_number             = string
        logon_language            = optional(string)
        port_number               = number
        private_link_service_name = optional(string)
        oauth_properties          = optional(list(object({
          auth_code_url = string
          oauth_scopes  = string
          token_url     = string
        })), [])
      })), [])
      service_now      = optional(list(object({
        instance_url = string
      })), [])
      slack            = optional(list(object({
        instance_url = string
      })), [])
      snowflake        = optional(list(object({
        account_name              = optional(string)
        bucket_name               = string
        bucket_prefix             = optional(string)
        private_link_service_name = optional(string)
        region                    = optional(string)
        stage                     = string
        warehouse                 = string
      })), [])
      veeva            = optional(list(object({
        instance_url = string
      })), [])
      zendesk          = optional(list(object({
        instance_url = string
      })), [])
    }))
  }))
}
