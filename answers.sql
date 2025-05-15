-- Assignment: Database Design and Normalization
-- Author: Keath Morgan
-- Date: 15/5/2025

-- ------------------------------------------------------------
-- Question 1: Achieving 1NF
-- Original table violates 1NF due to multivalued Products column.
-- Transform the table so each product appears in its own row.

-- Step 1: Create the normalized ProductDetail_1NF table
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Step 2: Insert normalized data (1NF - atomic values only)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- ------------------------------------------------------------
-- Question 2: Achieving 2NF
-- The existing table has partial dependency: CustomerName depends only on OrderID.

-- Step 1: Create Orders table with OrderID and CustomerName (removing partial dependency)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Create OrderItems table with OrderID, Product, Quantity
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 3: Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 4: Insert data into OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);