{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::${account_id}:oidc-provider/${oidc_id}"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "${oidc_id}:sub": "system:serviceaccount:${namespace}:${service_account}",
          "${oidc_id}:aud": "sts.amazonaws.com"
        }
      }
    }
  ]
}
