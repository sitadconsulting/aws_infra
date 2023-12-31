{
  "type": "record",
  "name": "ClickEvent",
  "namespace": "tutorial.buildon.aws.streaming.avro",
  "fields": [
    {
      "name": "ip",
      "type": "string"
    },
    {
      "name": "eventtimestamp",
      "type": "long"
    },
    {
      "name": "devicetype",
      "type": "string"
    },
    {
      "name": "event_type",
      "type": [
        "string",
        "null"
      ]
    },
    {
      "name": "product_type",
      "type": [
        "string",
        "null"
      ]
    },
    {
      "name": "userid",
      "type": "int"
    },
    {
      "name": "globalseq",
      "type": "long"
    },
    {
      "name": "prevglobalseq",
      "type": "long",
      "default": 0
    }
  ]
}

