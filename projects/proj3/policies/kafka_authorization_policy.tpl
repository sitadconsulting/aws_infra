{
   "Version": "2012-10-17",
   "Statement": [
     {
        "Effect": "Allow",
        "Action": [
          "kafka-cluster:Connect",
          "kafka-cluster:AlterCluster",
          "kafka-cluster:DescribeCluster",
          "kafka-cluster:ListNodes",
          "kafka-cluster:DescribeClusterDynamicConfiguration"
        ],
        "Resource": [
          "arn:aws:kafka:${aws_region}:${account_id}:cluster/${msk_cluster_name}/${msk_cluster_uuid}"
        ]
     },
     {
        "Effect": "Allow",
          "Action": [
            "kafka-cluster:*Topic*",
            "kafka-cluster:WriteData",
            "kafka-cluster:ReadData"
          ],
          "Resource": [
            "arn:aws:kafka:${aws_region}:${account_id}:topic/${msk_cluster_name}/*"
          ]
     },
     {
        "Effect": "Allow",
          "Action": [
            "kafka-cluster:*Topic*",
            "kafka-cluster:WriteData",
            "kafka-cluster:ReadData"
          ],
          "Resource": [
            "arn:aws:kafka:${aws_region}:${account_id}:topic/${msk_cluster_name}/${msk_cluster_uuid}/__amazon_msk_connect_*"
          ]
     },
     {
        "Effect": "Allow",
          "Action": [
            "kafka-cluster:AlterGroup",
            "kafka-cluster:DescribeGroup"
          ],
          "Resource": [
            "arn:aws:kafka:${aws_region}:${account_id}:group/${msk_cluster_name}/*",
            "arn:aws:kafka:${aws_region}:${account_id}:group/${msk_cluster_name}/${msk_cluster_uuid}/__amazon_msk_connect_*",
            "arn:aws:kafka:${aws_region}:${account_id}:group/${msk_cluster_name}/${msk_cluster_uuid}/connect-*"
          ]
     },
     {
        "Effect": "Allow",
        "Action": [
          "s3:ListAllMyBuckets"
        ],
        "Resource": "arn:aws:s3:::*"
     },
     {
        "Effect": "Allow",
        "Action": [
          "s3:ListBucket",
          "s3:GetBucketLocation",
          "s3:DeleteObject"
        ],
        "Resource": [
          "arn:aws:s3:::${kafka_connect_target_bucket}"
        ]
     },
     {
        "Effect": "Allow",
        "Action": [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:AbortMultipartUpload",
          "s3:ListMultipartUploadParts",
          "s3:ListBucketMultipartUploads"
        ],
        "Resource": "arn:aws:s3:::${kafka_connect_target_bucket}/*"
     },
     {
        "Effect": "Allow",
        "Action": [
          "s3:GetObject"
        ],
        "Resource": [
          "arn:aws:s3:::${kafka_connect_target_bucket}/*"
        ]
     }
   ]
}
