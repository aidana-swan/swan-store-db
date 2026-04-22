🛍️ Online Store Database
📌 Overview
This project represents a relational database for an online store.
It includes products, customers, orders, and order items, and supports analytics such as total sales, product popularity, and order summaries.

🧱 Database Structure
👤 customers
Stores information about customers.

id — primary key
name — customer name
📦 products
Product catalog.

id — primary key
name — product name
price — product price
stock — available quantity
category_id — product category
🧾 orders
Customer orders.

id — primary key
customer_id — reference to customers
🛒 order_items
Items inside each order.

order_id — reference to orders
product_id — reference to products
quantity — number of items
🔗 Relationships
orders.customer_id → customers.id
order_items.order_id → orders.id
order_items.product_id → products.id
All foreign key relationships can be viewed via information_schema.

📥 Sample Data Insert
INSERT INTO products (name, price, stock, category_id) VALUES
('Swan Grace Dress', 22000, 5, 3),
('White Swan Silk Blouse', 12000, 10, 3),
('Crystal Swan Evening Gown', 24000, 3, 3),
('Swan Feather Skirt', 9000, 8, 3),
('Elegant Swan Heels', 18000, 6, 3);

💰 Фильтрация товаров
товары от 15000 до 23000
SELECT name, price
FROM products
WHERE price BETWEEN 15000 AND 23000;

товары дороже 15000
SELECT name, price
FROM products
WHERE price > 15000;

🧾 Orders + Customers
SELECT orders.id, customers.name
FROM orders
JOIN customers ON orders.customer_id = customers.id;

🛒 Order Items (состав заказа)
SELECT 
    orders.id AS order_id,
    products.name,
    order_items.quantity
FROM order_items
JOIN orders ON order_items.order_id = orders.id
JOIN products ON order_items.product_id = products.id;

📦 Топ продаваемых товаров
SELECT product_id, SUM(quantity) AS total_sold
FROM order_items
GROUP BY product_id
ORDER BY total_sold DESC;

💳 Общая сумма заказов
SELECT 
    orders.id,
    SUM(products.price * order_items.quantity) AS total_price
FROM orders
JOIN order_items ON orders.id = order_items.order_id
JOIN products ON products.id = order_items.product_id
GROUP BY orders.id;

💎 Самый дорогой товар
SELECT name, price
FROM products
WHERE price = (SELECT MAX(price) FROM products);

🧠 VIEW (представление)
CREATE VIEW order_summary AS
SELECT 
    orders.id,
    customers.name,
    SUM(products.price * order_items.quantity) AS total
FROM orders
JOIN customers ON orders.customer_id = customers.id
JOIN order_items ON orders.id = order_items.order_id
JOIN products ON products.id = order_items.product_id
GROUP BY orders.id, customers.name;
