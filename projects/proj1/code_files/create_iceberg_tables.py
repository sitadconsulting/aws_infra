import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
import boto3

args = getResolvedOptions(sys.argv, ['JOB_NAME','TBL_BASE_PATH','DB_NAME'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)
table_base_path = args['TBL_BASE_PATH']
db_name = args['DB_NAME']

leaderboard_path = table_base_path+"leader_board/"
transactions_path = table_base_path+"transactions/"
transactions_history_path = table_base_path+"transactions_history/"


leader_board_create = "create table gsw_catalog."+db_name+".leader_board(manufacturer string, item_count long) using iceberg location '"+leaderboard_path+"'"
transactions_create = "create table gsw_catalog."+db_name+".transactions (order_id string,product_id string,event_time string,promotion_code string,manufacturer string,product_price string,quantity string,product_name string,product_description string,purchase_price string) using iceberg location '"+transactions_path+"'"
transactions_history_create = "create table gsw_catalog."+db_name+".transactions_history (order_id string,product_id string,event_time string,promotion_code string,manufacturer string,product_price string,quantity string,product_name string,product_description string,purchase_price string,batch_id string, is_current string, counter string) using iceberg location '"+transactions_history_path+"'"


spark.sql(leader_board_create)
spark.sql(transactions_create)
spark.sql(transactions_history_create)

job.commit()
