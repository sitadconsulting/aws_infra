resource "aws_customerprofiles_profile" "customerprofiles_profile" {
  account_number         = var.customerprofiles_profile_account_number
  additional_information = var.customerprofiles_profile_additional_information
  attributes             = var.customerprofiles_profile_attributes
  birth_date             = var.customerprofiles_profile_birth_date
  business_email_address = var.customerprofiles_profile_business_email_address
  business_name          = var.customerprofiles_profile_business_name
  business_phone_number  = var.customerprofiles_profile_business_phone_number
  domain_name            = var.customerprofiles_profile_domain_name
  email_address          = var.customerprofiles_profile_email_address
  first_name             = var.customerprofiles_profile_first_name
  gender_string          = var.customerprofiles_profile_gender_string
  home_phone_number      = var.customerprofiles_profile_home_phone_number
  last_name              = var.customerprofiles_profile_last_name
  middle_name            = var.customerprofiles_profile_middle_name
  mobile_phone_number    = var.customerprofiles_profile_mobile_phone_number
  party_type_string      = var.customerprofiles_profile_party_type_string
  personal_email_address = var.customerprofiles_profile_personal_email_address
  phone_number           = var.customerprofiles_profile_phone_number
  
  dynamic "address" {
    for_each = var.customerprofiles_profile_address
      content {
        address_1   = address.value["address_1"]      
        address_2   = address.value["address_2"]      
        address_3   = address.value["address_3"]      
        address_4   = address.value["address_4"]      
        city        = address.value["city"]
        country     = address.value["country"]
        county      = address.value["county"]
        postal_code = address.value["postal_code"]
        province    = address.value["province"]
        state       = address.value["state"]
      }
  }
  dynamic "billing_address" {
    for_each = var.customerprofiles_profile_billing_address
      content {
        address_1   = address.value["address_1"]      
        address_2   = address.value["address_2"]      
        address_3   = address.value["address_3"]      
        address_4   = address.value["address_4"]      
        city        = address.value["city"]
        country     = address.value["country"]
        county      = address.value["county"]
        postal_code = address.value["postal_code"]
        province    = address.value["province"]
        state       = address.value["state"]
      }
  }
  dynamic "mailing_address" {
    for_each = var.customerprofiles_profile_mailing_address
      content {
        address_1   = address.value["address_1"]      
        address_2   = address.value["address_2"]      
        address_3   = address.value["address_3"]      
        address_4   = address.value["address_4"]      
        city        = address.value["city"]
        country     = address.value["country"]
        county      = address.value["county"]
        postal_code = address.value["postal_code"]
        province    = address.value["province"]
        state       = address.value["state"]
      }
  }
  dynamic "shipping_address" {
    for_each = var.customerprofiles_profile_shipping_address
      content {
        address_1   = address.value["address_1"]      
        address_2   = address.value["address_2"]      
        address_3   = address.value["address_3"]      
        address_4   = address.value["address_4"]      
        city        = address.value["city"]
        country     = address.value["country"]
        county      = address.value["county"]
        postal_code = address.value["postal_code"]
        province    = address.value["province"]
        state       = address.value["state"]
      }
  }
}
