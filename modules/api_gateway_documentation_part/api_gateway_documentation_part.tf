resource "aws_api_gateway_documentation_part" "api_gateway_documentation_part" {
  properties  = var.api_gateway_documentation_part_properties
  rest_api_id = var.api_gateway_documentation_part_rest_api_id

  dynamic "location" {
    for_each = var.api_gateway_documentation_part_location
      content {
        method      = location.value["method"]
        name        = location.value["name"]
        path        = location.value["path"]
        status_code = location.value["status_code"]
        type        = location.value["type"]
      }
  }
}
