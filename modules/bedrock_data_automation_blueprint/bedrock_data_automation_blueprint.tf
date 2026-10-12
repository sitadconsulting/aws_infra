resource "awscc_bedrock_blueprint"  "bedrock_blueprint" {
  blueprint_name         = var.bedrock_blueprint_blueprint_name
  kms_encryption_context = var.bedrock_blueprint_kms_encryption_context
  kms_key_id             = var.bedrock_blueprint_kms_key_id
  schema                 = var.bedrock_blueprint_schema
  tags                   = var.bedrock_blueprint_tags
  type                   = var.bedrock_blueprint_type
}
