CREATE DATABASE WMS

CREATE TABLE Clients 
(
	ClientId INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Phone VARCHAR(12) CHECK(LEN(Phone)=12) NOT NULL
)

CREATE TABLE Mechanics 
(
	MechanicId INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	[Address] VARCHAR(255) NOT NULL
)

CREATE TABLE Models
(
	ModelId INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(50) NOT NULL UNIQUE,

	
)



CREATE TABLE Jobs 
(
	JobId INT PRIMARY KEY IDENTITY,
	ModelId INT NOT NULL REFERENCES Models(ModelId),
	[Status] VARCHAR(11) NOT NULL CHECK([Status] 
	IN('Pending', 'In Progress','Finished')) DEFAULT 'Pending',
	ClientId INT NOT NULL REFERENCES  Clients(ClientId),
	MechanicId INT REFERENCES Mechanics(MechanicId),
	IssueDate DATE NOT NULL,
	FinishDate DATE 

)

CREATE TABLE Orders 
(
	OrderId INT PRIMARY KEY IDENTITY,
	JobId INT NOT NULL REFERENCES Jobs(JobId),
	IssueDate DATE,
	Delivered BIT NOT NULL DEFAULT 0 


)

CREATE TABLE Vendors
(
	VendorId INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(50) NOT NULL UNIQUE


)

CREATE TABLE Parts
(
	PartId INT PRIMARY KEY IDENTITY,
	SerialNumber VARCHAR(50) NOT NULL UNIQUE,
	[Description] VARCHAR(255),
	Price DECIMAL(6,2) CHECK(Price>0 AND Price<=9999.99),
	VendorId INT NOT NULL REFERENCES Vendors(VendorId),
	StockQty INT NOT NULL CHECK(StockQty>=0) DEFAULT 0


)




CREATE TABLE OrderParts
(
	OrderId INT ,
	PartId INT ,
	Quantity INT NOT NULL CHECK(Quantity>0) default 1
	CONSTRAINT PK_OrderParts
	PRIMARY KEY(OrderId,PartId)
	CONSTRAINT FK_OrderParts_Orders
	FOREIGN KEY (OrderId)
	REFERENCES Orders(OrderId),
	CONSTRAINT FK_OrderParts_Parts
	FOREIGN KEY (PartId)
	REFERENCES Parts(PartId)
	
)

CREATE TABLE PartsNeeded
(
	JobId INT,	
	PartId INT,
	Quantity INT NOT NULL CHECK(Quantity>0) default 1
	CONSTRAINT PK_PartsNeeded
	PRIMARY KEY(JobId,PartId)
	CONSTRAINT FK_PartsNeeded_Jobs
	FOREIGN KEY (JobId)
	REFERENCES Jobs(JobId),
	CONSTRAINT FK_PartsNeeded_Parts
	FOREIGN KEY (PartId)
	REFERENCES Parts(PartId)
	

)



