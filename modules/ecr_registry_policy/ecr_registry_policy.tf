resource "aws_ecr_registry_policy" "ecr_registry_policy" {
  policy =  var.ecr_registry_policy_policy
}
