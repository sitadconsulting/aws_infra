output "datazone_glossary_id" {
  description = "ID of the Glossary"
  value       = element(concat(aws_datazone_glossary.datazone_glossary.*.id, [""]), 0)
}
