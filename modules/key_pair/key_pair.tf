resource "aws_key_pair" "key_pair" {
  key_name   = var.key_pair_key_name
  public_key = var.key_pair_public_key 

  tags = merge(
    {
      "Name" = format(
        "%s-key_pair-%s-%s",
        var.name,
        var.key_pair_key_name,
        var.environment,
      )
    },
    var.tags,
    var.key_pair_tags,
  )

}


