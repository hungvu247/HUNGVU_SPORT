drop database HungVu

CREATE TABLE Category (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    category_name VARCHAR(255),
    description TEXT
);


CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    description TEXT,
    category_id INT,
    price DECIMAL(10, 2),
    quantity_available INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(100),
    Role VARCHAR(10) NOT NULL CHECK (Role IN ('customer', 'admin'))
);

CREATE TABLE OrderTable (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME,
    total_amount DECIMAL(10, 2),
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Users(user_id)
);

CREATE TABLE Order_Item (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES OrderTable(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    rating INT,
    comment TEXT,
    review_date DATETIME,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (customer_id) REFERENCES Users(user_id)
);

CREATE TABLE Cart (
    cart_id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);










--Insert Users
-- Inserting sample user accounts
INSERT INTO Users (user_id, username, password, Role)
VALUES
    (1, 'customer1', 'password123', 'customer'),
    (2, 'customer2', 'securepass', 'customer'),
    (3, 'admin1', 'adminpass', 'admin'),
    (4, 'admin2', 'adm!n@pass', 'admin');
	-- Inserting sample product
	