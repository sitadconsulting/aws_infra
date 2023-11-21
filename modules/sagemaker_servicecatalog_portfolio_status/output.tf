output "sagemaker_servicecatalog_portfolio_status_id" {
  description = "The AWS Region the Servicecatalog portfolio status resides in"
  value       = element(concat(aws_sagemaker_servicecatalog_portfolio_status.sagemaker_servicecatalog_portfolio_status.*.id, [""]), 0)
}
