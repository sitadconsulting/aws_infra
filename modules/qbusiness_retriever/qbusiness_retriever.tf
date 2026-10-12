resource "awscc_qbusiness_retriever" "qbusiness_retriever" {
  application_id = var.qbusiness_retriever_application_id
  display_name   = var.qbusiness_retriever_display_name
  role_arn       = var.qbusiness_retriever_role_arn
  tags           = var.qbusiness_retriever_tags
  type           = var.qbusiness_retriever_type
  configuration  = var.qbusiness_retriever_configuration
}
