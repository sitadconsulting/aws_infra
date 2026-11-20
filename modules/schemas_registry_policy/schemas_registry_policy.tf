resource "aws_schemas_registry_policy" "schemas_registry_policy" {
  policy        = var.schemas_registry_policy_policy
  registry_name = var.schemas_registry_policy_registry_name
}
