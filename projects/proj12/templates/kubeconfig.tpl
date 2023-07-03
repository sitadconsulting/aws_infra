apiVersion: v1
preferences: {}
kind: Config

clusters:
- cluster:
    server: ${cluster_endpoint}
    certificate-authority-data: ${cluster_auth_base64}
  name: arn:aws:eks:${aws_region}:${account_id}:cluster/${clustername}

contexts:
- context:
    cluster: arn:aws:eks:${aws_region}:${account_id}:cluster/${clustername}
    user: arn:aws:eks:${aws_region}:${account_id}:cluster/${clustername}
  name: arn:aws:eks:${aws_region}:${account_id}:cluster/${clustername}

current-context: arn:aws:eks:${aws_region}:${account_id}:cluster/${clustername}

users:
- name: arn:aws:eks:${aws_region}:${account_id}:cluster/${clustername}
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      command: aws
      args:
        - --region
        - "${aws_region}"
        - "eks"
        - "get-token"
        - --cluster-name
        - "${clustername}"
