resource "aws_inspector2_organization_configuration" "inspector2_organization_configuration" {
  dynamic "auto_enable" {
    for_each = var.inspector2_organization_configuration_auto_enable
      content {
        code_repository = auto_enable.value["code_repository"]
        ec2             = auto_enable.value["ec2"]
        ecr             = auto_enable.value["ecr"]
        lambda          = auto_enable.value["lambda"]
        lambda_code     = auto_enable.value["lambda_code"]
      }
  }
}
