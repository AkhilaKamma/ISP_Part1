CREATE TABLE Products (
    ProductID UUID PRIMARY KEY,
    ProductName TEXT,
    ProductDescription TEXT,
    Category TEXT,
    Price DECIMAL,
    SupplierID UUID
);


CREATE TABLE Warehouses (
    WarehouseID UUID PRIMARY KEY,
    WarehouseName TEXT,
    Location TEXT,
    Capacity INT,
    ContactInformation TEXT
);


CREATE TABLE Suppliers (
    SupplierID UUID PRIMARY KEY,
    SupplierName TEXT,
    ContactInformation TEXT,
    ProductCategoriesSupplied TEXT[]
);

CREATE TABLE Orders (
    OrderID UUID PRIMARY KEY,
    OrderDate DATE,
    CustomerName TEXT,
    OrderStatus TEXT,
    TotalOrderAmount DECIMAL,
    ShippingAddress TEXT
);


CREATE TABLE OrderDetails (
    OrderDetailID UUID PRIMARY KEY,
    OrderID UUID,
    ProductID UUID,
    QuantityOrdered INT,
    UnitPrice DECIMAL,
    TotalLineItemAmount DECIMAL
);


CREATE TABLE Shipments (
    ShipmentID UUID PRIMARY KEY,
    OrderID UUID,
    WarehouseID UUID,
    ShipmentDate DATE,
    ShipmentStatus TEXT,
    TrackingInformation TEXT
);


CREATE TABLE InventoryLevels (
    WarehouseID UUID,
    ProductID UUID,
    QuantityOnHand INT,
    MinimumStockLevel INT,
    MaximumStockLevel INT,
    ReorderPoint INT,
    LastRestockDate DATE,
    PRIMARY KEY (WarehouseID, ProductID)
);
