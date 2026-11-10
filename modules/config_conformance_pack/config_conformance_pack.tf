resource "aws_config_conformance_pack" "config_conformance_pack" {
  delivery_s3_bucket     = var.config_conformance_pack_delivery_s3_bucket
  delivery_s3_key_prefix = var.config_conformance_pack_delivery_s3_key_prefix
  name                   = var.config_conformance_pack_name
  template_body          = var.config_conformance_pack_template_body
  template_s3_uri        = var.config_conformance_pack_template_s3_uri  

  dynamic "input_parameter" {
    for_each = var.config_conformance_pack_input_parameter
      content {
        parameter_name  = input_parameter.value["parameter_name"]
        parameter_value = input_parameter.value["parameter_value"]
      }
  }
}
