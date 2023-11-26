-- Suppliers Table
CREATE TABLE Suppliers (
    SupplierID UUID PRIMARY KEY,
    SupplierName TEXT,
    ContactInformation TEXT,
    ProductCategoriesSupplied TEXT[]
);


-- Warehouses Table
CREATE TABLE Warehouses (
    WarehouseID UUID PRIMARY KEY,
    WarehouseName TEXT,
    Location TEXT,
    Capacity INT,
    ContactInformation TEXT
);


-- Products Table
CREATE TABLE Products (
    ProductID UUID PRIMARY KEY,
    ProductName TEXT,
    ProductDescription TEXT,
    Category TEXT,
    Price DECIMAL,
    SupplierID UUID,
    WarehouseID UUID,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID)
);


-- Orders Table
CREATE TABLE Orders (
    OrderID UUID PRIMARY KEY,
    OrderDate DATE,
    CustomerName TEXT,
    OrderStatus TEXT,
    TotalOrderAmount DECIMAL,
    ShippingAddress TEXT
);

-- Order Details Table
CREATE TABLE OrderDetails (
    OrderDetailID UUID PRIMARY KEY,
    OrderID UUID,
    ProductID UUID,
    QuantityOrdered INT,
    UnitPrice DECIMAL,
    TotalLineItemAmount DECIMAL,
    SupplierID UUID,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Shipments Table
CREATE TABLE Shipments (
    ShipmentID UUID PRIMARY KEY,
    OrderID UUID,
    WarehouseID UUID,
    ShipmentDate DATE,
    ShipmentStatus TEXT,
    TrackingInformation TEXT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID)
);

-- Inventory Levels Table
CREATE TABLE InventoryLevels (
    WarehouseID UUID,
    ProductID UUID,
    QuantityOnHand INT,
    MinimumStockLevel INT,
    MaximumStockLevel INT,
    ReorderPoint INT,
    LastRestockDate DATE,
    PRIMARY KEY (WarehouseID, ProductID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
