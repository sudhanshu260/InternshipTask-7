create database custord;

use custord;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers VALUES
(1, 'Sudhanshu', 'Delhi'),
(2, 'subham', 'Mumbai'),
(3, 'Himanshu', 'Chennai'),
(4, 'Ayoosh', 'Kolkata');

INSERT INTO Orders VALUES
(101, 1, 'Laptop', 60000),
(102, 2, 'Phone', 25000),
(103, 1, 'Mouse', 1200),
(104, 3, 'Keyboard', 2000),
(105, 5, 'Monitor', 15000);


INSERT INTO Customers VALUES
(5, 'Shital', 'Pune'),
(6, 'Deepu', 'Bangalore');
  
  
create view customerorders as
select c.customer_id, c.customer_name, c.city, o.order_id, o.product, o.amount
from customers c
join orders o on c.customer_id = o.customer_id;

select * from customerorders;

create view highvalueorders as
select * from orders
where amount > 10000;

select * from highvalueorders;

create view customertotalamount as
select c.customer_name, sum(o.amount) as total_amount
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_name;

select * from customertotalamount;

create view customerswithoutorders as
select *
from customers
where customer_id not in (select customer_id from orders);

select * from customerswithoutorders;

create view delhicustomers as
select * from customers
where city = 'delhi'
with check option;
