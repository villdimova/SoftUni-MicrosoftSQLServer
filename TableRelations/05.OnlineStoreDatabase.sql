

CREATE TABLE ItemTypes
(
	ItemTypeID INT PRIMARY KEY,
	[Name] VARCHAR(50) 
)
CREATE TABLE Items
(
	ItemID INT PRIMARY KEY,
	[Name] VARCHAR(50),
	ItemTypeID INT FOREIGN KEY REFERENCES ItemTypes(ItemTypeId)
)

CREATE TABLE Cities
(
	CityID INT PRIMARY KEY ,
	[Name] VARCHAR(50) 
)
CREATE TABLE Customers
(
	CustomerID INT PRIMARY KEY ,
	[Name] VARCHAR(50),
	Birthday DATE,
	CityID INT FOREIGN KEY REFERENCES Cities(CityID)
)

CREATE TABLE Orders
(
	OrderID INT PRIMARY KEY ,
	CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID) 
)
CREATE TABLE OrderItems
(
	OrderID INT ,
	ItemID INT
	PRIMARY KEY(OrderID,ItemID)
	FOREIGN KEY(OrderID) REFERENCES Items(ItemID),
	FOREIGN KEY(ItemID) REFERENCES Orders(OrderID)
)


