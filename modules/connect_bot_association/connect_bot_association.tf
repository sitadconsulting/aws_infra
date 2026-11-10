resource "aws_connect_bot_association" "connect_bot_association" {
  instance_id = var.connect_bot_association_instance_id
  
  dynamic "lex_bot" {
    for_each = var.connect_bot_association_lex_bot
      content {
        name   = lex_bot.value["name"]
        region = lex_bot.value["region"]
      }
  }
}
