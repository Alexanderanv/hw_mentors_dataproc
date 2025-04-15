-- orders

CREATE TABLE IF NOT EXISTS orders (
    order_id UInt32,
    user_id UInt32,
    order_date DateTime,
    total_amount Float32,
    payment_status LowCardinality(String)  -- Оптимизация для строковых значений с малым количеством вариантов
) 
ENGINE = MergeTree()
ORDER BY (order_id);

INSERT INTO orders
SELECT 
    toUInt32(order_id) AS order_id,
    toUInt32(user_id) AS user_id,
    order_date AS order_date,
    toFloat32(total_amount) AS total_amount,
    payment_status
FROM s3(
    'https://storage.yandexcloud.net/dataprocbucket-alexde/src_data/orders.csv',
    'CSVWithNames'
);

-- order_items

CREATE TABLE IF NOT EXISTS order_items (
    item_id UInt32,
    order_id UInt32,
    product_name String,
    product_price Float32,
    quantity UInt32
) 
ENGINE = MergeTree()
ORDER BY (order_id, item_id);

INSERT INTO order_items
SELECT 
    toUInt32(item_id) AS item_id,
    toUInt32(order_id) AS order_id,
    product_name,
    toFloat32(product_price) AS product_price,
    toUInt32(quantity) AS quantity
FROM s3(
    'https://storage.yandexcloud.net/dataprocbucket-alexde/src_data/order_items.txt',
    'CSVWithNames'
)
SETTINGS format_csv_delimiter = ';';