- userarn: arn:aws:iam::${account_id}:user/${cluster_admin}
  username: ${cluster_admin}
  groups:
    - system:masters
- userarn: arn:aws:iam::${account_id}:user/${caller_user_id}
  username: ${caller_user_id}
  groups:
    - system:masters
