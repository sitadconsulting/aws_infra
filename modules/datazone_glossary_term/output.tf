output "datazone_glossary_term_created_at" {
  description = "Time of glossary term creation"
  value       = element(concat(aws_datazone_glossary_term.datazone_glossary_term.*.created_at, [""]), 0)
}
output "datazone_glossary_term_created_by" {
  description = "Creator of glossary term"
  value       = element(concat(aws_datazone_glossary_term.datazone_glossary_term.*.created_by, [""]), 0)
}
output "datazone_glossary_term_id" {
  description = "ID of the glossary term"
  value       = element(concat(aws_datazone_glossary_term.datazone_glossary_term.*.id, [""]), 0)
}
