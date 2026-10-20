resource "aws_kinesis_account_settings" "kinesis_account_settings" {
  dynamic "minimum_throughput_billing_commitment" {
    for_each = var.kinesis_account_settings_minimum_throughput_billing_commitment
      content {
        status = minimum_throughput_billing_commitment.value["status"]
      }
  }
}
