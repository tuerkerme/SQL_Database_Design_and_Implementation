CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    inventory_level INT
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(255),
    contact_info VARCHAR(255),
    address TEXT
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Inventory_Movements (
    movement_id INT PRIMARY KEY,
    date DATE,
    product_id INT,
    change_in_quantity INT,
    movement_type VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) CHECK (price >= 0),
    inventory_level INT DEFAULT 0 CHECK (inventory_level >= 0)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Inventory_Movements (
    movement_id INT PRIMARY KEY,
    date DATE NOT NULL,
    product_id INT NOT NULL,
    change_in_quantity INT NOT NULL,
    movement_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products (product_id, name, description, price, inventory_level) VALUES
(1, 'Laptop', 'High-performance laptop', 1200.00, 10),
(2, 'Smartphone', 'Latest model smartphone', 800.00, 15),
(3, 'Headphones', 'Noise-cancelling headphones', 150.00, 20);

INSERT INTO Suppliers (supplier_id, name, contact_info, address) VALUES
(1, 'TechSupply', 'info@techsupply.com', '123 Tech Street'),
(2, 'GadgetCorp', 'contact@gadgetcorp.com', '456 Gadget Avenue');

INSERT INTO Inventory_Movements (movement_id, date, product_id, change_in_quantity, movement_type) VALUES
(1, '2024-01-15', 1, 5, 'restock'),
(2, '2024-01-20', 1, -2, 'sale'),
(3, '2024-01-20', 2, 10, 'restock');

SELECT name, inventory_level FROM Products;

SELECT sale_date, quantity, total_amount FROM Sales WHERE product_id = 1;

UPDATE Products SET inventory_level = inventory_level - 2 WHERE product_id = 1;

INSERT INTO Suppliers (supplier_id, name, contact_info, address) VALUES (3, 'NewSupplier', 'email@newsupplier.com', '789 New Street');

INSERT INTO Products (product_id, name, description, price, inventory_level) VALUES
(4, 'Blue Widget', 'A versatile blue widget for various applications', 120.00, 30),
(5, 'Solar Charger', 'Portable solar charger for mobile devices', 75.00, 25),
(6, 'Wireless Earbuds', 'High-quality wireless earbuds with noise cancellation', 85.00, 20),
(7, 'Smart Watch', 'Stylish smart watch with health tracking features', 199.00, 15),
(8, 'LED Desk Lamp', 'Energy-efficient LED desk lamp with adjustable brightness', 45.00, 10),
(9, 'Bluetooth Speaker', 'Compact Bluetooth speaker with excellent sound quality', 60.00, 5),
(10, 'Electric Kettle', 'Fast-boiling electric kettle with temperature control', 50.00, 50),
(11, 'Yoga Mat', 'Eco-friendly, non-slip yoga mat', 35.00, 40),
(12, 'Backpack', 'Durable backpack suitable for travel and everyday use', 80.00, 35),
(13, 'Action Camera', 'Waterproof action camera for capturing outdoor adventures', 250.00, 30);

ALTER TABLE Products
ADD COLUMN category VARCHAR(255),
ADD COLUMN weight DECIMAL(5, 2),
ADD COLUMN dimensions VARCHAR(255),
ADD COLUMN color VARCHAR(255),
ADD COLUMN manufacturer VARCHAR(255);

UPDATE Products SET category = 'Electronics', weight = 0.50, dimensions = '5x2x1 inches', color = 'Blue', manufacturer = 'WidgetCo' WHERE product_id = 4;
UPDATE Products SET category = 'Electronics', weight = 0.30, dimensions = '6x3x0.5 inches', color = 'Black', manufacturer = 'SolarTech' WHERE product_id = 5;
UPDATE Products SET category = 'Audio', weight = 0.20, dimensions = '4x2x1 inches', color = 'White', manufacturer = 'SoundGood' WHERE product_id = 6;
UPDATE Products SET category = 'Wearables', weight = 0.25, dimensions = '1.5x1.5x0.5 inches', color = 'Black', manufacturer = 'TimeKeeper' WHERE product_id = 7;
UPDATE Products SET category = 'Home', weight = 1.00, dimensions = '12x7x7 inches', color = 'Silver', manufacturer = 'BrightLight' WHERE product_id = 8;
UPDATE Products SET category = 'Audio', weight = 0.60, dimensions = '8x3x3 inches', color = 'Red', manufacturer = 'MusicBox' WHERE product_id = 9;
UPDATE Products SET category = 'Kitchen', weight = 1.20, dimensions = '10x6x6 inches', color = 'White', manufacturer = 'QuickBoil' WHERE product_id = 10;
UPDATE Products SET category = 'Fitness', weight = 1.50, dimensions = '24x6 inches (rolled)', color = 'Green', manufacturer = 'YogaLife' WHERE product_id = 11;
UPDATE Products SET category = 'Travel', weight = 0.80, dimensions = '20x15x10 inches', color = 'Blue', manufacturer = 'TravelGear' WHERE product_id = 12;
UPDATE Products SET category = 'Electronics', weight = 0.35, dimensions = '2.5x1.5x1 inches', color = 'Black', manufacturer = 'AdventureCam' WHERE product_id = 13;

SELECT * FROM Products;

UPDATE Products SET 
    category = 'Computing', 
    weight = 2.50, 
    dimensions = '14x9x0.6 inches', 
    color = 'Silver', 
    manufacturer = 'CompTech'
WHERE product_id = 1;

UPDATE Products SET 
    category = 'Mobile', 
    weight = 0.20, 
    dimensions = '6x3x0.3 inches', 
    color = 'Black', 
    manufacturer = 'PhoneWorld'
WHERE product_id = 2;

UPDATE Products SET 
    category = 'Audio', 
    weight = 0.25, 
    dimensions = '7x7x1.5 inches', 
    color = 'Gray', 
    manufacturer = 'SoundMax'
WHERE product_id = 3;

INSERT INTO Products (product_id, name, description, price, inventory_level, category, weight, dimensions, color, manufacturer) VALUES
(14, 'Virtual Reality Headset', 'Immersive VR headset for gaming and entertainment', 299.00, 20, 'Gaming', 0.60, '8x7x4 inches', 'Black', 'VRWorld'),
(15, 'Wireless Mouse', 'Ergonomic wireless mouse with high precision', 29.99, 30, 'Computing Accessories', 0.10, '4x2x1 inches', 'Blue', 'ClickTech'),
(16, 'Water Bottle', 'Stainless steel insulated water bottle', 19.99, 50, 'Fitness Accessories', 0.35, '10x3 inches', 'Silver', 'HydroKeep'),
(17, 'Table Lamp', 'Modern LED table lamp with touch control', 39.95, 15, 'Home Decor', 1.00, '14x6x6 inches', 'White', 'BrightHome'),
(18, 'Fitness Tracker', 'Wearable fitness tracker with heart rate monitor', 99.00, 25, 'Wearables', 0.05, '9 inches (band length)', 'Black', 'FitTrack');
