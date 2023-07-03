- objectName: ${secret_objects_arn}
  objectType: "secretsmanager"
  jmesPath:
    - path: "username"
      objectAlias: "dbUsername"
    - path: "password"
      objectAlias: "dbPassword"
