CREATE TABLE transactions_v2
    (
        transaction_id INT,
        user_id INT,
        amount DECIMAL,
        currency STRING,
        transaction_date TIMESTAMP,
        is_fraud INT
    )
    ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ','
    STORED AS TEXTFILE