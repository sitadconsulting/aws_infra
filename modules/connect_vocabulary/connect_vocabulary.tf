resource "aws_connect_vocabulary" "connect_vocabulary" {
  content       = var.connect_vocabulary_content
  instance_id   = var.connect_vocabulary_instance_id
  language_code = var.connect_vocabulary_language_code
  name          = var.connect_vocabulary_name
  tags          = var.connect_vocabulary_tags 
}
