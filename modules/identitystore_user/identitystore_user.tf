resource "aws_identitystore_user" "identitystore_user" {
  display_name       = var.identitystore_user_display_name
  identity_store_id  = var.identitystore_user_identity_store_id
  locale             = var.identitystore_user_locale
  nickname           = var.identitystore_user_nickname
  preferred_language = var.identitystore_user_preferred_language
  profile_url        = var.identitystore_user_profile_url
  timezone           = var.identitystore_user_timezone
  title              = var.identitystore_user_title
  user_name          = var.identitystore_user_user_name
  user_type          = var.identitystore_user_user_type

  dynamic "addresses" {
    for_each = var.identitystore_user_addresses
      content {
        country        = addresses.value["country"]
        formatted      = addresses.value["formatted"]
        locality       = addresses.value["locality"]
        postal_code    = addresses.value["postal_code"]
        primary        = addresses.value["primary"]
        region         = addresses.value["region"]
        street_address = addresses.value["street_address"]
        type           = addresses.value["type"]
      }
  }
  dynamic "emails" {
    for_each = var.identitystore_user_emails
      content {
        primary = emails.value["primary"]
        type    = emails.value["type"]
        value   = emails.value["value"]
      }
  }
  dynamic "name" {
    for_each = var.identitystore_user_name
      content {
        family_name      = name.value["family_name"]
        formatted        = name.value["formatted"]
        given_name       = name.value["given_name"]
        honorific_prefix = name.value["honorific_prefix"]
        honorific_suffix = name.value["honorific_suffix"]
        middle_name      = name.value["middle_name"]
      }
  }
  dynamic "phone_numbers" {
    for_each = var.identitystore_user_phone_numbers
      content {
        primary = phone_numbers.value["primary"]
        type    = phone_numbers.value["type"]
        value   = phone_numbers.value["value"]
      }
  }
}
