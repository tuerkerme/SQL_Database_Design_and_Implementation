## Small Business Inventory Database

### Project Overview

The Small Business Inventory Database project involved designing and implementing a database system to manage products, suppliers, sales, and inventory levels for a small business. The primary goal was to create a robust and efficient system to track inventory movements, sales transactions, and supplier details.

### Objectives
Design a relational database schema suitable for a small business inventory system.
Implement the database schema with appropriate tables, relationships, and constraints.
Populate the database with sample data to simulate a realistic environment.
Test the database functionality through various SQL queries.

### Database Design
The database consists of four main tables:

Products: Stores details about products, including product ID, name, description, price, inventory level, and additional attributes like category, weight, dimensions, color, and manufacturer.

Suppliers: Contains information about suppliers, including supplier ID, name, contact information, and address.

Sales: Records sales transactions, with each record including a sale ID, date, product sold, quantity, and total sale amount.

Inventory Movements: Tracks changes in inventory, such as restocking from suppliers or decreases due to sales.

### Implementation
The database was implemented using SQL, with the following key steps:

Schema Creation: SQL statements were written and executed to create the tables with their respective columns, primary keys, and foreign key relationships.

Adding Constraints: Constraints were added to ensure data integrity, such as check constraints on product prices and inventory levels.

Data Insertion: Sample data was inserted into each table to simulate a working inventory system. This included adding products, suppliers, sales records, and inventory movements.

Querying and Testing: The database was tested through various SQL queries to ensure proper functionality. This included queries for inserting new records, updating inventory levels, and retrieving sales information.

### Challenges and Solutions
Data Integrity: Ensuring data integrity was a challenge, particularly in maintaining accurate inventory levels. This was addressed by implementing constraints and triggers in the database to automatically update inventory levels upon sales or restocking.

Schema Design: Designing a flexible and scalable schema required careful consideration, especially in determining the relationships between tables. The solution involved iterative design and review to ensure that the schema met all business requirements.

### Conclusion
The Small Business Inventory Database project successfully delivered a functional and robust database system tailored for a small business environment. The system efficiently manages inventory, sales, and supplier information, providing a solid foundation for business operations and decision-making.

### Future Work
User Interface Development: Develop a user-friendly interface for interacting with the database, making it accessible to non-technical users.

Reporting Features: Implement advanced reporting features to provide insights into sales trends, inventory levels, and supplier performance.

Scalability Improvements: Enhance the database schema and queries for scalability to accommodate future growth of the business.

## SQL CODES

### Creating Tables

1. Products Table

CREATE TABLE Products ( product_id INT PRIMARY KEY, name VARCHAR(255), description TEXT, price DECIMAL(10, 2), inventory_level INT, category VARCHAR(255), weight DECIMAL(5, 2), dimensions VARCHAR(255), color VARCHAR(255), manufacturer VARCHAR(255) ); 
Explanation: This statement creates the Products table with columns for product ID, name, description, price, inventory level, category, weight, dimensions, color, and manufacturer. The product_id is the primary key, uniquely identifying each product. The price and inventory_level are numeric fields, while the rest are text fields.

2. Suppliers Table

CREATE TABLE Suppliers ( supplier_id INT PRIMARY KEY, name VARCHAR(255), contact_info VARCHAR(255), address TEXT ); 
Explanation: This creates the Suppliers table with columns for supplier ID, name, contact information, and address. The supplier_id is the primary key.

3. Sales Table

CREATE TABLE Sales ( sale_id INT PRIMARY KEY, sale_date DATE, product_id INT, quantity INT, total_amount DECIMAL(10, 2), FOREIGN KEY (product_id) REFERENCES Products(product_id) ); 
Explanation: This statement creates the Sales table with columns for sale ID, sale date, product ID, quantity, and total sale amount. The sale_id is the primary key. It includes a foreign key relationship to the Products table, linking each sale to a product.

4. Inventory Movements Table

CREATE TABLE Inventory_Movements ( movement_id INT PRIMARY KEY, date DATE, product_id INT, change_in_quantity INT, movement_type VARCHAR(50), FOREIGN KEY (product_id) REFERENCES Products(product_id) ); 
Explanation: This creates the Inventory_Movements table to track inventory changes. It includes columns for movement ID, date, product ID, change in quantity, and movement type. The movement_id is the primary key. The table also has a foreign key relationship with the Products table.

### Inserting Data

1. Inserting into Products

INSERT INTO Products (product_id, name, description, price, inventory_level, category, weight, dimensions, color, manufacturer) VALUES (1, 'Product A', 'Description A', 100.00, 20, 'Category A', 1.0, '10x10x10', 'Red', 'Manufacturer A'), ... (additional products) ... (18, 'Fitness Tracker', 'Wearable fitness tracker with heart rate monitor', 99.00, 25, 'Wearables', 0.05, '9 inches (band length)', 'Black', 'FitTrack'); 
Explanation: These INSERT statements add sample products to the Products table, including details like product ID, name, description, price, inventory level, category, weight, dimensions, color, and manufacturer.

2. Inserting into Suppliers

INSERT INTO Suppliers (supplier_id, name, contact_info, address) VALUES (1, 'Supplier A', 'contact@suppliera.com', 'Address A'), ... (additional suppliers) ... ; 
Explanation: This adds sample suppliers to the Suppliers table with their IDs, names, contact information, and addresses.

3. Inserting into Sales

INSERT INTO Sales (sale_id, sale_date, product_id, quantity, total_amount) VALUES (1, '2024-01-01', 1, 2, 200.00), ... (additional sales) ... ; 
Explanation: This statement inserts sample sales records into the Sales table, including sale ID, date, product ID, quantity sold, and the total amount.
4. Inserting into Inventory Movements

INSERT INTO Inventory_Movements (movement_id, date, product_id, change_in_quantity, movement_type) VALUES (1, '2024-01-01', 1, 5, 'restock'), ... (additional movements) ... ; 
Explanation: These INSERT statements add sample inventory movement records to the Inventory_Movements table, including movement ID, date, product ID, change in quantity, and movement type (e.g., 'restock', 'sale').
