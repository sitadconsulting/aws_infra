variable "iot_event_configurations_event_configurations" {
  description = "(Required) Map. The new event configuration values. You can use only these strings as keys: THING_GROUP_HIERARCHY, THING_GROUP_MEMBERSHIP, THING_TYPE, THING_TYPE_ASSOCIATION, THING_GROUP, THING, POLICY, CA_CERTIFICATE, JOB_EXECUTION, CERTIFICATE, JOB. Use boolean for values of mapping"
  type        = map(string)
}
