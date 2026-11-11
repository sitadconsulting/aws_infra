resource "aws_connect_lambda_function_association" "connect_lambda_function_association" {
  function_arn = var.connect_lambda_function_association_function_arn
  instance_id  = var.connect_lambda_function_association_instance_id
}
