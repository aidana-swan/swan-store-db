# SWAN STORE — Boutique Database System
<img width="2528" height="1440" alt="Screenshot 2026-05-12 at 14 39 23" src="https://github.com/user-attachments/assets/4783b27e-a858-46b7-a4e8-8e03f795ce96" />

### 🦢 Project Description
Swan Store — это современная система управления бутиком, решающая проблему автоматизации учета товаров, клиентов и программ лояльности. Система позволяет администратору управлять каталогом в реальном времени, а покупателям — просматривать актуальную коллекцию.

### 🛠 Tech Stack
* **Database:** PostgreSQL
* **Backend:** Node.js (Express API)
* **Frontend:** HTML5, CSS3 (Custom Luxury Design), JavaScript (Vanilla)
<img width="2560" height="1664" alt="Screenshot 2026-05-12 at 14 40 30" src="https://github.com/user-attachments/assets/d558d45d-6543-4756-848c-d24f1f7dd692" />

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

   <img width="2560" height="1664" alt="Screenshot 2026-05-12 at 14 43 14" src="https://github.com/user-attachments/assets/d0587326-0135-430c-9b9f-dba56aa49f2f" />


## ER Diagram
фото приведено в erd.png
<img width="1144" height="958" alt="erd" src="https://github.com/user-attachments/assets/d13f098a-6012-4cbf-8f6f-9bf3d6851679" />

### 🔍 Sample Queries
* **Aggregation (Подсчет запасов по категориям):**
    ```sql
    SELECT c.name, SUM(p.stock) FROM categories c 
    JOIN products p ON c.id = p.category_id GROUP BY c.name;
    
    ```
    <img width="2560" height="1664" alt="Screenshot 2026-05-12 at 14 41 54" src="https://github.com/user-attachments/assets/ff5ccf0a-6ed9-41c8-8269-454e9f7d0c23" />
<img width="2560" height="1664" alt="Screenshot 2026-05-12 at 14 41 54" src="https://github.com/user-attachments/assets/51064d81-2619-4c20-90d3-034b16b8a028" />

* **Join (История заказов с именами клиентов):**
    ```sql
    SELECT o.id, cu.name, o.order_date FROM orders o 
    JOIN customers cu ON o.customer_id = cu.id;
    ```
    <img width="2560" height="1664" alt="Screenshot 2026-05-12 at 14 41 08" src="https://github.com/user-attachments/assets/48df3f2f-d37a-4d98-a023-5aff1c6333c3" />


### 🔗 Links
* **Demo Video:**
* https://youtu.be/QDy7hg1Z5aY?si=D0oeCRWTV3LuG1bJ
* 
* **Feedback:**
* https://youtu.be/xpNTVBSO134?si=znPl3POXydy4leJS

* **Presentation:**
https://canva.link/lwmajzpo95327e3

* ** Website**
http://localhost:3000/index.html

###  Stepik certificate
<img width="1826" height="1280" alt="Screenshot 2026-05-12 at 15 17 19" src="https://github.com/user-attachments/assets/28e58b0a-c231-4133-9e31-59931e03b781" />
