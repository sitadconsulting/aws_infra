- rolearn: arn:aws:iam::${account_id}:role/${node_role}
  username: system:node:{{EC2PrivateDNSName}}
  groups:
    - system:bootstrappers
    - system:nodes
