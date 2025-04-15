CREATE TABLE IF NOT EXISTS transactions_v2
	(
		transaction_id BIGINT,
		user_id BIGINT,
		amount DECIMAL,
		currency STRING,
		transaction_date TIMESTAMP,
		is_fraud INT
)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ','
	STORED AS TEXTFILE
	TBLPROPERTIES ("skip.header.line.count"="1");

LOAD DATA INPATH 's3a://dataprocbucket-alexde/src_data/transactions_v2.csv' INTO TABLE transactions_v2;

CREATE TABLE IF NOT EXISTS logs_v2
	(
		log_id BIGINT,
		transaction_id BIGINT,
		category STRING,
		comment STRING,
		log_timestamp TIMESTAMP
)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ';'
	STORED AS TEXTFILE
	TBLPROPERTIES ("skip.header.line.count"="1");

LOAD DATA INPATH 's3a://dataprocbucket-alexde/src_data/logs_v2.txt' INTO TABLE logs_v2;