{
  "Version": "2012-10-17", 
  "Statement": [ 
    { 
       "Effect": "Allow", 
       "Principal": {
         "AWS": [
           "*"
         ]
       }, 
       "Action":"es:*", 
       "Resource": "arn:aws:es:${aws_region}:${account_id}:domain/*" 
    } 
  ] 
}
