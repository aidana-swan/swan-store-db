# SWAN STORE — Boutique Database System

### 🦢 Project Description
Swan Store — это современная система управления бутиком, решающая проблему автоматизации учета товаров, клиентов и программ лояльности. Система позволяет администратору управлять каталогом в реальном времени, а покупателям — просматривать актуальную коллекцию.

### 🛠 Tech Stack
* **Database:** PostgreSQL
* **Backend:** Node.js (Express API)
* **Frontend:** HTML5, CSS3 (Custom Luxury Design), JavaScript (Vanilla)

### 📊 Database Design
Проект построен на реляционной модели с соблюдением 3-й нормальной формы (3NF).

**Tables & Relationships:**
1.  **categories**: Справочник категорий (id, name).
2.  **products**: Список изделий (id, name, price, stock, category_id, image_url). Связь Many-to-One к категориям.
3.  **customers**: База данных клиентов (id, name).
4.  **orders**: История заказов (id, customer_id, order_date). Связь Many-to-One к клиентам.
5.  **loyalty_cards**: Программа лояльности (id, customer_id, bonus_points, status).

### 🚀 Setup Instructions
1. Установите PostgreSQL.
2. Создайте базу данных `swan_db`.
3. Выполните SQL скрипт из файла `schema.sql` (находится в репозитории).
4. Запустите сервер: `node index.js`.

### 🔍 Sample Queries
* **Aggregation (Подсчет запасов по категориям):**
    ```sql
    SELECT c.name, SUM(p.stock) FROM categories c 
    JOIN products p ON c.id = p.category_id GROUP BY c.name;
    ```
* **Join (История заказов с именами клиентов):**
    ```sql
    SELECT o.id, cu.name, o.order_date FROM orders o 
    JOIN customers cu ON o.customer_id = cu.id;
    ```

### 🔗 Links
* **Demo Video:** 
* **Feedback:** 
