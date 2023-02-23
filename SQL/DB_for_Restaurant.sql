-- Restaurant Owners
-- 5 Tables
-- 1x Fact, 4x Dimension
-- search google, how to add foreign key
-- write SQL 3-5 queries analyze data
-- 1x subquery/ with

/*
CREATE TABLE orders (
    order_id INT,
    order_date date,
    amount REAL
);

INSERT INTO orders VALUES 
(1, '2022-08-01', 200),
(2, '2022-08-02', 250);

.mode markdown 
.header on   
select * from orders;

-- Fact table

CREATE TABLE  Orders (
    OrderID INT NOT NULL,
    OrderNumber INT NOT NULL,
    PersonID INT,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID)
);

ALTER TABLE Orders
ADD FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID); 
*/


--JOI Restaurant 
-- 1x Fact, 4x Dimension


-- create dimension Table1  

CREATE TABLE joi_customers (
    customer_id INT UNIQUE ,
    customer_name TEXT,
    customer_lastname TEXT,
    customer_gender TEXT,
    customer_age int,
 	  customer_phone TEXT,
  	PRIMARY KEY (customer_id)
);
  INSERT INTO joi_customers VALUES   
    (1, 'Tony','katak','M','21', '123456'),
  	(2, 'Cony','daty','F','23', '654321'),
    (3, 'Jamy','lazzy','M','25', '123123'),
    (4, 'Sony','samsu','M','24', '456456'),
    (5, 'Kany','loto','F','22', '789789'),
    (6, 'Many','haty','F','26', '614752');

SELECT "joi_customers";
SELECT * FROM joi_customers;

-- create dimension Table2 

CREATE TABLE joi_menu (
    menu_id INT NOT NULL,
    menu_name TEXT,
    menu_price real,
    PRIMARY KEY (menu_id)
  );

 INSERT INTO joi_menu VALUES 
    (1, 'Papaya salad',200 ),
    (2, 'Fried rice',300 ),
    (3, 'Congee',400),
    (4, 'Fried chicken',100 ),
    (5, 'Steamed spring roll',50 ),
    (6, 'Spicy fried chicken with basil leaves',250 ),
    (7, 'Minced pork omelet',150 );

SELECT "joi_menu";
SELECT * FROM joi_menu;

-- create dimension Table3 

CREATE TABLE joi_branch (
    branch_id INT NOT NULL ,
    branch_name ,
    chef_id INT ,
    PRIMARY KEY (branch_ID)
);

INSERT INTO joi_branch VALUES 
   (1,'Lat Phrao',2),
   (2,'Ratchathewi',1),
   (3,'Ratchathewi',3),
   (4,'Siam',4);

SELECT "joi_branch";
SELECT * FROM joi_branch;

-- create dimension Table4 

CREATE TABLE joi_chef (
	  chef_id INT UNIQUE,
  	chef_firtname TEXT,
    chef_lastname TEXT,
    chef_nationality TEXT,
  	chef_age TEXT,
 	  chef_salary TEXT,
  	PRIMARY KEY (chef_id)
);

INSERT INTO joi_chef VALUES 
	  (1, 'Ken','dajoi', 'Thai', '34', 25000),
  	(2, 'Micle','majoi', 'Myanmar', '25', 15000),
    (3, 'joden','kajoi', 'Cambodia', '27', 18000);

SELECT joi_chef;
SELECT * FROM joi_chef; 
  
 -- create dimension Table5 
CREATE TABLE joi_payment (
   payment_id INT NOT NULL,
   payment_method TEXT,
   PRIMARY KEY (payment_id)
);
INSERT INTO joi_payment VALUES 
    (1, 'Rabbit Line pay '),
    (2, 'Prompay'),
    (3, 'Credit Card'),
    (4, 'True wallet Card'),
    (5, 'Cash'),
    (6, 'QR Code');

SELECT "joi_payment";
SELECT * FROM joi_payment; 

 -- create dimension Table 6

CREATE TABLE joi_pattern (
    pattern_id INT NOT NULL ,
    pattern_of_dining TEXT,
    PRIMARY KEY (pattern_id)
);
INSERT INTO joi_pattern VALUES
    (1, 'Food Delivery'),
    (2, 'Take-away'),
    (3, 'Dine in');

SELECT "joi_pattern";
SELECT * FROM joi_pattern; 

-- (1 x Fact Table) Create orders table
-- search google, how to add foreign key

CREATE TABLE joi_orders (
    order_id INT NOT NULL PRIMARY KEY,
    customer_id INT,
    menu_id INT,
    branch_id INT,
    chef_id INT,
    payment_id INT,
    pattern_id INT,
    amount real,
  
    FOREIGN KEY (customer_id) REFERENCES joi_customers(customer_id),
    FOREIGN KEY (menu_id)     REFERENCES joi_menu(menu_id),
    FOREIGN KEY (branch_id)   REFERENCES joi_branch(branch_id),
    FOREIGN KEY (chef_id)     REFERENCES joi_chef(chef_id),
    FOREIGN KEY (payment_id)  REFERENCES joi_payment(payment_id),
    FOREIGN KEY (pattern_id)  REFERENCES joi_pattern(pattern_id)

);
-- Insert order table 
INSERT INTO joi_orders VALUES
  
    (0001 , 1 , 1 , 4 , 1 , 5 , 3 , 1000) ,
    (0002 , 2 , 3 , 3 , 2 , 4 , 2 , 550 ) ,
    (0003 , 3 , 2 , 2 , 3 , 3 , 3 , 650 ) ,
    (0004 , 2 , 1 , 1 , 3 , 6 , 1 , 300 ) ,
    (0005 , 5 , 1 , 2 , 2 , 2 , 3 , 150 ) ,
    (0006 , 6 , 3 , 3 , 1 , 3 , 1 , 300 ) ,
    (0007 , 4 , 3 , 3 , 1 , 3 , 1 , 100 ) ,
    (0008 , 4 , 3 , 3 , 1 , 3 , 1 , 50  ) ,
    (0010 , 7 , 2 , 4 , 2 , 1 , 2 , 750 ) ;


.mode markdown
.header on
SELECT "joi_orders";
SELECT * FROM joi_orders;
--DROP TABLE joi_orders


-- write SQL 3-5 queries analyze data

-- Query 1 
--3 TOP menu in joi restaurant ? 
/*
	SELECT 
    	menu_id,
    	menu_name,
        COUNT(*) as n_joimenu
	FROM joi_orders
	GROUP by menu_name 
    ORDER BY  COUNT(*) DESC 
    LIMIT 3;
*/


-- Query 2  
-- Total income > 100 each branch in joi reataurant ?
-- PK = FK 
/*
SELECT
  JB.branch_name,
  sum(JM.price) AS total_income
FROM joi_customers AS JC
JOIN joi_orders AS JO ON JC.customer_id = JO.customer_id
JOIN joi_menu AS JM ON JM.menu_id = JO.menu_id
JOIN joi_branch AS JB on JB.branch_id = JO.branch_id
  
GROUP BY JB.branch_name
HAVING COUNT(*) >=100
ORDER BY total_income DESC;
*/

-- Query 3  TOP joi customer 
/*
SELECT 
   customer_name, 
   SUM(amount) as "Summary of amount"
FROM joi_orders    AS JO 
JOIN joi_customers AS JC
ON JO.customerId = JC.customerId
GROUP by JO.customerId
ORDER by SUM(amount) DESC;
*/

-- Query 4  JOI menu that starting letter T% firstname customer 
/*
SELECT
  JC.customer_name || ' ' || JC.customer_lastname AS Joifull_name,
  JC.customer_gender,
  JC.customer_age,
  JC.customer_phone,
  JM.menu_name
FROM joi_customers AS JC
JOIN joi_orders AS JO ON JC.customer_ID = JO.customer_ID
JOIN joi_menu AS JM ON JM.menu_ID = JO.menu_ID
WHERE Joifull_name LIKE "T%"
ORDER BY Joifull_name
*/

-- 1x subquery/ with
/*
-- Find best selling JOI branch
WITH sub AS(
	SELECT * 
  FROM joi_orders JO 
  join joi_branch JB 
  on JO.branch_id = JB.branch_id
)
SELECT  branch_name,sum(amount) as Amount_price
FROM sub
group by branch_name
ORDER by sum(amount) DESC  
;
