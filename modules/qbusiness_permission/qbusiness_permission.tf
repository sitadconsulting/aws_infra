esource "awscc_qbusiness_permission" "qbusiness_permission" {
  actions        = var.qbusiness_permission_actions
  application_id = var.qbusiness_permission_application_id
  principal      = var.qbusiness_permission_principal
  statement_id   = var.qbusiness_permission_statement_id

}
