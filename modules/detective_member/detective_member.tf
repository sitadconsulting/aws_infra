resource "aws_detective_member" "detective_member" {
  account_id                 = var.detective_member_account_id
  disable_email_notification = var.detective_member_disable_email_notification
  email_address              = var.detective_member_email_address
  graph_arn                  = var.detective_member_graph_arn
  message                    = var.detective_member_message
}
