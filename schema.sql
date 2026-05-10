-- SWAN STORE — Database Schema
-- PostgreSQL
## ER Diagram
![ER Diagram](swan_store_erd.html.png)
-- Categories
CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Products
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    stock INTEGER NOT NULL DEFAULT 0,
    category_id INTEGER REFERENCES categories(id) ON DELETE SET NULL,
    image_url TEXT
);

-- Customers
CREATE TABLE IF NOT EXISTS customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Orders
CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,
    order_date DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Order Items
CREATE TABLE IF NOT EXISTS order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id) ON DELETE CASCADE,
    product_id INTEGER REFERENCES products(id) ON DELETE SET NULL,
    quantity INTEGER NOT NULL DEFAULT 1
);

-- Loyalty Cards
CREATE TABLE IF NOT EXISTS loyalty_cards (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER UNIQUE REFERENCES customers(id) ON DELETE CASCADE,
    bonus_points INTEGER NOT NULL DEFAULT 0,
    status VARCHAR(20) NOT NULL DEFAULT 'active'
);

-- Sample Queries

-- 1. Stock by category
-- SELECT c.name, SUM(p.stock) as total_stock
-- FROM categories c
-- JOIN products p ON c.id = p.category_id
-- GROUP BY c.name
-- ORDER BY total_stock DESC;

-- 2. Orders with customer names
-- SELECT o.id, cu.name, o.order_date
-- FROM orders o
-- JOIN customers cu ON o.customer_id = cu.id
-- ORDER BY o.order_date DESC;

-- 3. Most expensive products
-- SELECT name, price FROM products
-- ORDER BY price DESC LIMIT 5;

-- 4. Active loyalty members with points
-- SELECT cu.name, lc.bonus_points
-- FROM loyalty_cards lc
-- JOIN customers cu ON lc.customer_id = cu.id
-- WHERE lc.status = 'active'
-- ORDER BY lc.bonus_points DESC;

-- 5. Full order details
-- SELECT o.id, cu.name, p.name as product, oi.quantity, p.price
-- FROM orders o
-- JOIN customers cu ON o.customer_id = cu.id
-- JOIN order_items oi ON o.id = oi.order_id
-- JOIN products p ON oi.product_id = p.id;
