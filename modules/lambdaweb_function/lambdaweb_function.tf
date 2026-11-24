resource "aws_lambdaweb_function" "lambdaweb_function" {
  function_name = var.lambdaweb_function_function_name
  tags          = var.lambdaweb_function_tags
}
