from awsglue.dynamicframe import DynamicFrame
def populate_transactions_history (self,db_name,tbl_name):
    spark = self.glue_ctx.sparkSession
    dbname = db_name[0]
    tblname = tbl_name[0]
    import secrets
    import string
    import time
    from pyspark.sql.functions import col,lit
    df = self.toDF()
    batch_id = str(round(time.time()))+''.join(secrets.choice(string.ascii_uppercase + string.ascii_lowercase) for i in range(7))
    df.createOrReplaceTempView("incoming_data")
    
    merge_query = """merge into gsw_catalog.{}.{} existing using (select * from incoming_data) incoming 
    on existing.order_id = incoming.order_id
    when matched
    then update set 
    existing.is_current='N', 
    existing.batch_id='{}'
    when not matched
    then
    insert (order_id,product_id,event_time,promotion_code,manufacturer,product_price,quantity,product_name,product_description,purchase_price,batch_id,is_current,counter)
    values (incoming.order_id,incoming.product_id,incoming.event_time,incoming.promotion_code,incoming.manufacturer,incoming.product_price,incoming.quantity,incoming.product_name,incoming.product_description,incoming.purchase_price,'{}','Y','0')"""
    
    spark.sql(merge_query.format(dbname,tblname,batch_id,batch_id))
    
    locate_old_records_query="""
    select order_id as old_order_id, cast ((cast(counter as bigint)+1) as string)
    as new_counter from gsw_catalog.{}.{} 
    where is_current='N' and
    batch_id='{}'"""
    
    changed_orders=spark.sql(locate_old_records_query.format(dbname,tblname,batch_id))

    changed_orders.show(1,False)
    
    df_audit = df.withColumn("batch_id",lit(batch_id)).withColumn("is_current",lit("Y")).withColumn("counter",lit("0"))
    join_records = changed_orders.join(df_audit,changed_orders.old_order_id ==  df_audit.order_id,"left")
    join_records.createOrReplaceTempView("insert_records")
    
    spark.sql("""insert into gsw_catalog.{}.{} 
    select order_id,product_id,
    event_time,promotion_code,
    manufacturer,product_price,
    quantity,product_name,
    product_description,purchase_price,
    batch_id,'Y', new_counter
    from insert_records""".format(dbname,tblname))
    return self

DynamicFrame.populate_transactions_history=populate_transactions_history
