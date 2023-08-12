import os
import boto3

# set variables
bucket_name = str(os.environ['BUCKET'])
db_name = str(os.environ['DATABASE_NAME'])
query = """CREATE EXTERNAL TABLE {db_name}.product_data(id string, manufacturer string, product_name string, product_description string)
        ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
        LOCATION 's3://{bucket_name}/data/product_data/'
        TBLPROPERTIES (\"skip.header.line.count\"=\"1\")""".format(db_name=db_name, bucket_name=bucket_name)
athena_path = "s3://{bucket_name}/athena_results/".format(bucket_name=bucket_name)

def lambda_handler(event, context):
    # Initiate the Boto3 Client
    client = boto3.client('athena')

    # Start the query execution
    response = client.start_query_execution(
        QueryString=query,
        QueryExecutionContext={
            'Database': db_name
        },
        ResultConfiguration={
            'OutputLocation': athena_path
        }
    )

    # Return response after starting the query execution
    return response
