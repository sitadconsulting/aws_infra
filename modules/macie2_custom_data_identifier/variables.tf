variable "macie2_custom_data_identifier_description" {
  description = "(Optional) Custom description of the custom data identifier. Can contain as many as 512 characters"
  type        = string
  default     = null
}
variable "macie2_custom_data_identifier_ignore_words" {
  description = "(Optional) Array that lists specific character sequences (ignore words) to exclude from the results. If the text matched by the regular expression is the same as any string in this array, Amazon Macie ignores it. The array can contain as many as 10 ignore words. Each ignore word can contain 4 - 90 characters. Ignore words are case sensitive"
  type        = list(string)
  default     = null
}
variable "macie2_custom_data_identifier_keywords" {
  description = "(Optional) Array that lists specific character sequences (keywords), one of which must be within proximity (maximum_match_distance) of the regular expression to match. The array can contain as many as 50 keywords. Each keyword can contain 3 - 90 characters. Keywords aren't case sensitive"
  type        = list(string)
  default     = null
}
variable "macie2_custom_data_identifier_maximum_match_distance" {
  description = "(Optional) Maximum number of characters that can exist between text that matches the regex pattern and the character sequences specified by the keywords array. Macie includes or excludes a result based on the proximity of a keyword to text that matches the regex pattern. The distance can be 1 - 300 characters. The default value is 50"
  type        = number
  default     = null
}
variable "macie2_custom_data_identifier_name" {
  description = "(Optional) Custom name for the custom data identifier. Can contain as many as 128 characters. If omitted, Terraform assigns a random, unique name. Conflicts with name_prefix"
  type        = string
  default     = null
}
variable "macie2_custom_data_identifier_name_prefix" {
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "macie2_custom_data_identifier_regex" {
  description = "(Optional) Regular expression (regex) that defines the pattern to match. The expression can contain as many as 512 characters"
  type        = string
  default     = null
}
variable "macie2_custom_data_identifier_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
