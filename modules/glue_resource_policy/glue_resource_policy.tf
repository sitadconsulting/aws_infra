resource "aws_glue_resource_policy" "glue_resource_policy" {
  enable_hybrid = var.glue_resource_policy_enable_hybrid
  policy        = var.glue_resource_policy_policy
}
