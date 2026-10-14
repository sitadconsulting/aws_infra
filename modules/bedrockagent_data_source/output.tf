output "bedrockagent_data_source_data_source_id" {
  description = "Data Source ID"
  value       = element(concat(aws_bedrockagent_data_source.bedrockagent_data_source.*.data_source_id, [""]), 0)
}
output "bedrockagent_data_source_id" {
  description = "Identifier of the data source which consists of the data source ID and the knowledge base ID"
  value       = element(concat(aws_bedrockagent_data_source.bedrockagent_data_source.*.id, [""]), 0)
}
