import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

from pyspark.sql import DataFrame, Row
import datetime
from awsglue import DynamicFrame
import populate_transactions_history
from awsglue.dynamicframe import DynamicFrameCollection
from awsglue.dynamicframe import DynamicFrame
from awsglue import DynamicFrame


# Script generated for node Find Leading Manufacturer
def MyTransform(glueContext, dfc) -> DynamicFrameCollection:
    import pyspark.sql.functions as F
    from datetime import datetime
    from pyspark.sql.functions import col, lit

    df = dfc.select(list(dfc.keys())[0]).toDF()
    leader = (
        df.groupBy(F.col("manufacturer"), F.window(F.col("event_time"), "60 seconds"))
        .count()
        .select("manufacturer", "count")
    )
    leaderDyf = DynamicFrame.fromDF(leader, glueContext, "result0")
    return DynamicFrameCollection({"CustomTransform0": leaderDyf}, glueContext)


def sparkSqlQuery(glueContext, query, mapping, transformation_ctx) -> DynamicFrame:
    for alias, frame in mapping.items():
        frame.toDF().createOrReplaceTempView(alias)
    result = spark.sql(query)
    return DynamicFrame.fromDF(result, glueContext, transformation_ctx)


args = getResolvedOptions(sys.argv, ["JOB_NAME"])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args["JOB_NAME"], args)

# Script generated for node Amazon Kinesis
dataframe_AmazonKinesis_node = glueContext.create_data_frame.from_catalog(
    database="gsw_iceberg",
    table_name="gsw_stream",
    additional_options={"startingPosition": "TRIM_HORIZON", "inferSchema": "false"},
    transformation_ctx="dataframe_AmazonKinesis_node",
)

# Script generated for node Product Data
ProductData_node = glueContext.create_dynamic_frame.from_catalog(
    database="gsw_iceberg",
    table_name="product_data",
    transformation_ctx="ProductData_node",
)


def processBatch(data_frame, batchId):
    if data_frame.count() > 0:
        AmazonKinesis_node = DynamicFrame.fromDF(
            data_frame, glueContext, "from_data_frame"
        )
        # Script generated for node Enrich Stream
        AmazonKinesis_nodeDF = AmazonKinesis_node.toDF()
        ProductData_nodeDF = ProductData_node.toDF()
        EnrichStream_node = DynamicFrame.fromDF(
            AmazonKinesis_nodeDF.join(
                ProductData_nodeDF,
                (
                    AmazonKinesis_nodeDF["product_id"]
                    == ProductData_nodeDF["id"]
                ),
                "left",
            ),
            glueContext,
            "EnrichStream_node",
        )

        # Script generated for node Drop Duplicate Column
        DropDuplicateColumn_node = DropFields.apply(
            frame=EnrichStream_node,
            paths=["id"],
            transformation_ctx="DropDuplicateColumn_node",
        )

        # Script generated for node Find Leading Manufacturer
        FindLeadingManufacturer_node = MyTransform(
            glueContext,
            DynamicFrameCollection(
                {
                    "DropDuplicateColumn_node": DropDuplicateColumn_node
                },
                glueContext,
            ),
        )

        # Script generated for node Populate Transactions History
        PopulateTransactionsHistory_node = (
            DropDuplicateColumn_node.populate_transactions_history(
                db_name=["gsw_iceberg"], tbl_name=["transactions_history"]
            )
        )

        # Script generated for node Select Stream Data From Collection
        SelectStreamDataFromCollection_node = SelectFromCollection.apply(
            dfc=FindLeadingManufacturer_node,
            key=list(FindLeadingManufacturer_node.keys())[0],
            transformation_ctx="SelectStreamDataFromCollection_node",
        )

        # Script generated for node Populate Transactions table
        SqlQuery0 = """
        merge into gsw_catalog.gsw_iceberg.transactions existing using (select * from myDataSource) incoming 
                on existing.order_id = incoming.order_id
                when matched
                then update set 
                existing.promotion_code=incoming.promotion_code, 
                existing.purchase_price=incoming.purchase_price,
                existing.event_time=incoming.event_time
                when not matched
                then
                insert *
        """
        PopulateTransactionstable_node = sparkSqlQuery(
            glueContext,
            query=SqlQuery0,
            mapping={"myDataSource": PopulateTransactionsHistory_node},
            transformation_ctx="PopulateTransactionstable_node",
        )

        # Script generated for node Populate Leader Board
        SqlQuery1 = """
        insert OVERWRITE gsw_catalog.gsw_iceberg.leader_board 
                (
                select manufacturer,sum(item_count) as item_count
                from 
                (
                select manufacturer,item_count from gsw_catalog.gsw_iceberg.leader_board 
                union 
                select manufacturer,count as item_count from leader
                )
                group by manufacturer
                )
        """
        PopulateLeaderBoard_node = sparkSqlQuery(
            glueContext,
            query=SqlQuery1,
            mapping={"leader": SelectStreamDataFromCollection_node},
            transformation_ctx="PopulateLeaderBoard_node",
        )


glueContext.forEachBatch(
    frame=dataframe_AmazonKinesis_node,
    batch_function=processBatch,
    options={
        "windowSize": "60 seconds",
        "checkpointLocation": args["TempDir"] + "/" + args["JOB_NAME"] + "/checkpoint/",
    },
)
job.commit()
