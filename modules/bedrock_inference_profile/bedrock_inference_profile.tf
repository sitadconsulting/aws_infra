resource "aws_bedrock_inference_profile" "bedrock_inference_profile" {
  description  = var.bedrock_inference_profile_description
  name         = var.bedrock_inference_profile_name
  tags         = var.bedrock_inference_profile_tags

  dynamic "model_source" {
    for_each = var.bedrock_inference_profile_model_source
      content {
        copy_from = model_source.value["copy_from"]
      }
  }
}
