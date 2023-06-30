-- Customer table
CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  MiddleName VARCHAR(50),
  LastName VARCHAR(50),
  Title VARCHAR(50),
  TelephoneNumber VARCHAR(20),
  Address VARCHAR(100)
);

-- Employee table
CREATE TABLE Employee (
  EmployeeID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  MiddleName VARCHAR(50),
  LastName VARCHAR(50),
  Address VARCHAR(100),
  TelephoneNumber VARCHAR(20),
  Salary DECIMAL(10, 2)
);

-- Driver table
CREATE TABLE Driver (
  DriverID INT PRIMARY KEY,
  Named VARCHAR(50),
  TelephoneNumber VARCHAR(20),
  HourlySalary DECIMAL(10, 2)
);

-- Order table
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  EmployeeID INT,
  DriverID INT,
  Dateo DATE,
  Timeo TIME,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
  FOREIGN KEY (DriverID) REFERENCES Driver(DriverID)
);

-- MenuItem table
CREATE TABLE MenuItem (
  MenuItemID INT PRIMARY KEY,
  Namem VARCHAR(100),
  Descriptionm VARCHAR(200),
  MenuPrice DECIMAL(10, 2),
  SpecialRequests VARCHAR(200)
);

-- LineItem table
CREATE TABLE LineItem (
  LineItemID INT PRIMARY KEY,
  OrderID INT,
  MenuItemID INT,
  Quantity INT,
  SalePrice DECIMAL(10, 2),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (MenuItemID) REFERENCES MenuItem(MenuItemID)
);



-- StandardItem table
CREATE TABLE StandardItem (
  MenuItemID INT PRIMARY KEY,
  PortionSize VARCHAR(20),
  FOREIGN KEY (MenuItemID) REFERENCES MenuItem(MenuItemID)
);

-- CustomPizza table
CREATE TABLE CustomPizza (
  MenuItemID INT PRIMARY KEY,
  PizzaDiameter DECIMAL(5, 2),
  CrustType VARCHAR(20),
  CrustFlavor VARCHAR(20),
  FOREIGN KEY (MenuItemID) REFERENCES MenuItem(MenuItemID)
);

-- Topping table
CREATE TABLE Topping (
  ToppingID INT PRIMARY KEY,
  Typet VARCHAR(50),
  PizzaDiameter DECIMAL(5, 2),
  Price DECIMAL(10, 2)
);

-- MenuItemTopping table (for the many-to-many relationship between MenuItem and Topping)
CREATE TABLE MenuItemTopping (
  MenuItemID INT,
  ToppingID INT,
  FOREIGN KEY (MenuItemID) REFERENCES MenuItem(MenuItemID),
  FOREIGN KEY (ToppingID) REFERENCES Topping(ToppingID),
  PRIMARY KEY (MenuItemID, ToppingID)
);

INSERT INTO customer (CustomerID, FirstName, MiddleName, LastName, Title, TelephoneNumber, Address)
VALUES
  ('11101', 'Mohsen', 'abdelfattah', 'ahmed', 'Mr.', 01012312321, 'roshdy'),
  ('11102', 'Magued', '', 'ahmed', 'Mr.', 01025554051, 'fleming'),
  ('11103', 'Ahmed', 'abdelrahman', 'ibrahim', 'Mr.', 01025554065, 'loran'),
  ('11104', 'Mohamed', 'abdelallah', 'ahmed', 'Mr.', 01023254051, 'Miami'),
  ('11105', 'Tarek', 'salem', 'ahmed', 'Mr.', 01225554051, 'semouha'),
  ('11106', 'Fathy', 'mohamed', 'ahmed', 'Mr.', 01025556486, 'sporting'),
  ('11107', 'Salma', 'mohamed', 'ahmed', 'Mrs.', 01025126486, 'Janakliss'),
  ('11108', 'Maryam', 'mohamed', 'ibrahim', 'Mrs.', 01025776486, 'gleem'),
  ('11113', 'Aya', 'Mohamed', 'Hassan', 'Miss', '01025887766', 'bakos'),
  ('11114', 'Hesham', 'Ali', 'Ahmed', 'Mr.', '01025556666', 'bokla'),
  ('11115', 'Nada', 'Ibrahim', 'Salem', 'Mrs.', '01025117777', 'shatbi'),
  ('11116', 'Omar', 'Khalid', 'Abdelrahman', 'Mr.', '01025886666', 'ras at tin'),
  ('11117', 'Rania', 'Hussein', 'Mohamed', 'Mrs.', '01025559999', 'karmus'),
  ('11118', 'Khaled', 'Ahmed', 'Saleh', 'Mr.', '01025551111', 'labban'),
  ('11109', 'Merna', 'ahmed', 'attia', 'Mrs.', 01025558886, 'Moharam bek'),
  ('1110','Fady','Sherif','Tawfik','Mr.',01025558236,'Shutz');

INSERT INTO Employee (EmployeeID, FirstName, MiddleName, LastName, Address, TelephoneNumber, Salary)
VALUES
  ('12301', 'Atef', 'ahmed', 'attia', 'Moharam bek', '01025768886', '6700'),
  ('12302', 'Mohamed', 'ahmed', 'salem', 'semouha', '01505768886', '7000'),
  ('12303', 'Fady', 'Mohsen', 'abdelsattar', 'gleem', '01024448886', '6700'),
  ('12304', 'Fathy', 'ahmed', 'farouk', 'ibrahimya', '01025761116', '8000'),
  ('12305', 'Farouk', 'ahmed', 'fares', 'sporting', '0102512346', '7000'),
  ('12306', 'Ahmed', 'attef', 'salem', 'Janakliss', '01025768333', '7000'),
  ('12307', 'Alaa', 'fares', 'ibrahim', 'Gleem', '01025678886', '8000'),
  ('12308', 'Abdelsamad', 'abdelsattar', 'attia', 'Moharam bek', '01025234886', '6700');

INSERT INTO Driver (DriverID, Named, TelephoneNumber, HourlySalary)
VALUES
  ('12201', 'Abdelsamad', '01225234886', '15'),
  ('12202', 'Mohsen', '01225444886', '15'),
  ('12203', 'Fares', '0122555886', '15'),
  ('12204', 'Attia', '01225284886', '15');

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, DriverID, Dateo, Timeo)
VALUES
  (1, 11101, 12305, 12204, '2023-05-01', '09:30:00'),
  (2, 11105, 12305, 12202, '2023-05-02', '14:45:00'),
  (3, 11107, 12304, 12204, '2023-05-03', '18:15:00'),
  (4, 11102, 12306, 12201, '2022-04-04', '12:00:00'),
  (5, 11102, 12306, 12201, '2021-05-19', '21:00:00'),
  (6, 11102, 12306, 12201, '2021-01-04', '14:35:50'),
  (7, 11102, 12306, 12201, '2020-06-29', '16:10:00'),
  (8, 11102, 12306, 12201, '2019-05-07', '18:40:00'),
  (9, 11102, 12306, 12201, '2020-08-11', '19:20:00'),
  (10, 11109, 12307, 12202, '2022-02-14', '20:30:00');
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, DriverID, Dateo, Timeo)
VALUES
  (12, 1110, 12301, 12201, '2023-01-05', '15:09:00'),
  (13, 1110, 12301, 12201, '2023-02-09', '14:07:00'),
  (14, 1110, 12301, 12201, '2023-06-02', '18:01:00'),
  (15, 1110, 12301, 12201, '2023-08-05', '23:04:00');

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, DriverID, Dateo, Timeo)
VALUES
  (16, 11101, 12304, 12201, '2022-11-05', '20:09:00'),
  (17, 11102, 12305, 12202, '2022-10-09', '21:07:00'),
  (18, 11103, 12306, 12203, '2022-09-02', '23:01:00'),
  (19, 11104, 12307, 12204, '2022-02-05', '13:04:00');
INSERT INTO MenuItem (MenuItemID, Namem, Descriptionm, MenuPrice, SpecialRequests)
VALUES
	(1, 'Pepperoni Pizza', 'Classic pizza with pepperoni toppings', 10.99, 'Extra cheese'),
    (2, 'Margherita Pizza', 'Traditional pizza with fresh mozzarella and basil', 9.99, NULL),
    (3, 'BBQ Chicken Pizza', 'Pizza topped with BBQ chicken, onions, and BBQ sauce', 12.99, 'No onions'),
    (4, 'Vegetable Deluxe Pizza', 'Pizza loaded with a variety of fresh vegetables', 11.99, NULL),
    (5, 'Meat Lovers Pizza', 'Pizza with a combination of various meat toppings', 13.99, 'Extra sausages' ),
    (6, 'Hawaiian Pizza', 'Pizza with ham, pineapple, and cheese', 11.99, 'No cheese'),
    (7, 'Mushroom Pizza', 'Pizza topped with fresh mushrooms', 10.99, NULL),
    (8, 'Supreme Pizza', 'Pizza with a combination of various toppings', 13.99, 'Extra olives'),
    (9, 'Buffalo Chicken Pizza', 'Pizza topped with buffalo chicken and ranch sauce', 12.99, NULL),
    (10, 'Spinach and Feta Pizza', 'Pizza with spinach, feta cheese, and olives', 11.99, NULL),
    (11, 'Pepperoni Calzone', 'Folded pizza dough filled with pepperoni and cheese', 9.99, 'Extra sauce'),
    (12, 'Garlic Bread', 'Toasted bread with garlic butter', 4.99, 'Add cheese'),
    (13, 'Chicken Alfredo Pasta', 'Pasta with creamy alfredo sauce and grilled chicken', 12.99, NULL),
    (14, 'Caesar Salad', 'Fresh romaine lettuce with Caesar dressing and croutons', 8.99, 'Add grilled chicken'),
    (15, 'Cheesecake', 'Creamy dessert with a graham cracker crust', 6.99, NULL);
  
INSERT INTO LineItem (LineItemID, OrderID, MenuItemID, Quantity, SalePrice)
VALUES
  (1, 1, 2, 2, 19.98),
  (2, 2, 3, 1, 12.99),
  (3, 3, 1, 1, 10.99),
  (4, 4, 4, 3, 35.97),
  (5, 5, 5, 2, 27.98),
  (6, 6, 12, 2, 9.99),
  (7, 7, 14, 2, 23.99),
  (8, 8, 15, 2, 13.99);
INSERT INTO LineItem (LineItemID, OrderID, MenuItemID, Quantity, SalePrice)
VALUES
	(16,19,3,2,20.99),
    (13,16,4,2,24.00);
INSERT INTO LineItem (LineItemID, OrderID, MenuItemID, Quantity, SalePrice)
VALUES
	(1,15,6,7,83.93),
    (9,15,9,2,24.00);
INSERT INTO StandardItem (MenuItemID, PortionSize)
VALUES
  (1, 'Regular'),
  (2, 'Small'),
  (3, 'Large'),
  (4, 'Medium'),
  (5, 'Xtra Large');
  
INSERT INTO CustomPizza (MenuItemID, PizzaDiameter, CrustType, CrustFlavor)
VALUES
  (1, 12.0, 'Thin Crust', 'Garlic'),
  (2, 14.0, 'Pan Crust', 'Herb'),
  (3, 10.0, 'Stuffed Crust', 'Cheese'),
  (4, 16.0, 'Thin Crust', 'Onion'),
  (5, 12.0, 'Hand-Tossed Crust', 'Butter'),
  (6, 12.0, 'Thin Crust', 'Pepper'),
  (7, 14.0, 'Pan Crust', 'Garlic Parmesan'),
  (8, 10.0, 'Stuffed Crust', 'Sausage'),
  (9, 16.0, 'Thin Crust', 'Basil Pesto'),
  (10, 12.0, 'Hand-Tossed Crust', 'Ranch'),
  (11, 14.0, 'Thin Crust', 'Barbecue'),
  (12, 10.0, 'Pan Crust', 'Honey Mustard'),
  (13, 16.0, 'Hand-Tossed Crust', 'Buffalo'),
  (14, 12.0, 'Stuffed Crust', 'Chipotle'),
  (15, 14.0, 'Thin Crust', 'Teriyaki');
  
INSERT INTO Topping (ToppingID, Typet, PizzaDiameter, Price)
VALUES
  (1, 'Pepperoni', 12.0, 1.99),
  (2, 'Mushrooms', 14.0, 1.49),
  (3, 'Onions', 10.0, 0.99),
  (4, 'Bell Peppers', 16.0, 1.29),
  (5, 'Olives', 12.0, 1.79),
  (6, 'Ham', 12.0, 2.49),
  (7, 'Pineapple', 14.0, 1.99),
  (8, 'Bacon', 10.0, 2.99),
  (9, 'Tomatoes', 16.0, 1.49),
  (10, 'Jalapenos', 12.0, 0.99),
  (11, 'Spinach', 14.0, 1.29),
  (12, 'Chicken', 10.0, 2.79),
  (13, 'Feta Cheese', 16.0, 1.99),
  (14, 'Parmesan Cheese', 12.0, 1.49),
  (15, 'Basil', 14.0, 0.99);
  

INSERT INTO MenuItemTopping (MenuItemID, ToppingID)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 1),
  (5, 7),
  (6, 7),
  (7, 7),
  (8, 2),
  (9, 2),
  (10, 2);
INSERT INTO MenuItemTopping (MenuItemID, ToppingID)
VALUES
  (1, 2),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 4),
  (6, 4),
  (7, 4);
INSERT INTO MenuItemTopping (MenuItemID, ToppingID)
VALUES
	(8,8);
  
select * from customer ;  
select * from Employee ;  
select * from Driver ;
select * from Orders ;   
select * from MenuItem ;
select * from LineItem ;
select * from StandardItem ;
select * from CustomPizza ;
select * from Topping ;
select * from MenuItemTopping ;

-- fady
-- 1 
SELECT * FROM Orders WHERE YEAR(Dateo) = 2023 GROUP BY OrderID HAVING COUNT(*) < 3;

-- 2 
SELECT MenuItemID, COUNT(*) AS TotalOrders FROM LineItem JOIN Orders ON LineItem.OrderID = Orders.OrderID WHERE YEAR(Dateo) = 2023 AND MenuItemID IN (SELECT MenuItemID FROM StandardItem) GROUP BY MenuItemID ORDER BY TotalOrders DESC LIMIT 1;

SELECT si.MenuItemID, m.Namem AS MenuItemName, SUM(li.Quantity) AS TotalQuantity
FROM LineItem li
JOIN Orders o ON li.OrderID = o.OrderID
JOIN MenuItem m ON li.MenuItemID = m.MenuItemID
JOIN StandardItem si ON m.MenuItemID = si.MenuItemID
WHERE YEAR(o.Dateo) = 2023
GROUP BY si.MenuItemID, m.Namem
ORDER BY TotalQuantity DESC;

-- 3 
SELECT Employee.FirstName, COUNT(*) AS TotalOrders FROM Orders
JOIN Employee ON Orders.EmployeeID = Employee.EmployeeID GROUP BY Employee.FirstName
ORDER BY TotalOrders DESC LIMIT 1;

SELECT e.FirstName, e.MiddleName, COUNT(o.OrderID) AS TotalOrders
FROM Orders o
JOIN Employee e ON o.EmployeeID = e.EmployeeID
GROUP BY e.FirstName, e.MiddleName
ORDER BY TotalOrders DESC
LIMIT 1;


-- 4
SELECT Customer.FirstName, AVG(LineItem.SalePrice) AS AverageOrderValue FROM 
Orders JOIN Customer ON Orders.CustomerID = Customer.CustomerID
JOIN LineItem ON Orders.OrderID = LineItem.OrderID GROUP BY Customer.FirstName;

-- 5
SELECT t.Typet, COUNT(cp.ToppingID) AS TotalOrders
FROM CustomPizza cp
JOIN Topping t ON cp.ToppingID = t.ToppingID
JOIN Orders o ON cp.OrderID = o.OrderID
WHERE YEAR(o.OrderDate) = 2022
GROUP BY cp.ToppingID
ORDER BY TotalOrders DESC
LIMIT 1;


SELECT T.Typet AS PopularTopping, COUNT(*) AS ToppingCount
FROM LineItem LI
JOIN MenuItemTopping MIT ON LI.MenuItemID = MIT.MenuItemID
JOIN Topping T ON MIT.ToppingID = T.ToppingID
JOIN CustomPizza CP ON LI.MenuItemID = CP.MenuItemID
WHERE YEAR(LI.OrderID IN (
    SELECT OrderID
    FROM Orders
    WHERE YEAR(Dateo) = 2022
  ))
GROUP BY T.Typet
ORDER BY ToppingCount DESC
LIMIT 1;

SELECT T.Typet, COUNT(*) AS ToppingCount
FROM Orders O
JOIN LineItem LI ON O.OrderID = LI.OrderID
JOIN CustomPizza CP ON LI.MenuItemID = CP.MenuItemID
JOIN MenuItemTopping MT ON CP.MenuItemID = MT.MenuItemID
JOIN Topping T ON MT.ToppingID = T.ToppingID
WHERE YEAR(O.Dateo) = 2022
GROUP BY T.Typet
ORDER BY ToppingCount DESC
;
SELECT t.Typet, COUNT(*) AS ToppingCount
FROM Topping t
JOIN MenuItemTopping mt ON t.ToppingID = mt.ToppingID
JOIN CustomPizza cp ON mt.MenuItemID = cp.MenuItemID
JOIN LineItem li ON cp.MenuItemID = li.MenuItemID
JOIN Orders o ON li.OrderID = o.OrderID
WHERE YEAR(o.Dateo) = 2022
GROUP BY t.Typet
ORDER BY ToppingCount DESC
;


