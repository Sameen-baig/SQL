CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) 

Select * From Manufacturers
Select * From Products

Insert into Manufacturers(Code, Name) Values(1,'Sony')
Insert Into Manufacturers(Code, Name) Values(2,'Creative Labs'),
(3,'Hewlett-Packard'),(4,'Iomega'),(5,'Fujitsu'),(6,'Winchester')
Insert into Products(Code, Name, Price, Manufacturer) Values(1,'Hard drive',240,5),
(2,'DVD',300,4)
Insert Into Products(Code, Name, Price, Manufacturer) Values(3,'Memory',120,6),
(4,'ZIP drive',150,4),(5,'Floppy disk',5,6),(6,'Monitor',240,1)
Insert Into Products(Code, Name, Price, Manufacturer) Values(7,'CD drive',90,2),
(8,'Printer',270,3),(9,'Toner cartridge',66,3),(10,'DVD burner',180,2),(11,'DVD drive',180,2);

--1.Select the names of all the products in the store.
Select Name From Products;
--2.Select the names and the prices of all the products in the store.
Select Name, Price From Products;
--3.Select the name of the products with a price less than or equal to $200.
Select Name From Products Where Price <=200;
--4.Select all the products with a price between $60 and $120.
Select * From Products Where Price>= 60 And Price<=120;
--5.Select the name and price in cents (i.e., the price must be multiplied by 100).
Select Name, Price*100 From Products;
--6.Compute the average price of all the products.
Select avg(Price) From Products;
--7.Compute the average price of all products with manufacturer code equal to 2.
Select avg(Price) From Products Where Manufacturer=2;
--8.Compute the number of products with a price larger than or equal to $180.
Select Price From Products Where Price>=180;
--9.Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
Select Name, Price From Products Where Price>=180 Order By Price DESC, Name;
--10.Select all the data from the products, including all the data for each product's manufacturer.
SELECT * FROM Products, Manufacturers WHERE Products.Manufacturer = Manufacturers.Code;
--11.Select the product name, price, and manufacturer name of all the products.
SELECT Products.Name, Price, Manufacturers.Name FROM Products, Manufacturers
WHERE Products.Manufacturer = Manufacturers.Code;
--12.Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT AVG(Price), Manufacturer FROM Products GROUP BY Manufacturer;
--13.Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT AVG(Price), Manufacturers.Name FROM Products, Manufacturers 
WHERE Products.Manufacturer = Manufacturers.Code GROUP BY Manufacturers.Name;
--14.Select the names of manufacturer whose products have an average price larger than or equal to $150.
select avg(Price), Manufacturers.Name from Products, Manufacturers WHERE Products.Manufacturer = Manufacturers.Code
GROUP BY Manufacturers.Name HAVING AVG(Price) >= 150;
--15.Select the name and price of the cheapest product.
Select Name, Price From Products ORDER BY price ASC LIMIT 1;
--16.Select the name of each manufacturer along with the name and price of its most expensive product.
Select Manufacturers.Name From Manufacturers, Products Where Products.Manufacturer=Manufacturers.Code Order By
price DESC limit 1;
--17.Add a new product: Loudspeakers, $70, manufacturer 2.
Insert into Products(Code,Name,Price,Manufacturer) Values(12,'Loud Spraker',70,2)
--18.Update the name of product 8 to "Laser Printer".
Update Products Set Name = 'Laser Printer' Where Code=8;
--16.Select the name of each manufacturer along with the name and price of its most expensive product.
Select Name, Price From Products ORDER BY price DESC LIMIT 1;
--19.Apply a 10% discount to all products.
UPDATE Products SET Price = Price - (Price * 0.1);
--20.Apply a 10% discount to all products with a price larger than or equal to $120.
UPDATE Products SET Price = Price - (Price * 0.1) Where Price>=120;
