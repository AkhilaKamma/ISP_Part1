-- Insert data into Products table
INSERT INTO Products (ProductID, ProductName, ProductDescription, Category, Price, SupplierID)
VALUES
    ('550e8400-e29b-41d4-a716-446655440001', 'Product1', 'Description1', 'Category1', 20.5, '8a3e5d56-7b70-4a6f-a9c0-8b0c0bb1c063'),
    ('9d8a6ad0-4ca6-49a3-83d2-096b01abdc91', 'Product2', 'Description2', 'Category2', 30.75, 'baa74302-7c5e-4174-8364-9d885e8d3ef8'),
    ('8cfc45f0-5e58-44f6-96e2-4fb6b3d79d29', 'Product3', 'Description3', 'Category1', 15.0, '8a3e5d56-7b70-4a6f-a9c0-8b0c0bb1c063');

-- Insert data into Warehouses table
INSERT INTO Warehouses (WarehouseID, WarehouseName, Location, Capacity, ContactInformation)
VALUES
    ('b8b17a8d-64c0-49a2-9c56-4c6c3c1142fe', 'Warehouse1', 'Location1', 1000, 'Contact1'),
    ('e8266422-cc0d-42a9-9d82-dbdcc3fb7b1d', 'Warehouse2', 'Location2', 1500, 'Contact2');

-- Insert data into Suppliers table
INSERT INTO Suppliers (SupplierID, SupplierName, ContactInformation, ProductCategoriesSupplied)
VALUES
    ('8a3e5d56-7b70-4a6f-a9c0-8b0c0bb1c063', 'Supplier1', 'SupplierContact1', ARRAY['Category1', 'Category3']),
    ('baa74302-7c5e-4174-8364-9d885e8d3ef8', 'Supplier2', 'SupplierContact2', ARRAY['Category2']);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, OrderDate, CustomerName, OrderStatus, TotalOrderAmount, ShippingAddress)
VALUES
    ('fd8e7ed2-8cfd-4cd8-836f-774d3557d26b', '2023-11-25', 'Customer1', 'Shipped', 100.0, 'Address1'),
    ('48f67e3b-981d-4e2b-b373-303f3423e1d0', '2023-11-26', 'Customer2', 'Processing', 75.5, 'Address2');

-- Insert data into OrderDetails table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, QuantityOrdered, UnitPrice, TotalLineItemAmount)
VALUES
    ('37298d7c-1cc8-4e9e-a4d4-0fb2a814322e', 'fd8e7ed2-8cfd-4cd8-836f-774d3557d26b', '550e8400-e29b-41d4-a716-446655440001', 2, 20.5, 41.0),
    ('f6e9a78f-047e-43c4-a7f0-57ef98e56a8f', 'fd8e7ed2-8cfd-4cd8-836f-774d3557d26b', '9d8a6ad0-4ca6-49a3-83d2-096b01abdc91', 1, 30.75, 30.75),
    ('a243f1db-1e5d-4ec2-b45a-1d9e3bbff801', '48f67e3b-981d-4e2b-b373-303f3423e1d0', '8cfc45f0-5e58-44f6-96e2-4fb6b3d79d29', 3, 15.0, 45.0);

-- Insert data into Shipments table
INSERT INTO Shipments (ShipmentID, OrderID, WarehouseID, ShipmentDate, ShipmentStatus, TrackingInformation)
VALUES
    ('8c43f5f0-b0cf-4d19-9e02-8f9fc993cbdb', 'fd8e7ed2-8cfd-4cd8-836f-774d3557d26b', 'b8b17a8d-64c0-49a2-9c56-4c6c3c1142fe', '2023-11-25', 'Shipped', 'TrackingInfo1'),
    ('dd9e732b-7d9b-4ac8-b997-2c5fb736e0c5', '48f67e3b-981d-4e2b-b373-303f3423e1d0', 'e8266422-cc0d-42a9-9d82-dbdcc3fb7b1d', '2023-11-26', 'Processing', 'TrackingInfo2');

-- Insert data into InventoryLevels table
INSERT INTO InventoryLevels (WarehouseID, ProductID, QuantityOnHand, MinimumStockLevel, MaximumStockLevel, ReorderPoint, LastRestockDate)
VALUES
    ('b8b17a8d-64c0-49a2-9c56-4c6c3c1142fe', '550e8400-e29b-41d4-a716-446655440001', 50, 10, 100, 20, '2023-11-24'),
    ('e8266422-cc0d-42a9-9d82-dbdcc3fb7b1d', '9d8a6ad0-4ca6-49a3-83d2-096b01abdc91', 75, 15, 120, 25, '2023-11-23');
