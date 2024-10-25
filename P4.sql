Create table Warehouses (
	Code integer Primary Key Not Null,
	Location Text Not Null,
	Capacity integer Not Null
);

Create table Boxes (
	Code text Primary Key Not Null,
	Contents text Not Null,
	Value Real Not Null,
	Warehouse integer Not Null,
	CONSTRAINT fk_Warehouses_Code FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
);

INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
 
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);

--3.1 Select all warehouses.
select * from Warehouses
--3.2 Select all boxes with a value larger than $150.
Select * from Boxes where value>150 Order By warehouse ASC;
--3.3 Select all distinct contents in all the boxes.
Select distinct Contents from Boxes;
--3.4 Select the average value of all the boxes.
Select avg(Value) As "Average" from Boxes;
--3.5 Select the warehouse code and the average value of the boxes in each warehouse.
select warehouse, avg(Value) from Boxes group by Warehouse; 
--3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
select warehouse, avg(Value) from Boxes group by Warehouse having avg(Value)>150; 
--3.7 Select the code of each box, along with the name of the city the box is located in.
select Boxes.Code, Location from Warehouses inner join Boxes on Warehouses.Code = Boxes.Warehouse;
--3.8 Select the warehouse codes, along with the number of boxes in each warehouse. 
    -- Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
--3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
--3.10 Select the codes of all the boxes located in Chicago.
Select Boxes.Code from Warehouses right join Boxes on Warehouses.Code = Boxes.Warehouse where Location='Chicago';
--3.11 Create a new warehouse in New York with a capacity for 3 boxes.
--3.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
--3.13 Reduce the value of all boxes by 15%.
--3.14 Remove all boxes with a value lower than $100.
-- 3.15 Remove all boxes from saturated warehouses.
-- 3.16 Add Index for column "Warehouse" in table "boxes"
    -- !!!NOTE!!!: index should NOT be used on small tables in practice
-- 3.17 Print all the existing indexes
