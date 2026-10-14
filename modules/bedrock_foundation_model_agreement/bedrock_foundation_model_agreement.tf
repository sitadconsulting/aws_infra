resource "aws_bedrock_foundation_model_agreement" "bedrock_foundation_model_agreement" {
  model_id    = var.bedrock_foundation_model_agreement_model_id
  offer_token = var.bedrock_foundation_model_agreement_offer_token 
}
